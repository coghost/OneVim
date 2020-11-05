" --------------------------------------------------
" far.vim
" --------------------------------------------------
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
    let g:sneak#label = 1
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


if has_key(g:plugs, 'quick-scope')
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T', 'w', 'b']
    augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup END
    let g:qs_max_chars=150
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
