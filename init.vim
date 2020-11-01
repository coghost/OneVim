" ==========================================
" Leader Key, Set it before all configs
" ==========================================
let mapleader = ','   " only work in local namespace
let g:mapleader = ',' " work for global
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ==========================================
" General settings
" ==========================================
source $HOME/.config/nvim/nv/plugs.vim
source $HOME/.config/nvim/nv/general_settings.vim
source $HOME/.config/nvim/nv/key_mappings.vim
source $HOME/.config/nvim/nv/au_cmd.vim


" ==========================================
" Plugin configuration
" ==========================================
source $HOME/.config/nvim/nv/plugs/coc_ext.vim
source $HOME/.config/nvim/nv/plugs/ui.vim
source $HOME/.config/nvim/nv/plugs/program.vim
source $HOME/.config/nvim/nv/plugs/python.vim
source $HOME/.config/nvim/nv/plugs/assist.vim
