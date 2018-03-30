" Set preview for fzf Files command
let g:fzf_files_options = '--preview "rougify {} | head -'.&lines.'"'
"Search hidden directories
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
