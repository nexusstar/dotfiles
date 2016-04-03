# Path to Oh My Fish install.
#set -gx OMF_PATH "~/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "~/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Fish configuration
set EDITOR nvim
set VISUAL nvim
set fish_greeting ""

#Kill all running containers
alias dockerkill='docker kill (docker ps -q)'

# Delete all docker images and containers
alias dockernuke='docker rm (docker ps -a -q); docker rmi -f (docker images -q)'

# Git alias
alias g="git"
