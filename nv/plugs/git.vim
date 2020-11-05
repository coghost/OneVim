" --------------------------------------------------
" vim-gitgutter
" --------------------------------------------------
if has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_grep = 'rg'
    set updatetime=100
    let g:gitgutter_max_signs = -1   " default value (otherwise)
    let _sign = '▌'
    let g:gitgutter_sign_added = _sign
    let g:gitgutter_sign_modified = _sign
    let g:gitgutter_sign_removed = _sign
    let g:gitgutter_sign_removed_first_line = _sign
    let g:gitgutter_sign_removed_above_and_below = '{'
    let g:gitgutter_sign_modified_removed = ''

    " if I want to use another git-plugin
    " let g:gitgutter_sign_allow_clobber = 1

    let g:gitgutter_highlight_lines = 0
    let g:gitgutter_highlight_linenrs = 1
    let g:gitgutter_preview_win_floating = 1
    let g:gitgutter_use_location_list = 1

    function! GitStatus()
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf('+%d ~%d -%d', a, m, r)
    endfunction
    set statusline^=%{GitStatus()}

    nmap <leader>ghhs <Plug>(GitGutterStageHunk)
    nmap <leader>gs <Plug>(GitGutterPreviewHunk)
    nmap <leader>gu <Plug>(GitGutterUndoHunk)
    " in case press c twice
    nmap ≠ <Plug>(GitGutterNextHunk)
    nmap ]c <Plug>(GitGutterNextHunk)
    nmap – <Plug>(GitGutterPrevHunk)
    nmap [c <Plug>(GitGutterPrevHunk)
    " nmap <leader>glt <Plug>(GitGutterLineHighlightsToggle)<cr>

    highlight link GitGutterChangeLine DiffText
    highlight link GitGutterChangeLineNr Underlined
endif


" --------------------------------------------------
" blamer
" --------------------------------------------------
if has_key(g:plugs, 'blamer.nvim')
    let g:blamer_enabled = 0
    let g:blamer_delay = 500
    let g:blamer_show_in_insert_modes = 0
    let g:blamer_prefix = '  『  '
    " let g:blamer_prefix = '     '
    let g:blamer_template = '<committer>, <committer-time> • <summary>』'
    let g:blamer_date_format = '%Y/%m/%d %H:%M'
    " let g:blamer_relative_time = 1
endif
