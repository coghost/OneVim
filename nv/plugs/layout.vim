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
" vim-floaterm
" --------------------------------------------------

if has_key(g:plugs, 'vim-floaterm')
    " let g:floaterm_keymap_new    = '<F7>'
    " let g:floaterm_keymap_prev   = '<F8>'
    " let g:floaterm_keymap_next   = '<F9>'
    " let g:floaterm_keymap_toggle = '<F12>'
    let g:floaterm_width = 0.9
    let g:floaterm_height = 0.9
    nnoremap   <silent>   <F7>    :FloatermNew<CR>
    tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
    " nnoremap   <silent>   <F8>    :FloatermPrev<CR>
    " tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
    " nnoremap   <silent>   <F9>    :FloatermNext<CR>
    " tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
    nnoremap   <silent>   <F12>   :FloatermToggle<CR>
    tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

    " hi Floaterm guibg=black
    " hi FloatermBorder guibg=orange guifg=cyan
    " hi FloatermNC guibg=gray
    command! Ranger FloatermNew ranger
endif
