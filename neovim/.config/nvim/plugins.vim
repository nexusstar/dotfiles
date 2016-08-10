" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

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

Plug 'FelikZ/ctrlp-py-matcher'
Plug 'fntlnz/atags.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'Lokaltog/vim-easymotion'
Plug 'PeterRincker/vim-argumentative'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Wolfy87/vim-enmasse'
Plug 'Wolfy87/vim-expand'
Plug 'Wolfy87/vim-syntax-expand'
Plug 'aklt/plantuml-syntax'
Plug 'andreimaxim/vim-io'
Plug 'csscomb/vim-csscomb'
Plug 'critiqjo/lldb.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'evidens/vim-twig'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'helino/vim-json'
Plug 'http://git.drupal.org/project/vimrc.git', { 'branch': '7.x-1.x', 'as': 'vim-drupal', 'rtp': './bundle/vim-plugin-for-drupal'}
Plug 'joonty/vdebug'
Plug 'junegunn/vim-easy-align'
Plug 'luishdez/vim-less'
Plug 'lilydjwg/colorizer'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'octol/vim-cpp-enhanced-highlight' " c++ extra code hightlighter
Plug 'pangloss/vim-javascript'
Plug 'parkr/vim-jekyll'
Plug 'raymond-w-ko/vim-niji'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functionality
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
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat' " Smarter repeats through '.'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/MatchTagAlways'
Plug 'walm/jshint.vim'
