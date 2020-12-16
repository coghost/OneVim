" ==========================================
" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" ==========================================

function! Fundations() abort
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endfunction

function! UIUE() abort
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
    Plug 'psliwka/vim-smoothie'          " wonderful scroll up/down experience
endfunction

function! GitPlugs() abort
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'APZelos/blamer.nvim'
endfunction

function! Layouts() abort
    Plug 'liuchengxu/vista.vim'                                              " code outline
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'} " tree navigation
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }            " popup navigation
    Plug 'voldikss/vim-floaterm'
endfunction

function! Programming() abort
    " ========== edit ==========
    Plug 'tpope/vim-commentary'                         " comment on codes
    Plug 'jiangmiao/auto-pairs'                         " auto pair inputs
    Plug 'tpope/vim-surround'                           " quick input
    Plug 'tpope/vim-repeat'                             " support repeat other plugins
    Plug 'brooth/far.vim'                               " quick find/replace in all files
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple edit
    Plug 'junegunn/vim-easy-align'                      " align better
    Plug 'mbbill/undotree'                              " I can regret more
    " ========== move_faster ==========
    Plug 'mhinz/vim-startify'                           " most recent open files history
    Plug 'justinmk/vim-sneak'                           " quick jump to 2 chars
    " Plug 'yilin-yang/vim-markbar'                       " marks
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'unblevable/quick-scope'                       " Plug
    Plug 'airblade/vim-rooter'
    Plug 'ntpeters/vim-better-whitespace'               " remove whitespace
endfunction

function! PythonDedicated() abort
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python colorize
    " snippets
    Plug 'SirVer/ultisnips'                                " snippets
    Plug 'honza/vim-snippets'                              " real snippets
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
    Plug 'thinca/vim-quickrun'
    Plug 'tpope/vim-abolish'
endfunction

function! Typing() abort
    Plug 'junegunn/goyo.vim'        " typing experience
    Plug 'junegunn/limelight.vim'
endfunction

function! Assistance() abort
    Plug 'voldikss/vim-translator'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'liuchengxu/vim-which-key'
    Plug 'jceb/vim-orgmode'
endfunction

function! TaskManagement() abort
    Plug 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }
    Plug 'n0v1c3/vira', { 'do': './install.sh' }
endfunction

function! Markdowns() abort
    " Plug 'plasticboy/vim-markdown'
    Plug 'godlygeek/tabular' " tabular plugin is used to format tables
    Plug 'elzr/vim-json'     " JSON front matter highlight plugin
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
endfunction

" load installed plugs
function! InstallMyPlugs() abort
    call Fundations()
    call UIUE()
    call GitPlugs()
    call Layouts()
    call Programming()
    call PythonDedicated()
    call Typing()
    call Assistance()
    call Markdowns()
    call TaskManagement()
endfunction

call plug#begin('~/.nvim/plugged')
call InstallMyPlugs()
call plug#end()
