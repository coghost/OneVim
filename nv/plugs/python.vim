" --------------------------------------------------
" semshi
" --------------------------------------------------
if has_key(g:plugs, 'semshi')
    let g:semshi#filetypes = ['python']
    function! MapSemshi() abort
        if &filetype ==# 'python'
            " nmap <silent> <leader>rr :Semshi rename<CR>
            nmap <silent> <Tab> :Semshi goto name next<CR>
            nmap <silent> <S-Tab> :Semshi goto name prev<CR>
            nmap <silent> ]n :Semshi goto class next<CR>
            nmap <silent> [n :Semshi goto class prev<CR>

            nmap <silent> ]f :Semshi goto function next<CR>
            nmap <silent> [f :Semshi goto function prev<CR>
            hi semshiGlobal          ctermfg=red guifg=#ff0000
            sign define semshiError text=E> texthl=semshiErrorSign
        endif
    endfunction
    " nnoremap <silent> <leader>ms :call MapSemshi()<CR>
    autocmd FileType python call MapSemshi()
    " autocmd ColorScheme * call MapSemshi()
endif


" --------------------------------------------------
" vim-snippets
" --------------------------------------------------
if has_key(g:plugs, 'vim-snippets')
    let g:ultisnips_python_style = 'google'
endif
