" <Leader>
" 修改leader键
" only work in local namespace
let mapleader = ','
" work for global
let g:mapleader = ','

" TODO: comment each line.
"==========================================
" Initial Plugin 加载插件
"==========================================

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

"==========================================
" General Settings 基础设置
"==========================================

" history存储容量
set history=2000

" use system clipboard
set clipboard=unnamed

" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启语法高亮着色
syntax on
" detect file type
filetype on
" load plugin by file type
filetype plugin on
" 启动自动补全
filetype plugin indent on
" 文件修改后自动载入
set autoread

" ctrlP 排除某些文件/目录
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" Remember info about open buffers on close
" 存储缓冲列表参考:https://blog.csdn.net/huiguixian/article/details/6447665
set viminfo^=%

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 开启实时搜索
set incsearch
" 高亮搜索内容
set hlsearch


" Keep search pattern at the center of the screen.
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
" nnoremap <silent> * *zz
" nnoremap <silent> # #zz
" nnoremap <silent> g* g*zz

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" 大小写不敏感
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" magic
set magic

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" =================================
" 配色方案
" theme主题
" =================================
set background=dark
if !has('gui_running')
  set t_Co=256
endif
let base16colorspace=256
set termguicolors
" colorscheme molokai
" colorscheme onedark
colorscheme base16-default-dark

" TODO: 理解如下定义作用
" 设置标记一列的背景颜色和数字一行颜色一致
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


"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================
" show cursor position
set ruler
" show line number
set number
set rnu
" 取消换行
set nowrap
" 显示输入的命令
set showcmd
" 显示当前vim模式
set showmode

" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline
" 上下移动光标, 最小保留行数
set scrolloff=5

" 括号配对情况, 跳转并高亮匹配的括号
set showmatch
set matchtime=2

" TODO: 命令行（在状态行下）的高度，默认为1，这里是2
" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround


"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================


" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

nmap <Leader>WQ :wa<CR>:q<CR>
" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>
" remap U to <C-r> for easier redo
nnoremap U <C-r>

" F1 废弃这个键,防止调出系统帮助
" II can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1> can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
" ,m 显示/隐藏行号
nnoremap <Leader>m :call HideNumber()<CR>
" ,l 换行开关
nnoremap <Leader>l :set wrap! wrap?<CR>
" ,, 语法开关，关闭语法可以加快大文件的展示
nnoremap <Leader>, :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

