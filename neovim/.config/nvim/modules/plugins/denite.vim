let s:menus = {}
  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'reversed': 1,
        \})
  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \})
  call denite#custom#option('TSWorkspaceSymbol', {
        \ 'prompt': ' #' ,
        \})

	call denite#custom#source('file_rec', 'vars', {
        \'command': ['rg', '--files', '--glob', '!.git'],
        \'sorters':['sorter_sublime'],
        \'matchers': ['matches_cpsm']
        \})
  "     \ 'command': ['ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'node_modules'

	call denite#custom#source('grep', 'vars', {
        \'command': ['rg'],
	      \'default_opts': ['-i', '--vimgrep'],
	      \'recursive_opts': [],
	      \'pattern_opt': [],
	      \'separator': ['--'],
	      \'final_opts': [],
        \})

  nnoremap <silent> <c-p> :Denite file_rec<CR>
  nnoremap <silent> <leader>h :Denite help<CR>
  nnoremap <silent> <leader>v :Denite vison<CR>
  nnoremap <silent> <leader>c :Denite colorscheme<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  nnoremap <silent> <leader>a :Denite grep:::!<CR>
  nnoremap <silent> <leader>u :call dein#update()<CR>
  nnoremap <silent> <Leader>i :Denite menu:ionic <CR>
  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
	call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)
  let g:ctrlp_user_command = 'ag --hidden --ignore .git -l -g ""'
