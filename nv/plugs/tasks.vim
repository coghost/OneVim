" --------------------------------------------------
" vira
" --------------------------------------------------
if has_key(g:plugs, 'vira')
    let g:vira_config_file_servers = $HOME.'/.config/vira/vira_servers.yaml'
    " Basics
    nnoremap <silent> <leader>vI :ViraIssue<cr>
    nnoremap <silent> <leader>vS :ViraServers<cr>
    nnoremap <silent> <leader>vT :ViraTodo<cr>
    nnoremap <silent> <leader>vb :ViraBrowse<cr>
    nnoremap <silent> <leader>vc :ViraComment<cr>
    nnoremap <silent> <leader>ve :ViraEpics<cr>
    nnoremap <silent> <leader>vi :ViraIssues<cr>
    nnoremap <silent> <leader>vr :ViraReport<cr>
    nnoremap <silent> <leader>vt :ViraTodos<cr>

    " Sets
    nnoremap <silent> <leader>vsa :ViraSetAssignee<cr>
    nnoremap <silent> <leader>vsp :ViraSetPriority<cr>
    nnoremap <silent> <leader>vss :ViraSetStatus<cr>
    nnoremap <silent> <leader>vsv :ViraSetVersion<cr>

    " Edits
    nnoremap <silent> <leader>ved :ViraEditDescription<cr>
    nnoremap <silent> <leader>ves :ViraEditSummary<cr>

    " Filter search
    nnoremap <silent> <leader>vfR :ViraFilterReset<cr>

    nnoremap <silent> <leader>v/ :ViraFilterText<cr>

    nnoremap <silent> <leader>vfP :ViraFilterPriorities<cr>
    nnoremap <silent> <leader>vfa :ViraFilterAssignees<cr>
    nnoremap <silent> <leader>vfp :ViraFilterProjects<cr>
    nnoremap <silent> <leader>vfr :ViraFilterReporter<cr>
    nnoremap <silent> <leader>vfs :ViraFilterStatuses<cr>
    nnoremap <silent> <leader>vft :ViraFilterTypes<cr>
    " Projects/Boards
    nnoremap <silent> <leader>vbm :ViraLoadProject __default__<cr>
    " Functions
    function! Enter_ViraActiveIssue()
        let g:vira_active_issue = input("Enter issue.key: ")
        ViraReport
    endfunction
    nnoremap <silent> <leader>vei :call Enter_ViraActiveIssue()<cr>
    " Status
    " let v_jira = ViraStatusLine()
    " let _jira_z = "%#__accent_bold#\ue75c %{ ? ViraStatusLine() : ''}%#__restore__#"
    " let _jira_z = "%#__accent_bold# %{ViraStatusLine() ? '\ue75c' .ViraStatusLine() : ''}%#__restore__#"
    " let baz =  "%p%% %{g:airline_symbols.linenr}%l/%L \ue0a1:%c"
    " let g:airline_section_z = "%#__accent_bold# %{ViraStatusLine() ? '\ue75c' .ViraStatusLine() : ''}%#__restore__#"
    " let g:airline_section_z = '%1p%% %{g:airline_symbols.linenr} %#__accent_bold#%2l%#__restore__#:%3v%{ViraStatusLine()}'
    " let virast = "%{ViraStatusLine()}" ? "\ue75c" . ViraStatusLine() . "\ufb1d" : ''
    let g:airline_section_z = "\ue75c %{ViraStatusLine()}" . " %p%% %{g:airline_symbols.linenr}%l/%L \ue0a1:%c"
endif
