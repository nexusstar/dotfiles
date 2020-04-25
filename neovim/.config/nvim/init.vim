" Plugins  ------------------------------------------------------------------{{{
" Setup dein {{{
" Auto install dein
if has('win32')
  if !isdirectory(expand('~/dotfiles/neovim/.config/nvim/repos/github.com/Shougo/dein.vim'))
    echo "Installing dein.vim..."
    silent !powershell -Command "New-Item -ItemType Directory -Path $HOME/dotfiles/neovim/.config/nvim/repos/github.com/Shougo -Force"
    silent !powershell -Command "git clone https://github.com/Shougo/dein.vim $HOME/dotfiles/neovim/.config/nvim/repos/github.com/Shougo/dein.vim"
  endif
  set runtimepath+=~/dotfiles/neovim/.config/nvim/repos/github.com/Shougo/dein.vim
endif
if !has('win32')
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    echo "Installing udner .config/nvim dein.vim..."
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
endif

" Set plugin path
if has('win32')
  call dein#begin(expand('~/dotfiles/neovim/.config/nvim'))
endif
if !has('win32')
  call dein#begin(expand('~/.config/nvim'))
endif

call dein#add('Shougo/dein.vim')
"}}}
" system {{{
call dein#add('tpope/vim-surround')
call dein#add('junegunn/vim-easy-align')
call dein#add('Shougo/context_filetype.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')
call dein#add('preservim/nerdcommenter')
" }}}
" UI {{{
call dein#add('scrooloose/nerdtree')
call dein#add('mhartington/oceanic-next')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" }}}
" completion {{{
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
" }}}
" denite {{{
call dein#add('Shougo/denite.nvim')
call dein#add('neoclide/denite-git')
" }}}
" git {{{{
call dein#add('tpope/vim-fugitive')
call dein#add('mhinz/vim-signify')
" }}}}
" Test new plugins {{{
call dein#add('wincent/scalpel')
call dein#add('heavenshell/vim-jsdoc')
" }}}
" syntax highlighting {{{
" One to rule them all
" One to find them
" One to bring them on
" And in the darkness bind them
call dein#add('sheerun/vim-polyglot')
" for nerdtree
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

" Check what syntax it is for debug highlighting
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
" snippets {{{{
" }}}}
" Has to be last according to docs
call dein#add('ryanoasis/vim-devicons')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()

filetype plugin indent on
" }}}
:" System Settings  ----------------------------------------------------------{{{
"
" Check for local configuration
if (isdirectory(expand("$HOME/.local.vim")))
  source ~/.local.vim
endif

if exists('g:GuiLoaded')
  Guifont Hasklig:h15
endif

" Neovim Settings
set termguicolors
set mouse=a
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set clipboard+=unnamedplus
set pastetoggle=<f6>
set nopaste
set hidden
autocmd BufWritePre * %s/\s\+$//e
set noshowmode
set noswapfile
filetype on
" Setting relative and number toggle
" on enter and exit edit mode
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set numberwidth=1
set tabstop=4 shiftwidth=4 expandtab
set conceallevel=0
set virtualedit=
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full
set autoread
set updatetime=300
set fillchars+=vert:│
"set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" More natural splitting.
set splitbelow
set splitright

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize
" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h
" set numberwidth=5
"
" Search for project root
" assumes that there is .git folder present
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" Set leadear
" leader is <space>
let mapleader = ' '
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
set undolevels=1000
set undoreload=10000

" Remember cursor position between vim sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h

" center buffer around cursor when opening files
autocmd BufRead * normal zz
set complete=.,w,b,u,t,k
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
set formatoptions+=t
set inccommand=nosplit
set shortmess=atIc
set isfname-==
set spell
let g:indentLine_color_gui = '#343d46'

" Open help bellow
autocmd! BufEnter * if &ft ==# 'help' | wincmd J | endif

" Highlight searches.
set hlsearch

" Highlight the current line.
set cursorline

" Send more characters to the terminal at once.
" Makes things smoother, will probably be enabled by my terminal anyway.
set ttyfast

