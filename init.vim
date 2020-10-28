" ==========================================
" Leader Key, Set it before all configs
" ==========================================
let mapleader = ','   " only work in local namespace
let g:mapleader = ',' " work for global
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

source $HOME/.config/nvim/nv/plugins.vim
source $HOME/.config/nvim/nv/general_settings.vim
source $HOME/.config/nvim/nv/key_mappings.vim
source $HOME/.config/nvim/nv/au_cmd.vim

" ==========================================
" TODO: Reading
" http://springest.io/vim-buffers-tabs-windows-and-modes
