function V5() abort
    Plug 'glepnir/dashboard-nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'hardcoreplayers/spaceline.vim'
endfunction

if has_key(g:plugs, 'spaceline.vim')
    let g:spaceline_colorscheme = 'space'
    let g:spaceline_seperate_style= 'slant-cons'
endif


if has_key(g:plugs, 'barbar.nvim')
    let bufferline = {}

    let bufferline.shadow = v:true
    let bufferline.icons = v:true
    let bufferline.closable = v:true
    let bufferline.clickable = v:true
    let bufferline.semantic_letters = v:true
    let bufferline.letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'
    let bufferline.maximum_padding = 2

    let bg_current = get(nvim_get_hl_by_name('Normal',     1), 'background', '#000000')
    let bg_visible = get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#000000')
    let bg_inactive = get(nvim_get_hl_by_name('TabLine',   1), 'background', '#000000')

    hi default link BufferCurrent      Normal
    hi default link BufferCurrentMod   Normal
    hi default link BufferCurrentSign  Normal
    exe 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=' . bg_current

    hi default link BufferVisible      TabLineSel
    hi default link BufferVisibleMod   TabLineSel
    hi default link BufferVisibleSign  TabLineSel
    exe 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=' . bg_visible

    hi default link BufferInactive     TabLine
    hi default link BufferInactiveMod  TabLine
    hi default link BufferInactiveSign TabLine
    exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive

    hi default BufferShadow guifg=#FFFFFF guibg=#000000

    " shortcut
    nnoremap <silent>    <Space>b :BufferPick<CR>
    nnoremap <silent>    <Space>bd :BufferOrderByDirectory<CR>
    nnoremap <silent>    <Space>bl :BufferOrderByLanguage<CR>
    nnoremap <silent>    <Space>-- :BufferMovePrevious<CR>
    nnoremap <silent>    <Space>== :BufferMoveNext<CR>

    nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
    nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
    nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
    nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
    nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
    nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
    nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
    nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
    nnoremap <silent>    <leader>9 :BufferGoto 9<CR>
    nnoremap <silent>    <leader>0 :BufferLast<CR>

    nnoremap <silent>    + :BufferNext<CR>
    nnoremap <silent>    _ :BufferPrevious<CR>
    " nnoremap <silent>    = :BufferNext<CR>
    " nnoremap <silent>    - :BufferPrevious<CR>
endif
