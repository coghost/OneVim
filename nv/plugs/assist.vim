" --------------------------------------------------
" vim-translator
" --------------------------------------------------
if has_key(g:plugs, 'vim-translator')
    " Echo translation in the cmdline
    nmap <silent> <space>tr <Plug>Translate
    vmap <silent> <space>tr <Plug>TranslateV

    " Display translation in a window
    nmap <silent> <space>tw <Plug>TranslateW
    vmap <silent> <space>tw <Plug>TranslateWV

    " Replace the text with translation
    " nmap <silent> <space>r <Plug>TranslateR
    " vmap <silent> <space>r <Plug>TranslateRV

    " Translate the text in clipboard
    " nmap <silent> <space>x <Plug>TranslateX
endif


if has_key(g:plugs, 'todoist.nvim')
    let todoist = {
                \ 'icons': {
                \   'unchecked': '  ',
                \   'checked':   '  ',
                \   'loading':   '  ',
                \   'error':     '  ',
                \ },
                \}
endif


" --------------------------------------------------
" goyo.vim
" --------------------------------------------------
if has_key(g:plugs, 'goyo.vim')
    function! s:goyo_enter()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        endif
        set noshowmode
        set noshowcmd
        set scrolloff=999
        Limelight
        " ...
    endfunction

    function! s:goyo_leave()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        endif
        set showmode
        set showcmd
        set scrolloff=5
        Limelight!
        " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif


" --------------------------------------------------
" limelight
" --------------------------------------------------
if has_key(g:plugs, 'limelight')
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Default: 0.5
    let g:limelight_default_coefficient = 0.7

    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 1

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " Highlighting priority (default: 10)
    "   Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    " nmap <space>l <Plug>(Limelight)
    " xmap <space>l <Plug>(Limelight)
    " nnoremap <silent><nowait> <space>l  <Plug>(Limelight)
endif
