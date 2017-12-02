" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim

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

" --  UI & Navigation
Plug 'vim-airline/vim-airline'         " Footer UI
Plug 'vim-airline/vim-airline-themes'  " Footer UI themes
Plug 'mhartington/oceanic-next'        " Neovim theme inspired by Oceanic Next for Sublime
Plug 'junegunn/seoul256.vim'           " Low contrast theme
Plug 'scrooloose/nerdtree'             " A file system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'     " show git status in nerdtree
Plug 'majutsushi/tagbar'               " Display file tags in sidebar
Plug 'lilydjwg/colorizer'              " colorize all text in form #rgb #rgba #rrggbb
Plug 'easymotion/vim-easymotion'       " Vim motion on speed mapped to <space>
Plug 'editorconfig/editorconfig-vim'   " Support of .editorconfig
Plug 'ctrlpvim/ctrlp.vim'              " Fuzzy finder
Plug 'FelikZ/ctrlp-py-matcher'         " python ctrlp matcher
Plug 'mileszs/ack.vim'                 " ask search tool
Plug 'nathanaelkane/vim-indent-guides' " Visually displaying indent levels
Plug 'sjl/gundo.vim'                   " visualize your undo tree
Plug 'tpope/vim-vinegar'               " netrw project drawer press `-` to hop in directory
Plug 'terryma/vim-multiple-cursors'    " multiple selection into Vim
Plug 'tpope/vim-sleuth'                " automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'guns/vim-sexp'                   " Precision editing of S expression (nested parenthetical expressions)
Plug 'tpope/vim-sexp-mappings-for-regular-people' " mapping for sexp

" -- Coding helppers
Plug 'PeterRincker/vim-argumentative' " Manipulating and moving between function arguments.
Plug 'Raimondi/delimitMate'           " automatic closing of quotes, parenthesis, brackets etc.
Plug 'scrooloose/nerdcommenter'       " Function comments
Plug 'Olical/vim-expand'              " Allows of expand of function {add,remove}(){}
Plug 'Olical/vim-syntax-expand'       " Expand characters to code if not in a comment or string
Plug 'junegunn/vim-easy-align'        " alignment plugin
Plug 'Olical/vim-enmasse'             " Edit every file in a quickfix list at the same time run :EnMasse
Plug 'mattn/emmet-vim'                " emmet support abbreviations expanding

" -- Debuggers
Plug 'critiqjo/lldb.nvim'             " LLDB debugger integration for Neovim
Plug 'joonty/vdebug'                  " DBJB debugger client for Vim

Plug 'fntlnz/atags.vim'               " Simplified tag generation for Neovim
Plug 'SirVer/ultisnips'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'

" -- Git
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mhinz/vim-signify'  " version support markings in sy column

Plug 'csscomb/vim-csscomb' ,{ 'do' : function('InstallCssComb') } " reorder css with CSScomb
Plug 'luishdez/vim-less'                             " Less highlighting
Plug 'tpope/vim-markdown'                            " Markdown highlighting
Plug 'parkr/vim-jekyll'                              " Jekyll blog automation
Plug 'Valloric/MatchTagAlways'                    " highlights the XML/HTML tags that enclose location
Plug 'tpope/vim-ragtag'                           " mappings for HTML, XML, PHP, JSP

" -- Drupal
Plug 'evidens/vim-twig'                              " PHP twig template highlighing
Plug 'http://git.drupal.org/project/vimrc.git', { 'branch': '7.x-1.x', 'as': 'vim-drupal', 'rtp': './bundle/vim-plugin-for-drupal'}

Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } " Tern-based JavaScript editing support.
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim', {'for': 'javascript'}

Plug 'octol/vim-cpp-enhanced-highlight'              " c++ extra code hightlighter
Plug 'benekastah/neomake',{ 'do' : function('InstallStandard')}        " neovim replacement for syntastic using neovim's job control functionality
Plug 'Shougo/neoinclude.vim'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'walm/jshint.vim'                            " Run jshint from vim, and show the result
Plug 'Shougo/neco-vim', {'for': 'vim'}

" -- Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'
Plug 'alexlafroscia/deoplete-flow'
Plug 'mhartington/nvim-typescript' " deoplete typescript

Plug 'HerringtonDarkholme/yats.vim' " TypeScript syntax

Plug 'tpope/vim-abolish'                          " Abbreviation, Substitution, Coercion
Plug 'tpope/vim-commentary'                       " Comment stuff out.
Plug 'tpope/vim-repeat'                           " Smarter repeats through '.'
Plug 'tpope/vim-dispatch'                         " Kick off builds and test suites and load automatic
Plug 'tpope/vim-endwise'                          " automatic ending some structure if, do etc.
Plug 'tpope/vim-eunuch'                           " Vim sugar for the UNIX shell commands
Plug 'tpope/vim-surround'                         " surround parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-unimpaired'                       " extra mappings
