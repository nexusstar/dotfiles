## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# make terminal command navigation sane again
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
#bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

## Alias section
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias gitc='git checkout'
alias gits='git status'

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
#PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
#PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
#GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
#GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
#GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
#GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
#GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
#GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
#GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
#GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
#GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

#parse_git_branch() {
## Show Git branch/tag, or name-rev if on detached head
#( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
#}

#parse_git_state() {
## Show different symbols as appropriate for various Git repository states
## Compose this value via multiple conditional appends.
#local GIT_STATE=""
#local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
#if [ "$NUM_AHEAD" -gt 0 ]; then
#GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
#fi
#local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
#if [ "$NUM_BEHIND" -gt 0 ]; then
#GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
#fi
#local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
#if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
#GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
#fi
#if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
#fi
#if ! git diff --quiet 2> /dev/null; then
#GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
#fi
#if ! git diff --cached --quiet 2> /dev/null; then
#GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
#fi
#if [[ -n $GIT_STATE ]]; then
#echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
#fi
#}

#git_prompt_string() {
#local git_where="$(parse_git_branch)"

  ## if inside a git repository, print its branch and state
  #[ -n "$git_where" ] && echo "$git_prompt_symbol$(parse_git_state)$git_prompt_prefix%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$git_prompt_suffix"

  ## if not inside the git repo, print exit codes of last command (only if it failed)
  #[ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
  #}

# Right prompt with exit status of previous command if not successful
#RPROMPT="%{$fg[red]%} %(?..[%?])"
# Right prompt with exit status of previous command marked with ✓ or ✗
#RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"

# needed to get things like current git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'
zstyle ':vcs_info:svn*' use-simple true
zstyle ':vcs_info:svn*' max-exports 2
zstyle ':vcs_info:svn*' formats ' %s %b'
zstyle ':vcs_info:svn*' actionformats ' %b|%a'

autoload colors && colors

git_dirty() {
  # check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return

    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
      echo "%F{red}✗%f"
    else
      echo "%F{green}✔%f"
    fi
  }

svn_dirty(){
  command svn info `pwd` &>/dev/null || return

    #check if it's dirty
    changes=`svn status -q`

    if [[ -z "$changes" ]]; then
      echo "%F{green}✔%f"
    else
      echo "%F{red}✗%f"
    fi
  }

# get the status of the current branch and it's remote
# If there are changes upstream, display a ⇣
# If there are changes that have been committed but not yet pushed, display a ⇡
git_arrows() {
  # do nothing if there is no upstream configured
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local arrows=""
  local status
  arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"

    # do nothing if the command failed
    (( !$? )) || return

    # split on tabs
    arrow_status=(${(ps:\t:)arrow_status})
    local left=${arrow_status[1]} right=${arrow_status[2]}

    (( ${right:-0} > 0 )) && arrows+="%F{011}⇣%f"
    (( ${left:-0} > 0 )) && arrows+="%F{012}⇡%f"

    echo $arrows
  }


# indicate a job (for example, vim) has been backgrounded
# If there is a job in the background, display a ✱
suspended_jobs() {
  local sj
  sj=$(jobs 2>/dev/null | tail -n 1)
  if [[ $sj == "" ]]; then
    echo ""
  else
    echo "%{$FG[208]%}✱%f"
  fi
}

precmd() {
  vcs_info
  # if the path is longer than 5 leave the last 3
  print -P  '\n%F{205}%(5~|…/%3~|%~)'
}

# Scripting os X prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
export RPROMPT='`svn_dirty``git_dirty`%F{241}$vcs_info_msg_0_%f `git_arrows``suspended_jobs`'

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    RPROMPT="%{$fg[red]%} %(?..[%?])"
    alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
  #  'tmux: server')
    #        RPROMPT='$(git_prompt_string)'
    #		## Base16 Shell color themes.
    #		#possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth,
    #		#atelierseaside, bespin, brewer, chalk, codeschool, colors, default, eighties,
    #		#embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube,
    #		#marrakesh, mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter,
    #		#solarized, summerfruit, tomorrow, twilight
    #		#theme="eighties"
    #		#Possible variants: dark and light
    #		#shade="dark"
    #		#BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
    #		#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
    #		# Use autosuggestion
    #		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    #		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    #  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    #     ;;
  *)
    # RPROMPT='$(git_prompt_string)'
    # Use autosuggestion
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac
export VISUAL=nvim
export EDITOR="$VISUAL"
# Adding nvm and nvm completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=./node_modules/.bin:$PATH
 export PATH=/home/nexus/.gem/ruby/2.7.0/bin:$PATH
# Go config
export GOPATH=$HOME/workspace/gocode
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export PATH=/home/nexus/.cargo/bin:$PATH

# Pyton config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Load pyenv into the shell
eval "$(pyenv init --path)"
# Load pyenv virtual envirionment plugin
eval "$(pyenv virtualenv-init -)"