" Stops macros rendering every step.
set lazyredraw

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h

" }}}
" System mappings  ----------------------------------------------------------{{{
" Navigate between display lines as normal lines
nnoremap <silent><expr> k      v:count == 0 ? 'gk' : 'k'
nnoremap <silent><expr> j      v:count == 0 ? 'gj' : 'j'
vnoremap <silent><expr> k      v:count == 0 ? 'gk' : 'k'
vnoremap <silent><expr> j      v:count == 0 ? 'gj' : 'j'
nnoremap <silent><expr> <Up>   v:count == 0 ? 'gk' : 'k'
nnoremap <silent><expr> <Down> v:count == 0 ? 'gj' : 'j'

" Make Home and End behave as them self
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>

" Neovim terminal mapping
" terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" navigate jumps
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" Map ; to : so instead to use
" shift+: just type ;
nnoremap ; :


" Copy to system clipboard
vnoremap <C-c> "*y<CR>
vnoremap y "*y<CR>
noremap Y y$
vnoremap y myy`y
vnoremap Y myY`y

" copy current files path to clipboard
nmap cp :let @+= expand("%:p")<cr>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <c-/> :TComment<cr>
nnoremap <silent> <esc> :noh<cr>


"}}}"
" Custom mappings  ----------------------------------------------------------{{{
function! s:PlaceholderImgTag(size)
  let url = 'http://dummyimage.com/' . a:size . '/000000/555555'
  let [width,height] = split(a:size, 'x')
  execute "normal a<img src=\"".url."\" width=\"".width."\" height=\"".height."\" />"
endfunction

command! -nargs=1 PlaceholderImgTag call s:PlaceholderImgTag(<f-args>)

"  Use <CR> to clear the highlighting of :set hlsearch
nnoremap <CR> :nohlsearch<CR>/<BS>

" Clears the search term from search register
function! s:clear_search_results()
  let @/=""
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

"Start terminal mode with \t
function! s:start_terminal_mode()
  autocmd BufEnter term://* startinsert
endfunction

nnoremap <silent> <leader>t :call <SID>start_terminal_mode()<CR>

" search for visually hightlighted text
vnoremap <c-s-r> y<ESC>/<c-r>"<CR>

"Start gtd timer with 20 minute session and 4 min break
function! s:start_terminal_timer()
  :te ~/dotfiles/gtd/gtd -n 20
endfunction

nnoremap <silent> <leader>tm :call <SID>start_terminal_timer()<CR>

" Thank you Steve Losh http://bitbucket.org/sjl/dotfiles/src/tip/vim/
" make word uppercase use <c-u> just after the word
inoremap <C-u> <esc>mzgUiw`za

" zt is okay for putting something at the top of the screen, but when I'm
" writing I often want to put something at not-quite-the-top of the
" screen.  zh is "zoom to head level"
nnoremap zh mzzt10<c-u>`z
" Adding <c-s> as write current buffer
nnoremap <C-s> :w<CR>
" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Default formatting, and keep the cursor in place
nnoremap Q mzgg=G`z
vnoremap Q mz=`z

