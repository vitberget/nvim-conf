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
