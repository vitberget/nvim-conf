local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("rust", {
    s("trigger", {
        t("Trigger!!!"),
    })
})

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
    return sn( nil, c(1, {
        -- Order is important, sn(...) first would cause infinite loop of expansion.
        t(""),
        sn(nil, { t({ "", "\t\\item "  }), i(1), d(2, rec_ls, {})  }),
    }))
end

ls.add_snippets("tex", {
    -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
    -- \item as necessary by utilizing a choiceNode.
    s("itemize", {
        t({ "\\begin{itemize}", "\t\\item "  }),
        i(1),
        d(2, rec_ls, {}),
        t({ "", "\\end{itemize}"  }),

    }),
}, {
    key = "tex",
})
