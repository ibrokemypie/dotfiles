# This tmux statusbar config was created by tmuxline.vim
# on Wed, 03 May 2017

set -g status-bg "colour237"
set -g message-command-fg "colour235"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour216"
set -g message-bg "colour243"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour235"
set -g message-command-bg "colour243"
set -g status-attr "none"
#set -g status-utf8 "on"
set -g pane-border-fg "colour243"
set -g status-left-attr "none"
setw -g window-status-fg "colour254"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour237"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour216"
setw -g window-status-separator ""
setw -g window-status-bg "colour237"
set -g status-left "#[fg=colour236,bg=colour216,bold] #S #[fg=colour216,bg=colour237,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour243,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour243] %Y-%m-%d  %H:%M #[fg=colour216,bg=colour243,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour216] #h "
setw -g window-status-format "#[fg=colour254,bg=colour237] #I #[fg=colour254,bg=colour237] #W "
setw -g window-status-current-format "#[fg=colour237,bg=colour243,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour243] #I #[fg=colour235,bg=colour243] #W #[fg=colour243,bg=colour237,nobold,nounderscore,noitalics]"
