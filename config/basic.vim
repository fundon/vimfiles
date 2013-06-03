set encoding=utf-8
set clipboard+=unnamed
set pastetoggle=<F10>

" Basically this makes terminal Vim work sanely.
set timeoutlen=250
set notimeout
set ttimeout
set ttimeoutlen=10

set history=256
set nobackup
set nowritebackup 
set noswapfile
set undodir=$MYVIM/undo
set undoreload=10000
set undofile

set modeline
set modelines=5

" "}}}

set scrolloff=3

set shiftround

set showmode

set hidden

set ttyfast

set ruler

set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

" Formatting "{{{
set ft+=o
set fo-=r
set fo-=t

set wrap
set textwidth=79

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set backspace=indent,eol,start

set autoindent
set cindent
set indentkeys-=0#
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" "}}}

" Visual "{{{
syntax on

set mouse=a
set mousehide

set nonumber
set showmatch
set matchtime=2

set wildmenu
set wildmode=longest,list

set completeopt+=preview

set novisualbell
set noerrorbells
set vb t_vb=

set laststatus=2
set shortmess=atI
set showcmd

set statusline=%<%f\ 
set stl+=[%{&ff}]
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable
set foldmethod=marker
set foldlevel=100

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

set list
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
set showbreak=↪

" "}}}

set number
set cursorline
set cursorcolumn

set autoread
set autowrite
set autochdir

" Mappings {{{

let g:is_posix = 1
let mapleader = ","
let maplocalleader = '  '

inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>
inoremap jj <Esc>
noremap <leader><leader> <Esc>
noremap <localleader><space> <Esc>
noremap j gj
noremap k gk

" Buffers "{{{
nnoremap <localleader>- :bd<CR>
nnoremap <localleader>-- :bd!<CR>
" }}}

nnoremap <leader>1 yypVr=
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
map <silent> <F9> :set invlist<CR>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" fold tag for HTML
nnoremap <leader>ft Vatzf
" Sorted CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

nnoremap <leader>q gqip

nnoremap <leader>v V`]

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" open a new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" Split line(opposite to S-J joining line)
nnoremap <C-J> gEa<CR><ESC>ew

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <C-J> {
nmap <C-K> }

" copy filename 
map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
" " copy path
map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

" Duplication
nnoremap <leader>c mz"dyy"dp`z
vnoremap <leader>c "dymz"dP`z

" Tabs "{{{
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>
" "}}}

" Search {{{

nnoremap / /\v
vnoremap / /\v

" }}}

" Indent
noremap <tab> v>
noremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" }}}


" AB "{{{
"ab # encoding: UTF-8 # encoding: UTF-8
" "}}}
