# Neovim config

## Install deps

* `git`
* `xxd`
* `ripgrep`

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
export JENKINS_PASSWORD=secret
export JENKINS_URL=https://my.jenkins.hostname/
export JENKINS_USER_ID=jenkins_user
```

## Python / pyright - multifile

```sh
# in root folder of python
touch pyrightconfig.json
```

## Consider

* swap-words using more proper nvim lua api
* Other OpenCL highlighting?
* <https://github.com/nvim-telescope/telescope-dap.nvim>
* <https://github.com/camgraff/telescope-tmux.nvim>
