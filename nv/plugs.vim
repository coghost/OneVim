" ==========================================
" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" ==========================================

" load installed plugs
function! Fundations() abort
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endfunction

function! UIUERelated() abort
    " ========== themes ==========
    Plug 'hzchirs/vim-material'    " themes
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'joshdick/onedark.vim'
    Plug 'jsit/toast.vim'
    Plug 'vim-airline/vim-airline' " Buffer Tabs and bottom statusline
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    " ========== UE ==========
    Plug 'Yggdroot/indentLine'           " text indent vertical line
    Plug 'machakann/vim-highlightedyank' " highlight yank
    Plug 'luochen1990/rainbow'           " colorful matched ({})
    Plug 'pedrohdz/vim-yaml-folds'       " fold yaml file
endfunction

function! Programming() abort
    " ========== git ==========
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'APZelos/blamer.nvim'
    " ========== writing ==========
    Plug 'tpope/vim-commentary'    " comment on codes
    Plug 'jiangmiao/auto-pairs'    " auto pair inputs
    Plug 'tpope/vim-surround'      " quick input
    Plug 'brooth/far.vim'          " quick find/replace in all files
    Plug 'junegunn/vim-easy-align' " align better
    Plug 'mbbill/undotree'         " I can regret more
    " ========== layout ==========
    Plug 'liuchengxu/vista.vim'                                              " code outline
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'} " tree navigation
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }            " popup navigation
    " ========== reading ==========
    " Plug 'wellle/context.vim'
    " ========== operating ==========
    Plug 'mhinz/vim-startify'                           " most recent open files history
    Plug 'justinmk/vim-sneak'                           " quick jump to 2 chars
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple edit
    Plug 'yilin-yang/vim-markbar'                       " marks
    Plug 'MattesGroeger/vim-bookmarks'
    " ========== interactivity ==========
    Plug 'psliwka/vim-smoothie'                         " wonderful scroll up/down experience
    " ========== automatic ==========
    Plug 'ntpeters/vim-better-whitespace'   " remove whitespace
    Plug 'vim-vdebug/vdebug'
endfunction

function! PythonDedicated() abort
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python colorize
    Plug 'SirVer/ultisnips'                                " snippets
    Plug 'honza/vim-snippets'                              " real snippets
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
endfunction

function! FocusMode() abort
    Plug 'junegunn/goyo.vim'        " typing experience
    Plug 'junegunn/limelight.vim'
endfunction

function! Assistance() abort
    Plug 'voldikss/vim-translator'
    " ========== todolist ==========
    Plug 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }
endfunction

function! InstallMyPlugs() abort
    call Fundations()
    call UIUERelated()
    call Programming()
    call PythonDedicated()
    call FocusMode()
    call Assistance()
endfunction

call plug#begin('~/.nvim/plugged')
call InstallMyPlugs()
call plug#end()
