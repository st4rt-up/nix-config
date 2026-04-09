{
  modules.tmux = {
    nixos = {
      programs.tmux = {
        enable = true;
        clock24 = false;
        baseIndex = 1;

        extraConfig = ''
          # == mouse support
          set -g mouse on

          # == change prefix to backtick (`)
          unbind C-b
          set-option -g prefix `
          bind-key ` send-prefix

          # == 1-indexing panes
          set -g base-index 1
          set -g pane-base-index 1
          set-window-option -g pane-base-index 1
          # set-option -g remember-windows on

          # == navigation
          bind M-Left select-pane -L
          bind M-Right select-pane -R
          bind M-Up select-pane -U
          bind M-Down select-pane -D
          bind -r h select-pane -L
          bind -r j select-pane -R
          bind -r k select-pane -U
          bind -r l select-pane -D

          # == kill / create windows
          bind q confirm-before -p "kill-pane #P? (y/n)" kill-pane
          unbind c
          bind n new-window

          # == split panes / windows
          # more ergonomic than defaults
          unbind '"'
          unbind %
          bind | split-window -h
          bind - split-window -v
          bind s split-window -h
          bind v split-window -v

          # == unbind annoyances
          unbind p
          unbind b
          bind Tab last-window
          set-option -g allow-rename off
        '';
      };
    };
  };
}
