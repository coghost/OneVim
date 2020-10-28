" ==========================================
" General Settings
" ==========================================
" colorscheme
set background=dark
" colorscheme vim-material
" colorscheme material
colorscheme toast

" ------------------------------------------
" File settings
" ------------------------------------------
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set history=1024          " Vim default: 10000(the maximum value), vi defautl: 0
set clipboard=unnamedplus " Copy paste between vim and everything else
filetype on               " Detect file type
filetype indent on
filetype plugin on        " Load plugin by file type
filetype plugin indent on " Enabled by default in nvim
set encoding=utf-8
syntax enable
set hidden                " Required to keep multiple buffers open multiple buffers
set ignorecase
set smartcase
set autoread
set iskeyword+=-          " treat dash separated words as a word text object"
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m      " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B      " 合并两行中文时，不在中间加空格

" ------------------------------------------
" Typing settings
" ------------------------------------------
set conceallevel=0                  " So that I can see `` in markdown files
set expandtab                       " Converts tabs to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround                      " Use multiple of shiftwidth when indenting with '<' and '>'
set autoindent
set smartindent                     " Makes indenting smart
set showcmd
set noshowmode                      " We don't need to see things like -- INSERT -- anymore
set nobackup                        " This is recommended by coc
set nowritebackup                   " This is recommended by coc
set updatetime=100                  " Faster completion
set timeoutlen=500                  " By default timeoutlen is 1000 ms
set formatoptions-=cro              " Stop newline continution of comments
set completeopt=longest,menu        " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set wildmenu                        " 增强模式中的命令行自动完成操作
set wildignore=*.o,*~,*.pyc,*.class " Ignore compiled files
set backspace=eol,start,indent      " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l              " TODO: whichwrap effects
set cursorcolumn                    " 突出显示当前列
set cursorline                      " 突出显示当前行
set scrolloff=10                    " 上下移动光标, 最小保留行数
set showmatch                       " 括号配对情况, 跳转并高亮匹配的括号
set matchtime=2
set foldenable                      " 折叠方法
set foldmethod=indent
set foldlevel=99
set foldlevelstart=99

" ==========================================
" Display Settings
" ==========================================

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

set lazyredraw
set nowrap
set ruler                                          " show cursor position
set number                                         " show line number
set relativenumber number
set fillchars=vert:┃     " FCS: Sign for vsplits
set pumheight=10         " POPUP: Makes popup menu smaller
set laststatus=2         " STL: Always display the status line
set statusline=%#LineNr# " TODO: read https://jdhao.github.io/2019/11/03/vim_custom_statusline/
set mouse-=a              " MOUSE: set mouse-=a to disable
set splitbelow                          " WINDOW: Horizontal splits will automatically be below
set splitright                          " WINDOW: Vertical splits will automatically be to the right
set showtabline=2                       " Always show tabs
