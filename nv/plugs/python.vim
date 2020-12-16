" --------------------------------------------------
" semshi
" --------------------------------------------------
if has_key(g:plugs, 'semshi')
    let g:semshi#filetypes = ['python']
    function! MapSemshi() abort
        if &filetype ==# 'python'
            " ˚ == Alt+k
            nmap <silent> ˚ :Semshi goto name prev<CR>
            nmap <silent> <M-k> :Semshi goto name prev<CR>
            " ∆ == Alt+j
            nmap <silent> ∆ :Semshi goto name next<CR>
            nmap <silent> <M-j> :Semshi goto name next<CR>

            nmap <silent> ]C :Semshi goto class next<CR>
            nmap <silent> [C :Semshi goto class prev<CR>

            " same as ]m/[m
            nmap <silent> ]f :Semshi goto function next<CR>
            nmap <silent> [f :Semshi goto function prev<CR>
            sign define semshiError text=ﮊ  texthl=semshiErrorSign
            hi semshiParameterUnused ctermfg=117 guifg=#00ff00 cterm=underline gui=underline
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
    let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
endif


" --------------------------------------------------
" vim-quickrun
" --------------------------------------------------
if has_key(g:plugs, 'vim-quickrun')
    nmap <F5> <Plug>(quickrun)
endif
