" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !python2 ./install.py
  endif
endfunction

function! InstallCssComb(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g csscomb
  endif
endfunction

function! InstallStandard(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g standard
  endif
endfunction

" UI & Navigation
Plug 'vim-airline/vim-airline'        " Footer UI
Plug 'vim-airline/vim-airline-themes' " Footer UI themes
Plug 'mhartington/oceanic-next'       " Neovim theme inspired by Oceanic Next for Sublime
Plug 'junegunn/seoul256.vim'          " Low contrast theme
Plug 'scrooloose/nerdtree'            " A file system explorer
Plug 'majutsushi/tagbar'              " Display file tags in sidebar
Plug 'lilydjwg/colorizer'             " colorize all text in form #rgb #rgba #rrggbb

Plug 'critiqjo/lldb.nvim'             " LLDB debugger integration for Neovim
Plug 'joonty/vdebug'                  " DBJB debugger client for Vim
Plug 'fntlnz/atags.vim'               " Simplified tag generation for Neovim
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy finder
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'easymotion/vim-easymotion'      " Vim motion on speed mapped to <space>
Plug 'PeterRincker/vim-argumentative' " Manipulating and moving between function arguments.
Plug 'Raimondi/delimitMate'           " automatic closing of quotes, parenthesis, brackets etc.
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Olical/vim-enmasse'             " Edit every file in a quickfix list at the same time run :EnMasse
Plug 'Olical/vim-expand'              " Allows of expand of function {add,remove}(){}
Plug 'Olical/vim-syntax-expand'       " Expand characters to code if not in a comment or string
Plug 'csscomb/vim-csscomb' ,{ 'do' : function('InstallCssComb') } " reorder css with CSScomb
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'                               " emmet support abbreviations expanding
Plug 'embear/vim-localvimrc'
Plug 'evidens/vim-twig'                              " PHP twig template highlighing
Plug 'helino/vim-json'                               " JSON highlighting
Plug 'luishdez/vim-less'                             " Less highlighting
Plug 'tpope/vim-markdown'                            " Markdown highlighting
Plug 'parkr/vim-jekyll'                              " Jekyll blog automation
Plug 'pangloss/vim-javascript'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'http://git.drupal.org/project/vimrc.git', { 'branch': '7.x-1.x', 'as': 'vim-drupal', 'rtp': './bundle/vim-plugin-for-drupal'}
Plug 'junegunn/vim-easy-align'                       " alignment plugin
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } " Tern-based JavaScript editing support.
Plug 'mhinz/vim-signify'                             " version support markings
Plug 'nathanaelkane/vim-indent-guides'               " Visually displaying indent levels
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'octol/vim-cpp-enhanced-highlight'              " c++ extra code hightlighter
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake',{ 'do' : function('InstallStandard')}        " neovim replacement for syntastic using neovim's job control functionality
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'ujihisa/unite-colorscheme'
Plug 'junkblocker/unite-codesearch'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug  'Shougo/neco-vim', {'for': 'vim'}
Plug 'sjl/gundo.vim'                              " visualize your Vim undo tree
Plug 'terryma/vim-multiple-cursors'               " multiple selection into Vim
Plug 'tpope/vim-abolish'                          " Abbreviation, Substitution, Coercion
Plug 'tpope/vim-commentary'                       " Comment stuff out.
Plug 'tpope/vim-dispatch'                         " Kick off builds and test suites and load automatic
Plug 'tpope/vim-endwise'                          " automatic ending some structure if, do etc.
Plug 'tpope/vim-eunuch'                           " Vim sugar for the UNIX shell commands
Plug 'tpope/vim-fugitive'                         " Git wrapper
Plug 'tpope/vim-ragtag'                           " mappings for HTML, XML, PHP, JSP
Plug 'tpope/vim-repeat'                           " Smarter repeats through '.'
Plug 'guns/vim-sexp'                              " Precision editing of S expression (nested parenthetical expressions)
Plug 'tpope/vim-sexp-mappings-for-regular-people' " mapping for sexp
Plug 'tpope/vim-surround'                         " surround parentheses, brackets, quotes, XML tags
Plug 'Valloric/MatchTagAlways'                    " highlights the XML/HTML tags that enclose location
Plug 'tpope/vim-sleuth'                           " automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-unimpaired'                       " extra mappings
Plug 'tpope/vim-vinegar'                          " build in directory browser
Plug 'walm/jshint.vim'                            " Run jshint from vim, and show the result
