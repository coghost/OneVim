
function! UnusedPlugins() abort
    """"" same as sneak
    Plug 'easymotion/vim-easymotion'
    """"" fzf.vim using coc-fzf-preview
    Plug 'junegunn/fzf.vim'
    """"" same as fzf.vim, but has the ability to use C-d/C-u to go half-page-down/up for preview buffer
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    """"" same but lighter than coc.nvim
    Plug 'prabirshrestha/vim-lsp'
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'maximbaz/lightline-ale'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'CrispyDrone/vim-tasks'
    Plug 'farmergreg/vim-lastplace'
endfunction


" --------------------------------------------------
" lightline
" --------------------------------------------------
if has_key(g:plugs, 'lightline')
    let g:lightline = {
                \ 'active': {
                \   'left': [[ 'mode', 'paste' ],
                \            [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
                \   'right': [[ 'lineinfo' ],
                \             [ 'percent' ],
                \             [ 'filetype', 'charvaluehex' ]]
                \ },
                \ 'component_function': {
                \   'gitbranch': 'gitbranch#name'
                \ },
                \ }

    let g:lightline.component_expand = {
                \  'linter_checking': 'lightline#ale#checking',
                \  'linter_infos': 'lightline#ale#infos',
                \  'linter_warnings': 'lightline#ale#warnings',
                \  'linter_errors': 'lightline#ale#errors',
                \  'linter_ok': 'lightline#ale#ok',
                \ }

    let g:lightline.component_type = {
                \     'linter_checking': 'right',
                \     'linter_infos': 'right',
                \     'linter_warnings': 'warning',
                \     'linter_errors': 'error',
                \     'linter_ok': 'right',
                \ }

    let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
    let g:lightline#ale#indicator_checking = "\uf110"
    let g:lightline#ale#indicator_infos = "\uf129"
    let g:lightline#ale#indicator_warnings = "\uf071"
    let g:lightline#ale#indicator_errors = "\uf05e"
    let g:lightline#ale#indicator_ok = "\uf00c"
endif


" --------------------------------------------------
" vim-nerdtree-tabs
" --------------------------------------------------
if has_key(g:plugs, 'vim-nerdtree-tabs')
    " map <leader>n :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'

    " nerdtreetabs
    map <Leader>t <plug>NERDTreeTabsToggle<CR>
    " 关闭同步
    " let g:nerdtree_tabs_synchronize_view=0
    " let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
endif


" --------------------------------------------------
" fzf.vim
" --------------------------------------------------
if has_key(g:plugs, 'fzf.vim')
    " INFO: https://github.com/junegunn/fzf.vim/issues/453
    " INFO: https://github.com/junegunn/fzf.vim/pull/819
    let $FZF_DEFAULT_OPTS = '--reverse'
    let $BAT_THEME = 'OneHalfDark'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

    let g:fzf_buffers_jump = 1
    let g:fzf_commits_log_options = "--color --graph --date=format:'%m/%d %H:%M' --pretty=format:'%C(yellow)%h%Creset%C(red)%d%Creset %s %Cred『%C(bold blue)%an, %Cgreen%cd%Cred』%Creset'"

    " command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
    " command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    " let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --fixed-strings --color=always --glob "!.git/*" --smart-case '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview()
                \           : fzf#vim#with_preview(),
                \   <bang>0)

    command! -bang -nargs=? -complete=dir GFiles
                \ call fzf#vim#gitfiles(
                \   <q-args>,
                \   fzf#vim#with_preview(),
                \   <bang>0)

    function! OpenFloatingWin()
        let width = min([&columns - 4, max([120, &columns - 10])])
        let height = min([&lines - 4, max([20, &lines - 5])])
        let top = ((&lines - height) / 2) - 1
        let left = (&columns - width) / 2
        let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

        let top = "╭" . repeat("─", width - 2) . "╮"
        let mid = "│" . repeat(" ", width - 2) . "│"
        let bot = "╰" . repeat("─", width - 2) . "╯"
        let lines = [top] + repeat([mid], height - 2) + [bot]
        let s:buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
        call nvim_open_win(s:buf, v:true, opts)
        set winhl=Normal:Floating
        let opts.row += 1
        let opts.height -= 2
        let opts.col += 2
        let opts.width -= 4
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
        au BufWipeout <buffer> exe 'bw '.s:buf
    endfunction

    function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction
    command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

    nnoremap <silent> <C-\> :Rg<cr>
    " nnoremap <silent> <Space>f :Files<cr>
    " nnoremap <silent> <Space>g :GFiles<cr>
endif


" --------------------------------------------------
" context.vim
" --------------------------------------------------
if has_key(g:plugs, 'context.vim')
    let g:context_nvim_no_redraw = 1
    nnoremap <silent> <expr> <C-Y> context#util#map('<C-Y>')
    nnoremap <silent> <expr> <C-E> context#util#map('<C-E>')
    nnoremap <silent> <expr> zz    context#util#map('zz')
    nnoremap <silent> <expr> zb    context#util#map('zb')
    nnoremap <silent> <expr> zt    context#util#map_zt()
    nnoremap <silent> <expr> H     context#util#map_H()
endif


" --------------------------------------------------
" nerdtree-git-plugin
" --------------------------------------------------
if has_key(g:plugs, 'nerdtree-git-plugin')
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ "Modified"  : "",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }
endif


" --------------------------------------------------
" rainbow_parentheses.vim
" --------------------------------------------------
if has_key(g:plugs, 'rainbow_parentheses.vim')
    let g:rbpt_colorpairs = [
                \ ['brown',       'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['darkgray',    'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['brown',       'firebrick3'],
                \ ['gray',        'RoyalBlue3'],
                \ ['black',       'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkred',     'DarkOrchid3'],
                \ ['red',         'firebrick3'],
                \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif


" --------------------------------------------------
" vim-easymotion
" --------------------------------------------------
if has_key(g:plugs, 'vim-easymotion')
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-overwin-f2)

    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
endif


" --------------------------------------------------
" vim-tasks
" --------------------------------------------------
if has_key(g:plugs, 'vim-tasks')
    let maplocalleader="\<space>"
    " key bindings
    " n/N new tasks
    " t/T mark as tasks
    " b/x/d begin/cancel/done a task
    " a archive a task
    " ml/mm/mh/mc mark task as low/medium/high/critical priority
    " S sort tasks based on priority
endif
