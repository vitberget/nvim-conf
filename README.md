# NVIM

* Install packer
  ```sh
  git clone --depth 1\
      https://github.com/wbthomason/packer.nvim\
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  ```
* UndoTree cache
  ```sh
  mkdir -p .cache/nvim-undo
  ```
* Add to `tmux.conf`
  ```conf
  is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
  
  bind-key -n C-w if-shell "$is_vim" "send-keys C-w" "switch-client -Ttable1"
  bind-key -Ttable1 'h' select-pane -L
  bind-key -Ttable1 'j' select-pane -D
  bind-key -Ttable1 'k' select-pane -U
  bind-key -Ttable1 'l' select-pane -R
  ```
* The vim-compiler stuff
* Jenkins linter conf
  ```sh
  export JENKINS_PASSWORD=secret
  export JENKINS_URL=https://my.jenkins.hostname/
  export JENKINS_USER_ID=jenkins_user
  ```

## Rust

* Install `codelldb` with `Mason`
