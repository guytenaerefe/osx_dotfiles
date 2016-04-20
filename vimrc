# Color
set -g default-terminal "screen-256color"

# Scroll terminal, not history
#set -g mode-mouse on

# Powerline
run-shell "powerline-daemon -q"
source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
