" Most config is stored in an individual file in the `modules` folder.

" Clear all
augroup initvim
    autocmd!
augroup END

" Function to load multiple config files.
function! LoadPluginConfig() abort
    let l:plugin_folder = g:config_folder . 'plugins'
    let s:plugins = split(globpath(l:plugin_folder, '*.vim'), '\n')
    let l:loaded = 0
    for plugin in s:plugins
        let s:inactive = match(plugin ,"inactive")
        if s:inactive == -1
            try
                exe 'source ' . plugin
                let l:loaded += 1
            catch
                echohl WarningMsg
                echom 'Error: ----->' . v:exception
                echom 'Could not load ' . plugin
                echohl none
            endtry
        endif
    endfor
endfunction

" Function to source a vim file.
function! Source(file) abort
    try
        exe 'source ' . g:config_folder . a:file
    catch
        echohl WarningMsg
        echom 'Error: ----->' . v:exception
        echom 'Could not load ' . a:file
        echohl none
    endtry
endfunction

" Source all the other config.

if has('win32')
    let g:config_folder = fnamemodify(expand($MYVIMRC), ':p:h') . '/modules/'
else
    if has('nvim')
        let g:config_folder = expand('~/.config/nvim/modules/')
    endif
endif

call Source('core.vim')
call Source('filetypes.vim')
call Source('fold.vim')
call Source('highlighting.vim')
call Source('mappings.vim')
call Source('performance.vim')
call Source('search.vim')
call Source('spelling.vim')
call Source('terminal.vim')
call Source('themes.vim')
call Source('undo.vim')
call Source('plugins.vim')
call LoadPluginConfig()
