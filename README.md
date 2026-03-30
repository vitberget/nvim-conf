# Neovim config

## Install deps

* `git`
* `xxd`
* `ripgrep`
* `fzf`
* `cargo install tree-sitter-cli`

See (or run) [install-deps.sh](install-deps.sh) for more information.

## `tmux.conf`

```sh
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n C-w if-shell "$is_vim" "send-keys C-w" "switch-client -Ttable1"
bind-key -Ttable1 'h' select-pane -L
bind-key -Ttable1 'j' select-pane -D
bind-key -Ttable1 'k' select-pane -U
bind-key -Ttable1 'l' select-pane -R
```

## Jenkins linter conf

```sh
export JENKINS_URL=https://my.jenkins.hostname/
export JENKINS_USER_ID=jenkins_user
export JENKINS_PASSWORD=secret
```

## Python / pyright - multifile

```sh
# in root folder of python
touch pyrightconfig.json
```

## Help ?

* LSP <https://vonheikemen.github.io/learn-nvim/feature/lsp-setup.html>

## Consider

* [neotest](https://github.com/nvim-neotest/neotest)
* swap-words using more proper nvim lua api
* Other OpenCL highlighting?
* <https://github.com/nvim-telescope/telescope-dap.nvim>
* <https://github.com/camgraff/telescope-tmux.nvim>
* dadbod
* Perf
    * <https://github.com/t-troebst/perfanno.nvim>
* mini.nvim
* <https://github.com/vague2k/vague.nvim>
* Update everything...
* folke/lazydev
* Bindings for autocomplete?
* nvim-dap attach 
    * <https://romangeber.com/blog/tech/nvim_rust_debugger>
    * <https://github.com/mrcjkb/rustaceanvim#gear-advanced-configuration>
* Update nvim-treesitter-textobjects master -> main
