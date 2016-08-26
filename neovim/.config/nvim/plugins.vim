" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !python2 ./install.py
  endif
endfunction

" UI & Navigation
Plug 'vim-airline/vim-airline'        " Footer UI
Plug 'vim-airline/vim-airline-themes' " Footer UI themes
Plug 'mhartington/oceanic-next'       " Neovim theme inspired by Oceanic Next for Sublime
Plug 'scrooloose/nerdtree'            " A file system explorer
Plug 'majutsushi/tagbar'              " Display file tags in sidebar
Plug 'lilydjwg/colorizer'             " colorize all text in form #rgb #rgba #rrggbb

Plug 'critiqjo/lldb.nvim'             " LLDB debugger integration for Neovim
Plug 'joonty/vdebug'                  " DBJB debugger client for Vim
Plug 'fntlnz/atags.vim'               " Simplified tag generation for Neovim
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy finder
Plug 'easymotion/vim-easymotion'      " Vim motion on speed mapped to <space>
Plug 'PeterRincker/vim-argumentative' " Manipulating and moving between function arguments.
Plug 'Raimondi/delimitMate'           " automatic closing of quotes, parenthesis, brackets etc.
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Olical/vim-enmasse'             " Edit every file in a quickfix list at the same time run :EnMasse
Plug 'Olical/vim-expand'              " Allows of expand of function {add,remove}(){}
Plug 'Olical/vim-syntax-expand'       " Expand characters to code if not in a comment or string
Plug 'aklt/plantuml-syntax'
Plug 'andreimaxim/vim-io'
Plug 'csscomb/vim-csscomb'
Plug 'editorconfig/editorconfig-vim'
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
Plug 'mattn/emmet-vim'                               " emmet support abbreviations expanding
Plug 'mhinz/vim-signify'                             " VCS support markings
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'octol/vim-cpp-enhanced-highlight'              " c++ extra code hightlighter
Plug 'raymond-w-ko/vim-niji'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'                            " neovim replacement for syntastic using neovim's job control functionality
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'ujihisa/unite-colorscheme'
Plug 'junkblocker/unite-codesearch'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug  'Shougo/neco-vim', {'for': 'vim'}
Plug 'Shougo/neoinclude.vim'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'                           " Smarter repeats through '.'
Plug 'tpope/vim-sensible'                         " Universal set of defaults
Plug 'guns/vim-sexp'                              " Precision editing of S expression (nested parenthetical expressions)
Plug 'tpope/vim-sexp-mappings-for-regular-people' " mapping for sexp
Plug 'tpope/vim-surround'                         " surround parentheses, brackets, quotes, XML tags
Plug 'Valloric/MatchTagAlways'                    " highlights the XML/HTML tags that enclose location
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'walm/jshint.vim'                            " Run jshint from vim, and show the result
