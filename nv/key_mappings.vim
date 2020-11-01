" Map ; to : and save a million keystrokes
nnoremap ; :
noremap <F1> <Esc>"


" ------------------------------------------
" File settings
" ------------------------------------------
" INFO: reload MYVIMRC without reopen file
map <leader>rld :source $MYVIMRC<CR>
nnoremap U <C-r>
nmap <leader>WQ :wa<CR>:q<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>qq :qall<CR>
nnoremap <leader>w :w<CR>
" [WARN: sudo trick]
" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work `%` does mean `the current file name`
cmap w!! w !sudo tee %
nnoremap <leader>l :set wrap! wrap?<CR>
nnoremap <leader>, :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" ------------------------------------------
" Arrow settings
" ------------------------------------------
" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" Resize windows
map <M-up> :res +5<CR>
map <M-down> :res -5<CR>
map <M-left> :vertical resize-5<CR>
map <M-right> :vertical resize+5<CR>


" ------------------------------------------
" Search settings
" ------------------------------------------
noremap <silent><leader>/ :nohls<CR>
nnoremap / /\v
vnoremap / /\v
" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" no need to press Esc
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Better tabbing, re-select after indent
vnoremap < <gv
vnoremap > >gv
" y$ -> Y Make Y behave like other capitals
map Y y$
" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" ------------------------------------------
" coding keymap settings
" ------------------------------------------
" <enter>: completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" <TAB>: completion.
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
