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


# alias git to g
if hash g 2>/dev/null; then
    eval "$(g alias -s)"
fi

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# add Composer directory
if [[ -d ~/.composer ]]; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
# add rbenv for Ruby and autocompletion
if [[ -d ~/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
# add go path if installed
if [[ -d /usr/local/go ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

# source local .zsh_config file instead of .zshrc
function chpwd() {
  if [ -r $PWD/.zsh_config ]; then
    source $PWD/.zsh_config
  else
    source $HOME/.zshrc
  fi
}
