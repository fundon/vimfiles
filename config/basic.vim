" General " {{{

set timeoutlen=500
set clipboard+=unnamed
set pastetoggle=<F3>

set tags=./tags;$HOME

set modeline
set modelines=5

set autowrite
set autoread
set autochdir

set history=256
set undofile
set undoreload=256
set undolevels=1000

set hidden

" Backup
set nobackup
set nowritebackup
set noswapfile
let &undodir=g:MYVIM . "/und"

" Search
set magic
set hlsearch
set smartcase
set incsearch
set nowrapscan
set gdefault

set matchpairs+=<:>

let g:is_posix = 1
" "}}}

" Formatting " {{{
set fo+=o
set fo-=r
set fo-=t

" Edit
set autoindent
set cindent
set smartindent
set shiftround
set backspace=indent,eol,start
set showmatch
set display=lastline

" Tab
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set nowrap
set display=lastline
" "}}}

" Visual "{{{
syntax on

set mouse=a
set mousehide

set matchtime=2

set linebreak
set nonumber
set textwidth=80
set cursorline
set colorcolumn=+1

set wildmenu
set wildignore=.DS_STORE
set wildmode=longest:full,full
set wildcharm=<tab>
menu Encoding.utf-8 :e ++enc=utf-8<cr>
menu Encoding.gbk :e ++enc=gbk<cr>
menu Encoding.gb2312 :e ++enc=gb2312<cr>
menu Encoding.windows-1251 :e ++enc=cp1251<cr>
menu Encoding.ibm-866 :e ++enc=ibm866<cr>

set completeopt+=preview

" Bell
set novisualbell
set noerrorbells
set vb t_vb=

set laststatus=2
set shortmess=atI
set showcmd

" Scroll
set scrolloff=3
set sidescrolloff=3
if &diff && has('cursorbind')
    set scrollbind
endif

"set statusline=%1*%F%m%r%h%w
"set stl+=%2*%=(%{&ff}/%Y/%{&fenc})
"set stl+=%3*\ (line\ %l\/%L,\ col\ %c,\ 0x%04.4B)\ %P
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%{&fenc}\ %l,%c%)\ 0x%04.4B\ %P

set foldenable
set foldmethod=marker
set foldlevel=100

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix

set equalalways
set splitbelow
set splitright

" Insert mode completion options
set completeopt=menu
" Configure complete options to complete
set complete=
" from current buffer
set complete+=.
" from other opened bufers
set complete+=b
" from tags
set complete+=t
" from dictionary
set complete+=k
" from included files
set complete+=i
" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

"set list
set listchars=tab:▸\ ,eol:¬
set showbreak=↪ 
set background=dark

"blank-空白 buffers-缓冲区 curdir-当前目录 folds-折叠 help-帮助 options-选项
"tabpages-选项卡 winsize-窗口大小 slash-转换文件路径中的\为/以使session文件兼容unix
"unix-设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

set helplang=cn,en

" Encoding
set nobomb
set fileformat=unix
set fileformats=unix,mac,dos
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb2312
set fencs+=gb18030,big5,cp936,chinese
set fencs+=euc-jp,euc-kr,latin1
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

" "}}}
