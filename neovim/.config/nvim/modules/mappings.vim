" Set the local leader.
let maplocalleader = "|"

" Clears the search.
function! s:clear_search_results()
  let @/ = ""
endfunction

nnoremap <silent> <leader>/d :call <SID>clear_search_results()<CR>

" Shows the amount of matches for the previous search.
function! s:count_search_results()
  %s///gn
endfunction

nnoremap <silent> <leader>/c :call <SID>count_search_results()<CR>

" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" Corrects the spelling under the cursor with the first suggestion.
function! s:correct_to_first_spelling_suggestion()
  normal 1z=
endfunction

nnoremap <silent> <leader>z :call <SID>correct_to_first_spelling_suggestion()<CR>

" Trim the trailing white space from the file.
function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <leader>cw :call <SID>trim_trailing_whitespace()<CR>

" Opens the split in a new tab. Kind like "distraction free" mode.
nnoremap <silent> <leader>wf :tab sp<CR>

" Pull from either side of a git conflict.
nnoremap <silent> <leader>gl :diffget LOCAL<CR>
nnoremap <silent> <leader>gr :diffget REMOTE<CR>

"Start terminal mode with \t
function! s:start_terminal_mode()
  autocmd BufEnter term://* startinsert
endfunction

nnoremap <silent> <leader>t :call <SID>start_terminal_mode()<CR>

"Generate tags
"******** Generate only for files not in .gitignore
let g:atags_build_commands_list = [
    \ 'ag -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm tags.tmp'
    \ ]
nnoremap <silent><leader>ta :call atags#generate()<CR>

"Start gtd timer with 25 minute session and 5 min break
function! s:start_terminal_timer()
  :te ~/dotfiles/gtd/gtd -n 20
endfunction

nnoremap <silent> <leader>tm :call <SID>start_terminal_timer()<CR>

" Print out the current mappings.
function! s:show_mappings()
  let path = Dot('mappings.sh')
  exec '!' . path
endfunction

nnoremap <silent> <leader><leader> :call <SID>show_mappings()<CR>

" Quick session bindings.
nnoremap <silent> <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <silent> <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>
