" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim

function! InstallCssComb(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g csscomb
  endif
endfunction

" --  UI & Navigation
Plug 'vim-airline/vim-airline'        " Footer UI
Plug 'vim-airline/vim-airline-themes' " Footer UI themes
Plug 'mhartington/oceanic-next'       " Neovim theme inspired by Oceanic Next for Sublime
Plug 'junegunn/seoul256.vim'          " Low contrast theme
Plug 'scrooloose/nerdtree'            " A file system explorer
Plug 'tpope/vim-vinegar'              " netrw project drawer press `-` to hop in directory
Plug 'Xuyuanp/nerdtree-git-plugin'    " show git status in nerdtree
Plug 'majutsushi/tagbar'              " Display file tags in sidebar
Plug 'lilydjwg/colorizer'             " colorize all text in form #rgb #rgba #rrggbb
Plug 'easymotion/vim-easymotion'      " Vim motion on speed mapped to <space>
Plug 'editorconfig/editorconfig-vim'  " Support of .editorconfig
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy finder
Plug 'FelikZ/ctrlp-py-matcher'        " python ctrlp matcher
Plug 'sjl/gundo.vim'                  " visualize your undo tree
Plug 'terryma/vim-multiple-cursors'   " multiple selection into Vim
Plug 'tpope/vim-sleuth'               " automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'junegunn/vim-easy-align'        " alignment plugin use <ENTER> to specify align pattern
Plug 'haya14busa/vim-asterisk'        " improved * motion
Plug 'tpope/vim-abolish'              " Abbreviation, Substitution, Coercion
Plug 'tpope/vim-repeat'               " Smarter repeats through '.'
Plug 'Shougo/neco-vim'                " spell helper
Plug 'tpope/vim-eunuch'               " run shell commands as [:Delete, :Unlink, :Move, :Rename]
Plug 'guns/vim-sexp'                  " Precision editing of S expression (nested parenthetical xpressions)
Plug 'w0rp/ale'                                   " Asynchronus lint engine
Plug 'tpope/vim-sexp-mappings-for-regular-people' " mapping for sexp
Plug 'eugen0329/vim-esearch'                      " Project wide async search and replace
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder installed system wide
Plug 'junegunn/fzf.vim'
" denite
Plug 'Shougo/denite.nvim'
Plug 'nixprime/cpsm', {'build': 'PY3=ON ./install.sh'}
Plug 'Shougo/neomru.vim'
Plug 'chemzqm/denite-extra'
Plug 'pocari/vim-denite-gists'

" -- Coding helppers
Plug 'PeterRincker/vim-argumentative' " Manipulating and moving between function arguments.
Plug 'Raimondi/delimitMate'           " automatic closing of quotes, parenthesis, brackets etc.
Plug 'scrooloose/nerdcommenter'       " Function comments
Plug 'Olical/vim-expand'              " Allows of expand of function {add,remove}(){}
Plug 'Olical/vim-syntax-expand'       " Expand characters to code if not in a comment or string
Plug 'Olical/vim-enmasse'             " Edit every file in a quickfix list at the same time run :EnMasse
Plug 'mattn/emmet-vim'                " emmet support abbreviations expanding
Plug 'fntlnz/atags.vim'               " Simplified tag generation for Neovim
Plug 'tpope/vim-surround'             " surround parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-endwise'              " automatic ending some structure if, do etc.
Plug 'tpope/vim-commentary'           " Comment stuff out.
Plug 'haya14busa/incsearch.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-dispatch'          " Kick off builds and test suites and load automatic

" -- Debuggers
Plug 'critiqjo/lldb.nvim'             " LLDB debugger integration for Neovim


" -- Git
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mhinz/vim-signify'  " version support markings in sy column

Plug 'csscomb/vim-csscomb' ,{ 'do' : function('InstallCssComb') } " reorder css with CSScomb
Plug 'luishdez/vim-less'       " Less highlighting
Plug 'tpope/vim-markdown'      " Markdown highlighting
Plug 'parkr/vim-jekyll'        " Jekyll blog automation
Plug 'Valloric/MatchTagAlways' " highlights the XML/HTML tags that enclose location
Plug 'tpope/vim-ragtag'        " mappings for HTML, XML, PHP, JSP

" -- Drupal
Plug 'evidens/vim-twig'                              " PHP twig template highlighing
Plug 'http://git.drupal.org/project/vimrc.git', { 'branch': '7.x-1.x', 'as': 'vim-drupal', 'rtp': './bundle/vim-plugin-for-drupal'}

" -- JavaScript
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim' " Tern based JavaScript editing support
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim', {'for': 'javascript'}

Plug 'octol/vim-cpp-enhanced-highlight'              " c++ extra code hightlighter
Plug 'Shougo/neoinclude.vim'
Plug 'walm/jshint.vim'                            " Run jshint from vim, and show the result

" -- Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'
Plug 'alexlafroscia/deoplete-flow'

Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript' " deoplete typescript
