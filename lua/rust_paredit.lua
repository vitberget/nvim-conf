-- rust_paredit.lua — Tree-sitter based slurp/barf for Rust blocks in Neovim.
--
--   :RustSlurp  [count]  pull the next statement(s) into the block   (>})
--   :RustBarf   [count]  push the last statement(s) out of the block (<})
--   :RustSlurpBack [count]  pull the previous statement(s) into the block (<{)
--   :RustBarfBack  [count]  push the first statement(s) out before it   (>{)
--
-- Requires the Tree-sitter "rust" parser (e.g. :TSInstall rust).
-- Usage:  require("rust_paredit").setup()

local M = {}

local api = vim.api
local ns = api.nvim_create_namespace("rust_paredit")

M.config = {
  keymaps = { slurp = ">}", barf = "<}", slurp_back = "<{", barf_back = ">{" }, -- set to false to skip mappings
  reindent = true,                          -- run `=` over the touched code
}

-- Nodes whose children are "statements".
local CONTAINERS = { block = true, source_file = true, declaration_list = true }

local function is_comment(node)
  return node:type():match("comment$") ~= nil
end

local function parse(buf)
  local ok, parser = pcall(vim.treesitter.get_parser, buf, "rust")
  if not ok or not parser then
    error("rust_paredit: no Tree-sitter rust parser for this buffer", 0)
  end
  parser:parse()
end

-- For a node, return the block whose `}` is the "outermost/last" one,
-- e.g. for `if a {} else if b {} else {}` the final else block.
local function last_block_of(node)
  local t = node:type()
  if t == "block" then
    return node
  elseif t == "if_expression" then
    local alt = node:field("alternative")[1]
    if alt then return last_block_of(alt) end
    return node:field("consequence")[1]
  elseif t == "else_clause" then
    local child = node:named_child(0)
    return child and last_block_of(child)
  end
  local body = node:field("body")[1]
  if body and body:type() == "block" then return body end
  return nil
end

local function find_block(buf, row, col)
  local node = vim.treesitter.get_node({ bufnr = buf, pos = { row, col } })
  while node do
    local b = last_block_of(node)
    if b then return b end
    node = node:parent()
  end
end

-- The statement-level node (direct child of a block/file/impl) that owns `node`.
local function statement_of(node)
  while node:parent() and not CONTAINERS[node:parent():type()] do
    node = node:parent()
  end
  return node
end

local function close_brace(block)
  local last = block:child(block:child_count() - 1)
  if last and last:type() == "}" then return last end
end

-- Extend `node` with trailing comments that start on the same line it ends.
local function with_trailing_comments(node)
  local last = node
  local nxt = last:next_named_sibling()
  while nxt and is_comment(nxt) and nxt:start() == select(1, last:end_()) do
    last, nxt = nxt, nxt:next_named_sibling()
  end
  return last
end

local function line(buf, row)
  return api.nvim_buf_get_lines(buf, row, row + 1, true)[1]
end

-- Text from the `}` to the end of the statement: "}", "};", "});", "}\n}" ...
-- Refuses if anything other than closers/semicolons follows (e.g. `else {}`).
local function closing_text(buf, brace, stmt)
  local br, bc = brace:start()
  local _, _, er, ec = brace:range()
  local sr, sc = stmt:end_()
  local tail = table.concat(api.nvim_buf_get_text(buf, er, ec, sr, sc, {}), "\n")
  if not tail:match("^[%s%)%]};,]*$") then return nil end
  return api.nvim_buf_get_text(buf, br, bc, sr, sc, {}), { br, bc, sr, sc }
end

-- Delete a range; drop the whole line(s) if nothing else is on them.
local function delete_range(buf, sr, sc, er, ec)
  local first, last = line(buf, sr), line(buf, er)
  local prefix, suffix = first:sub(1, sc), last:sub(ec + 1)
  if prefix:match("^%s*$") and suffix:match("^%s*$") then
    api.nvim_buf_set_lines(buf, sr, er + 1, true, {})
  else
    sc = #(prefix:gsub("%s+$", ""))
    if suffix:match("^%s*$") then ec = #last end
    api.nvim_buf_set_text(buf, sr, sc, er, ec, {})
  end
end

-- Insert closing text on a new line after (row, col).
local function insert_closing(buf, row, col, indent, closing)
  local lines = { "" }
  for i, l in ipairs(closing) do
    lines[#lines + 1] = (i == 1) and (indent .. l) or l
  end
  api.nvim_buf_set_text(buf, row, col, row, col, lines)
end

local function reindent(buf, mark)
  if not M.config.reindent then return end
  parse(buf)
  local pos = api.nvim_buf_get_extmark_by_id(buf, ns, mark, {})
  local block = find_block(buf, pos[1], pos[2])
  if not block then return end
  local stmt = statement_of(block)
  local sr = stmt:start()
  local prev = stmt:prev_named_sibling()
  if prev then sr = prev:start() end
  local er = stmt:end_()
  local nxt = stmt:next_named_sibling()
  if nxt then er = nxt:end_() end
  vim.cmd(("silent keepjumps normal! %dG=%dG"):format(sr + 1, er + 1))
end

local function slurp_once(buf, block)
  local brace = close_brace(block)
  if not brace then return false, "block has no closing brace" end
  local stmt = statement_of(block)

  -- Next statement after `stmt`, skipping comments trailing on the same line.
  local nxt = stmt:next_named_sibling()
  local stmt_end_row = stmt:end_()
  while nxt and is_comment(nxt) and nxt:start() == stmt_end_row do
    nxt = nxt:next_named_sibling()
  end
  if not nxt then return false, "nothing to slurp" end
  local last = with_trailing_comments(nxt)

  local closing, r = closing_text(buf, brace, stmt)
  if not closing then return false, "block is followed by more code (else/arm/chain)" end

  local indent = line(buf, stmt:start()):match("^%s*")
  local nr, nc = last:end_()

  -- Edit bottom-up so earlier positions stay valid.
  insert_closing(buf, nr, nc, indent, closing)
  delete_range(buf, r[1], r[2], r[3], r[4])
  return true
end

local function barf_once(buf, block)
  local brace = close_brace(block)
  if not brace then return false, "block has no closing brace" end
  local stmt = statement_of(block)

  -- Group block children into items (statement + same-line trailing comments).
  local items = {}
  for i = 0, block:named_child_count() - 1 do
    local child = block:named_child(i)
    local prev = items[#items]
    if prev and is_comment(child) and child:start() == select(1, prev.last:end_()) then
      prev.last = child
    else
      items[#items + 1] = { first = child, last = child }
    end
  end
  if #items == 0 then return false, "nothing to barf" end

  local closing, r = closing_text(buf, brace, stmt)
  if not closing then return false, "block is followed by more code (else/arm/chain)" end

  local anchor = items[#items - 1]
  local ar, ac
  if anchor then
    ar, ac = anchor.last:end_()
  else
    local _, _, oer, oec = block:child(0):range() -- the `{`
    ar, ac = oer, oec
  end
  local indent = line(buf, stmt:start()):match("^%s*")

  -- Edit bottom-up: remove old closing first, then insert the new one.
  delete_range(buf, r[1], r[2], r[3], r[4])
  insert_closing(buf, ar, ac, indent, closing)
  return true
end

-- Previous statement item before `node` (including a comment trailing it on
-- the same line). Returns first, last nodes.
local function prev_item(node)
  local last = node:prev_named_sibling()
  if not last then return nil end
  local first = last
  while is_comment(first) do
    local p = first:prev_named_sibling()
    if p and select(1, p:end_()) == first:start() then first = p else break end
  end
  return first, last
end

local function text_of(buf, first, last)
  local sr, sc = first:start()
  local er, ec = last:end_()
  return api.nvim_buf_get_text(buf, sr, sc, er, ec, {}), { sr, sc, er, ec }
end

local function slurp_back_once(buf, block)
  local open = block:child(0)
  if not open or open:type() ~= "{" then return false, "block has no opening brace" end
  local stmt = statement_of(block)
  local first, last = prev_item(stmt)
  if not first then return false, "nothing to slurp backward" end
  if select(1, last:end_()) == stmt:start() then
    return false, "previous statement is on the same line"
  end

  local text, r = text_of(buf, first, last)
  local _, _, oer, oec = open:range()

  -- Insert after `{` first (later in buffer), then delete the original.
  local lines = { "" }
  vim.list_extend(lines, text)
  api.nvim_buf_set_text(buf, oer, oec, oer, oec, lines)
  delete_range(buf, r[1], r[2], r[3], r[4])
  return true
end

local function barf_back_once(buf, block)
  local item = block:named_child(0)
  if not item then return false, "nothing to barf backward" end
  local last = with_trailing_comments(item)
  local stmt = statement_of(block)

  local text, r = text_of(buf, item, last)
  local sr = stmt:start()
  local indent = line(buf, sr):match("^%s*")
  text[1] = indent .. text[1]

  -- Delete from the block first (later in buffer), then insert above stmt.
  delete_range(buf, r[1], r[2], r[3], r[4])
  api.nvim_buf_set_lines(buf, sr, sr, true, text)
  return true
end

local function run(op, count)
  local buf = api.nvim_get_current_buf()
  local ok, err = pcall(parse, buf)
  if not ok then return vim.notify(err, vim.log.levels.ERROR) end

  local cur = api.nvim_win_get_cursor(0)
  local block = find_block(buf, cur[1] - 1, cur[2])
  if not block then return vim.notify("rust_paredit: no enclosing block", vim.log.levels.WARN) end

  -- Extmarks track the cursor and the block's `{` across edits.
  local cur_mark = api.nvim_buf_set_extmark(buf, ns, cur[1] - 1, cur[2], {})
  local br, bc = block:start()
  local blk_mark = api.nvim_buf_set_extmark(buf, ns, br, bc, {})

  local changed = false
  for _ = 1, math.max(count or 1, 1) do
    parse(buf)
    local pos = api.nvim_buf_get_extmark_by_id(buf, ns, blk_mark, {})
    block = find_block(buf, pos[1], pos[2])
    if not block then break end
    local did, msg = op(buf, block)
    if not did then
      if not changed then vim.notify("rust_paredit: " .. msg, vim.log.levels.INFO) end
      break
    end
    changed = true
  end

  if changed then reindent(buf, blk_mark) end

  local p = api.nvim_buf_get_extmark_by_id(buf, ns, cur_mark, {})
  pcall(api.nvim_win_set_cursor, 0, { p[1] + 1, p[2] })
  api.nvim_buf_del_extmark(buf, ns, cur_mark)
  api.nvim_buf_del_extmark(buf, ns, blk_mark)
end

function M.slurp(count) run(slurp_once, count) end
function M.barf(count) run(barf_once, count) end
function M.slurp_back(count) run(slurp_back_once, count) end
function M.barf_back(count) run(barf_back_once, count) end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  api.nvim_create_user_command("RustSlurp", function(o) M.slurp(o.count) end,
    { count = 1, desc = "Slurp next statement into Rust block" })
  api.nvim_create_user_command("RustBarf", function(o) M.barf(o.count) end,
    { count = 1, desc = "Barf last statement out of Rust block" })

  api.nvim_create_user_command("RustSlurpBack", function(o) M.slurp_back(o.count) end,
    { count = 1, desc = "Slurp previous statement into Rust block" })
  api.nvim_create_user_command("RustBarfBack", function(o) M.barf_back(o.count) end,
    { count = 1, desc = "Barf first statement out before Rust block" })

  local km = M.config.keymaps
  if km then
    api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      group = api.nvim_create_augroup("rust_paredit", { clear = true }),
      callback = function(ev)
        if km.slurp then
          vim.keymap.set("n", km.slurp, function() M.slurp(vim.v.count1) end,
            { buffer = ev.buf, desc = "Rust slurp" })
        end
        if km.barf then
          vim.keymap.set("n", km.barf, function() M.barf(vim.v.count1) end,
            { buffer = ev.buf, desc = "Rust barf" })
        end
        if km.slurp_back then
          vim.keymap.set("n", km.slurp_back, function() M.slurp_back(vim.v.count1) end,
            { buffer = ev.buf, desc = "Rust slurp backward" })
        end
        if km.barf_back then
          vim.keymap.set("n", km.barf_back, function() M.barf_back(vim.v.count1) end,
            { buffer = ev.buf, desc = "Rust barf backward" })
        end
      end,
    })
  end
end

return M
