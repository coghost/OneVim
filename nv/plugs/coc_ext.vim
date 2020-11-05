" --------------------------------------------------
" coc-fzf-preview same as fzf-preview.vim
" --------------------------------------------------
function! CustomCocFzfPreview() abort
    nmap <Space>f [fzf-p]
    xmap <Space>f [fzf-p]

    nnoremap <silent> [fzf-p]f     :<C-u>CocCommand fzf-preview.FromResources project_mru project<CR>
    " nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
    nnoremap <silent> <Space>g     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
    nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
    nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
    nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
    nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
    nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
    nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
    nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
    nnoremap <silent> <Space>*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
    nnoremap <silent> <Space>/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
    " nnoremap          <Leader>G    :<C-u>CocCommand fzf-preview.ProjectGrep --resume<Space>
    nnoremap          [fzf-p]/     :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    xnoremap          [fzf-p]/     "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
    xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
    nnoremap          [fzf-p]\     :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--nth=3<Space>
    xnoremap          [fzf-p]\     "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"  --add-fzf-arg=--nth=3
    nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
    nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
    nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
    nnoremap <silent> [fzf-p]h     :<C-u>CocCommand fzf-preview.CommandPalette<CR>
    nnoremap <silent> [fzf-p]bm     :<C-u>CocCommand fzf-preview.Bookmarks<CR>
    nnoremap <silent> [fzf-p]m     :<C-u>CocCommand fzf-preview.Marks<CR>

    " floating window size ratio
    let g:fzf_preview_floating_window_rate = 0.95
    let g:fzf_preview_command = 'bat --color=always --plain {-1}'
    let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
    let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
    let g:fzf_preview_use_dev_icons = 1
    let g:fzf_preview_dev_icons_limit = 5000
    let g:fzf_preview_dev_icon_prefix_string_length = 3
    let g:fzf_preview_fzf_preview_window_option = 'right:60%'
endfunction


" --------------------------------------------------
" coc-spell-checker
" --------------------------------------------------
function! CustomCocSpellChecker() abort
    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
endfunction


" --------------------------------------------------
" coc-git
" --------------------------------------------------
function! CustomCocGit() abort
    set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
    autocmd User CocGitStatusChange {command}
    " navigate chunks of current buffer
    nmap [n <Plug>(coc-git-prevchunk)
    nmap ]n <Plug>(coc-git-nextchunk)
    nmap gs <Plug>(coc-git-chunkinfo)
    nmap gh <Plug>(coc-git-commit)
    nnoremap <silent> <space>g :<C-u>CocList --normal gstatus<CR>
endfunction


" --------------------------------------------------
" coc-explorer
" --------------------------------------------------
function! CustomCocExplorer() abort
    let g:coc_explorer_global_presets = {
                \   '.vim': {
                \     'root-uri': '~/.vim',
                \   },
                \   'tab': {
                \     'position': 'tab',
                \     'quit-on-open': v:true,
                \   },
                \   'floating': {
                \     'position': 'floating',
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingTop': {
                \     'position': 'floating',
                \     'floating-position': 'center-top',
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingLeftside': {
                \     'position': 'floating',
                \     'floating-position': 'left-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingRightside': {
                \     'position': 'floating',
                \     'floating-position': 'right-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'simplify': {
                \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                \   }
                \ }
    " Use preset argument to open it
    nmap <leader>ed :CocCommand explorer --preset .vim<CR>
    nmap <leader>ef :CocCommand explorer --preset floating<CR>

    " List all presets
    nmap <leader>el :CocList explPresets<CR>
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
endfunction


" --------------------------------------------------
" coc.vim
" --------------------------------------------------
if has_key(g:plugs, 'coc.nvim')
    " \ 'coc-git',
    " \ 'coc-python',
    " \ 'coc-pyright',
    let g:coc_global_extensions = [
                \ 'coc-actions',
                \ 'coc-explorer',
                \ 'coc-flutter-tools',
                \ 'coc-highlight',
                \ 'coc-json',
                \ 'coc-markdownlint',
                \ 'coc-pairs',
                \ 'coc-fzf-preview',
                \ 'coc-pyright',
                \ 'coc-sh',
                \ 'coc-snippets',
                \ 'coc-spell-checker',
                \ 'coc-syntax',
                \ 'coc-vimlsp',
                \ 'coc-yaml'
                \]

    " TextEdit might fail if hidden is not set.
    set hidden
    set nowritebackup
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
    set updatetime=100

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    " inoremap <silent><expr> <TAB>
    "             \ pumvisible() ? "\<C-n>" :
    "             \ <SID>check_back_space() ? "\<TAB>" :
    "             \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " function! s:check_back_space() abort
    "     let col = col('.') - 1
    "     return !col || getline('.')[col - 1]  =~# '\s'
    " endfunction

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> <F3> <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    " semshi highlight has conflict with this
    if has_key(g:plugs, 'semshi') != 1
        if &filetype !=# 'python'
            " Highlight the symbol and its references when holding the cursor.
            autocmd CursorHold * silent call CocActionAsync('highlight')
        endif
    endif

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    nmap <F6> <Plug>(coc-rename)

    " Formatting selected code.
    " xmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'setup.cfg', 'setup.py', 'pyproject.toml']

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    hi CocHighlightText guibg=#556873 gui=bold

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    nnoremap <space>l :call CocAction('format')<cr>

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


    if index(g:coc_global_extensions, 'coc-git') != -1
        call CustomCocGit()
    endif

    if index(g:coc_global_extensions, 'coc-explorer') != -1
        nnoremap <leader>t :CocCommand explorer<cr>
        call CustomCocExplorer()
    endif

    if index(g:coc_global_extensions, 'coc-fzf-preview') != -1
        call CustomCocFzfPreview()
    endif

    if index(g:coc_global_extensions, 'coc-spell-checker') != -1
        call CustomCocSpellChecker()
    endif
endif
