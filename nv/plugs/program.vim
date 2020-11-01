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


if has_key(g:plugs, 'far.vim')
    set regexpengine=1
    set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
    " shortcut for far.vim find
    nnoremap <silent> <Find-Shortcut>  :Farf<cr>
    vnoremap <silent> <Find-Shortcut>  :Farf<cr>

    " shortcut for far.vim replace
    nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
    vnoremap <silent> <Replace-Shortcut>  :Farr<cr>
endif


" --------------------------------------------------
" vim-easy-align
" --------------------------------------------------
if has_key(g:plugs, 'vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endif


" --------------------------------------------------
" undotree
" --------------------------------------------------
if has_key(g:plugs, 'undotree')
    nnoremap <space>h :UndotreeToggle<cr>
    let g:undotree_WindowLayout = 1
    let g:undotree_SplitWidth = 48
    let g:undotree_SetFocusWhenToggle = 1
    if has("persistent_undo")
        set undodir=$HOME/tmp/.undodir
        set undofile
    endif
endif


" --------------------------------------------------
" vista.vim
" --------------------------------------------------
if has_key(g:plugs, 'vista.vim')
    nmap <F9> :Vista!!<CR>

    function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
    endfunction
    set statusline+=%{NearestMethodOrFunction()}
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

    let g:vista#renderer#enable_icon = 1
    let g:vista_default_executive = 'ctags'
    let g:vista_executive_for = {
                \ 'cpp': 'vim_lsp',
                \ 'php': 'vim_lsp',
                \ 'python': 'coc',
                \ }

    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#icons = {
                \   "function": "\uf794",
                \   "variable": "\uf71b",
                \  }
    " let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    let g:vista_icon_indent = ["▸ ", ""]
endif


" --------------------------------------------------
" chadtree
" --------------------------------------------------
if has_key(g:plugs, 'chadtree')
    lua vim.api.nvim_set_var("chadtree_ignores", { name = {".*", ".git"} })
endif


" --------------------------------------------------
" vim-clap
" --------------------------------------------------
if has_key(g:plugs, 'vim-clap')
    " alt+c == ç
    nnoremap <silent> ç :Clap<CR>
    " alt+f == ƒ
    nnoremap <silent> ƒ :Clap files<CR>
    " alt+b == ∫
    nnoremap <silent> ∫ :Clap bcommits<CR>
    " alt+s == ß
    nnoremap <silent> ß :Clap hist<CR>
endif


" --------------------------------------------------
" startify
" --------------------------------------------------
if has_key(g:plugs, 'vim-startify')
    let g:startify_session_dir = '~/.config/nvim/session'
    let g:startify_session_autoload = 1
    let g:startify_session_persistence = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_session_persistence = 1
    let g:startify_enable_special = 0

    " returns all modified files of the current git repo
    " `2>/dev/null` makes the command fail quietly, so that when we are not
    " in a git repo, the list will be empty
    function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction

    " same as above, but show untracked files, honouring .gitignore
    function! s:gitUntracked()
        let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction

    let g:startify_lists = [
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
                \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ ]
    let g:startify_bookmarks = [
                \ { 'd': '~/Documents/dicts/common1.txt' },
                \ ]
endif


" --------------------------------------------------
" vim-sneak
" --------------------------------------------------
if has_key(g:plugs, 'vim-sneak')
    " let g:sneak#label = 1
    nmap + <Plug>Sneak_;
    omap + <Plug>Sneak_;
    xmap + <Plug>Sneak_;
    nmap _ <Plug>Sneak_,
    omap _ <Plug>Sneak_,
    xmap _ <Plug>Sneak_,
endif


" --------------------------------------------------
" vim-markbar
" --------------------------------------------------
if has_key(g:plugs, 'vim-markbar')
    nmap <Leader>m <Plug>ToggleMarkbar
endif


" --------------------------------------------------
" vim-bookmarks
" --------------------------------------------------
if has_key(g:plugs, 'vim-bookmarks')
    " highlight BookmarkSign ctermbg=NONE ctermfg=160
    " highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = ''
    let g:bookmark_highlight_lines = 1
endif


" --------------------------------------------------
" vim-better-whitespace
" --------------------------------------------------
if has_key(g:plugs, 'vim-better-whitespace')
    let g:better_whitespace_enabled=1
    let g:strip_whitespace_on_save=1
    let g:strip_whitespace_confirm=0
    let g:strip_whitelines_at_eof=1
    let g:show_spaces_that_precede_tabs=1
    let g:better_whitespace_verbosity=1

    let g:strip_only_modified_lines=1
    nnoremap ]w :NextTrailingWhitespace<CR>
    nnoremap [w :PrevTrailingWhitespace<CR>
    autocmd FileType python,javascript,c,cpp,ruby EnableStripWhitespaceOnSave
    let g:better_whitespace_filetypes_blacklist=['dashboard', 'todoist']
endif
