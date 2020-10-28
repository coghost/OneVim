" ==========================================
" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" load installed plugs
if filereadable(expand("~/.config/nvim/nvimrc.plugs"))
    source ~/.config/nvim/nvimrc.plugs
endif
" ==========================================
