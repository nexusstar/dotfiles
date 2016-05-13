export CONFIG=$HOME/.config
export ZSH=$HOME/.config/zshenv

# display how long all tasks over 10 seconds take
export REPORTTIME=10

[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo

# define the workspace directory
# This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/workspace ]]; then
    export CODE_DIR=~/workspace
fi

# source all .zsh files inside of the .zshenv directory
for config ($ZSH/**/*.zsh) source $config

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi


# initialize autocomplete
autoload -U compinit
compinit

for config ($ZSH/**/*completion.sh) source $config

export EDITOR='nvim'

export PATH=/usr/local/bin:$PATH

# add /usr/local/sbin
if [[ -d /usr/local/sbin ]]; then
    export PATH=/usr/local/sbin:$PATH
fi


# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

# install rbenv
if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi

if [[ -d ~/.rvm ]]; then
    PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
    source ~/.rvm/scripts/rvm
fi

# alias git to g
if hash g 2>/dev/null; then
    eval "$(g alias -s)"
fi

# source nvm
export NVM_DIR=~/.nvm

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# add Composer directory
export PATH="$HOME/.composer/vendor/bin:$PATH"
