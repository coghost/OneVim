" --------------------------------------------------
" material.vim
" --------------------------------------------------
if has_key(g:plugs, 'material.vim')
    " For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
    if (has('nvim'))
        let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif

    " For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
    " Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
    " https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
    if (has('termguicolors'))
        set termguicolors
    endif

    if !has('nvim')
        let &t_ZH="\e[3m"
        let &t_ZR="\e[23m"
    endif
    " 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
endif


" --------------------------------------------------
" vim-airline
" --------------------------------------------------
if has_key(g:plugs, 'vim-airline')
    " let g:airline_section_b = '%{strftime("%c")}'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline_theme = 'dark'  " 主题
    let g:airline#extensions#keymap#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#buffer_idx_format = {
                \ '0': ' ',
                \ '1': ' ',
                \ '2': ' ',
                \ '3': ' ',
                \ '4': ' ',
                \ '5': ' ',
                \ '6': ' ',
                \ '7': ' ',
                \ '8': ' ',
                \ '9': ' '
                \}
    nmap <Space>1 <Plug>AirlineSelectTab1
    nmap <Space>2 <Plug>AirlineSelectTab2
    nmap <Space>3 <Plug>AirlineSelectTab3
    nmap <Space>4 <Plug>AirlineSelectTab4
    nmap <Space>5 <Plug>AirlineSelectTab5
    nmap <Space>6 <Plug>AirlineSelectTab6
    nmap <Space>7 <Plug>AirlineSelectTab7
    nmap <Space>8 <Plug>AirlineSelectTab8
    nmap <Space>9 <Plug>AirlineSelectTab9

    nnoremap <F2> :b#<CR>
    nnoremap ‘ :bn<CR>
    nnoremap “ :bp<CR>
endif


" --------------------------------------------------
" indentLine
" --------------------------------------------------
if has_key(g:plugs, 'indentLine')
    let g:indentLine_char             = '┊'
    let g:indentLine_color_dark       = 1
    let g:indentLine_faster           = 1
    let g:indentLine_leadingSpaceChar = '·'
    " let g:indentLine_setConceal = 0
    let g:indentLine_fileTypeExclude  = ['json', 'startify', 'dashboard', 'help', 'dashboard-nvim']
endif


" --------------------------------------------------
" vim-highlightedyank
" --------------------------------------------------
if has_key(g:plugs, 'vim-highlightedyank')
    if !exists('##TextYankPost')
        map y <Plug>(highlightedyank)
    endif
    let g:highlightedyank_highlight_duration = 150
endif


" --------------------------------------------------
" rainbow
" --------------------------------------------------
if has_key(g:plugs, 'rainbow')
    let g:rainbow_active = 1
endif


if has_key(g:plugs, 'fzf')
    let g:fzf_history_dir = '~/.local/share/fzf-history'
endif