" Tabs
nnoremap <leader>[ :tabprev<cr>
nnoremap <leader>] :tabnext<cr>

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Window Resizing        ----------------------------------------------------{{{
" TODO this does not work on windows powershell
"Alt right/up : bigger
"Alt left/down : smaller
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>
" }}}

"}}}"
" Themes, Commands, etc  ----------------------------------------------------{{{
syntax on
let g:one_allow_italics = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:vim_monokai_tasty_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
"}}}
" Fold, gets it's own section  ----------------------------------------------{{{

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" autocmd FileType vim setlocal fdc=1
set foldlevel=99

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax

autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

" autocmd FileType javascript,typescript,json setl foldmethod=syntax
autocmd FileType javascript,typescript,typescript.tsx,json setl foldmethod=syntax

" }}}
" NERDTree ------------------------------------------------------------------{{{
" Use  - regular minus sign to open NERDTree at root of VCS dir
" and _ (underscore) to open NERDTree of the file buffer
map <silent> - :NERDTreeToggleVCS<CR>
map <silent> _ :NERDTreeToggle<CR>
augroup ntinit
  autocmd FileType nerdtree call s:nerdtreeinit()
augroup END
function! s:nerdtreeinit() abort
  set nolist
  if !has("gui_running")
    nunmap <buffer> K
    nunmap <buffer> J
    map <silent> <Tab> :call nerdtree#ui_glue#invokeKeyMap("A")<CR>
  endif
endf
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let NERDTreeMinimalUI=1
let NERDTreeHijackNetrw=0

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -28
let g:netrw_banner = 0

let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeGitStatusIndicatorMap = {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : '✖',
      \ 'Dirty'     : '✗',
      \ 'Clean'     : '✔︎',
      \ 'Ignored'   : 'i',
      \ 'Unknown'   : '?'
      \ }

"}}}
" Nvim terminal -------------------------------------------------------------{{{


" }}}
" Denite --------------------------------------------------------------------{{{
" Configuration based on Caleb Tylor
"https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58
" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"   ----------------------------------------------------------------{{{
call denite#custom#var('file/rec', 'command',
            \ ['rg', '--files', '--glob', '!{.git,node_modules}'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
"}}}
"
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
"   ----------------------------------------------------------------{{{
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': '» ',
\ 'statusline': 0,
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'NormalFloat',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
"}}}
"
catch
  echo 'Denite not installed. call dein#install()'
endtry

"  Denite mappings"
"   ,         - Browse currently open buffers
"   <C-p> - Browse list of files in current directory
"   <C-f> - Search current directory for occurences of given term and close window if no results
"   <C-F> - Search current directory for occurences of word under cursor
"   <C-t> - Search current file for occurences of word TODO
"   ----------------------------------------------------------------{{{
nmap , :Denite buffer<CR>
nmap <C-p> :DeniteProjectDir file/rec<CR>
nnoremap <C-f> :<C-u>Denite grep:. -no-empty<CR>
nnoremap <C-t> :<C-u>Denite grep:::`expand('TODO')`<CR>
nnoremap <C-F> :<C-u>DeniteCursorWord grep:.<CR>
"}}}
"
" Denite mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
"   ----------------------------------------------------------------{{{
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
"}}}
"
" Denite mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
"   ----------------------------------------------------------------{{{
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
"}}}
"}}}
"
" vim-airline ---------------------------------------------------------------{{{

let g:webdevicons_enable_airline_statusline = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#mike#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_symbols.branch = 'b'
let g:airline_detect_iminsert=0
cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
nmap <silent><leader>, :bnext<CR>
tmap <leader>, <C-\><C-n>:bnext<cr>
nmap <silent><leader>. :bprevious<CR>
tmap <leader>. <C-\><C-n>:bprevious<CR>
tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#branch#format = 0
let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = '%f%m'
let g:airline_section_z = '%l:%c'
let g:airline#parts#ffenc#skip_expected_string=''
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 ',
      \}

" Add coc customization
let g:airline#extensions#coc#enabled = 1
"}}}
" coc -----------------------------------------------------------------------{{{

" Use tab for trigger completion with characters ahead and navigate.
"
" Set config path
if has('win32')
  if !isdirectory(expand('~/dotfiles/neovim/.config/nvim/coc-settings.json'))
    let g:coc_user_config='~/dotfiles/neovim/.config/nvim/coc-settings.json'
  endif
endif

if !has('win32')
  if (!isdirectory(expand("$HOME/dotfiles/neovim/.config/nvim/coc-settings.json")))
    let g:coc_user_config='$HOME/dotfiles/neovim/.config/nvim/coc-settings.json'
  endif
endif

" Get common extensions
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-stylelint',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-html',
      \'coc-json',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-snippets',
      \'coc-tsserver',
      \'coc-tslint',
      \'coc-go',
      \]

" use <TAB> for trigger completion
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"TODO need to change this could not use it like this
let g:UltiSnipsExpandTrigger='<S-space>'


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, check `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" MultiCursor ---------------------------------------------------------------{{{
"}}}
