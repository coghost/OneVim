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

" --------------------------------------------------
" todoist.nvim
" --------------------------------------------------
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

" --------------------------------------------------
" rnvimr: TODO
" --------------------------------------------------
if has_key(g:plugs, 'rnvimr')
    " Make Ranger replace netrw and be the file explorer
    let g:rnvimr_ex_enable = 1
    let g:rnvimr_enable_picker = 1
    let g:rnvimr_draw_border = 0
    let g:rnvimr_hide_gitignore = 1
    let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
    let g:rnvimr_enable_bw = 1
    let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
    highlight link RnvimrNormal CursorLine
    " nmap <Space>p :RnvimrToggle<CR>
    " Alt+o
    nnoremap <silent> ø :RnvimrToggle<CR>
    tnoremap <silent> ø <C-\><C-n>:RnvimrToggle<CR>
    let g:rnvimr_action = {
                \ '<C-t>': 'NvimEdit tabedit',
                \ '<C-x>': 'NvimEdit split',
                \ '<C-v>': 'NvimEdit vsplit',
                \ 'gw': 'JumpNvimCwd',
                \ 'yw': 'EmitRangerCwd'
                \ }
    let g:rnvimr_ranger_views = [
                \ {'minwidth': 90, 'ratio': []},
                \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
                \ {'maxwidth': 49, 'ratio': [1]}
                \ ]
    let g:rnvimr_layout = {
                \ 'relative': 'editor',
                \ 'width': float2nr(round(0.9 * &columns)),
                \ 'height': float2nr(round(0.9 * &lines)),
                \ 'col': float2nr(round(0.05 * &columns)),
                \ 'row': float2nr(round(0.05 * &lines)),
                \ 'style': 'minimal'
                \ }
endif


" --------------------------------------------------
" vim-which-key
" --------------------------------------------------
if has_key(g:plugs, 'vim-which-key')
    " Map leader to which_key
    nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
    vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

    " Create map to add keys to
    let g:which_key_map =  {}
    " Define a separator
    let g:which_key_sep = '→'
    " set timeoutlen=100


    " Not a fan of floating windows for this
    let g:which_key_use_floating_win = 0

    " Change the colors if you want
    highlight default link WhichKey          Operator
    highlight default link WhichKeySeperator DiffAdded
    highlight default link WhichKeyGroup     Identifier
    highlight default link WhichKeyDesc      Function

    " Hide status line
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

    " Single mappings
    let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
    let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
    let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
    let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
    let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
    let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
    let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
    let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
    let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

    " s is for search
    let g:which_key_map.s = {
                \ 'name' : '+search' ,
                \ '/' : [':History/'     , 'history'],
                \ ';' : [':Commands'     , 'commands'],
                \ 'a' : [':Ag'           , 'text Ag'],
                \ 'b' : [':BLines'       , 'current buffer'],
                \ 'B' : [':Buffers'      , 'open buffers'],
                \ 'c' : [':Commits'      , 'commits'],
                \ 'C' : [':BCommits'     , 'buffer commits'],
                \ 'f' : [':Files'        , 'files'],
                \ 'g' : [':GFiles'       , 'git files'],
                \ 'G' : [':GFiles?'      , 'modified git files'],
                \ 'h' : [':History'      , 'file history'],
                \ 'H' : [':History:'     , 'command history'],
                \ 'l' : [':Lines'        , 'lines'] ,
                \ 'm' : [':Marks'        , 'marks'] ,
                \ 'M' : [':Maps'         , 'normal maps'] ,
                \ 'p' : [':Helptags'     , 'help tags'] ,
                \ 'P' : [':Tags'         , 'project tags'],
                \ 's' : [':Snippets'     , 'snippets'],
                \ 'S' : [':Colors'       , 'color schemes'],
                \ 't' : [':Rg'           , 'text Rg'],
                \ 'T' : [':BTags'        , 'buffer tags'],
                \ 'w' : [':Windows'      , 'search windows'],
                \ 'y' : [':Filetypes'    , 'file types'],
                \ 'z' : [':FZF'          , 'FZF'],
                \ }

    " Register which key map
    call which_key#register('<Space>', "g:which_key_map")
endif
