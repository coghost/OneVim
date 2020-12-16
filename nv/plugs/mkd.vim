" --------------------------------------------------
" vim-markdown
" --------------------------------------------------
if has_key(g:plugs, 'vim-markdown')
    let g:vim_markdown_folding_disabled = 1
    " do not use conceal feature, the implementation is not so good
    let g:vim_markdown_conceal = 0
    " disable math tex conceal feature
    let g:tex_conceal = ""
    let g:vim_markdown_math = 1

    " support front matter of various format
    let g:vim_markdown_frontmatter = 1  " for YAML format
    let g:vim_markdown_toml_frontmatter = 1  " for TOML format
    let g:vim_markdown_json_frontmatter = 1  " for JSON format
endif


" --------------------------------------------------
" markdown-preview.nvim
" --------------------------------------------------
if has_key(g:plugs, 'markdown-preview.nvim')
    let g:mkdp_auto_close = 0
    noremap <Space>mpv :MarkdownPreview<CR>
endif


" --------------------------------------------------
" tabular
" --------------------------------------------------
if has_key(g:plugs, 'tabular')
    nmap « :Tabularize /
    nmap <M-\> :Tabularize /
    vmap « :Tabularize /
    vmap <M-\> :Tabularize /
    nmap † :Tabularize /\|<CR>
    nmap <M-t> :Tabularize /\|<CR>
    inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

    function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
    endfunction
endif


if has_key(g:plugs, 'vim-pandoc-syntax')
    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
endif
