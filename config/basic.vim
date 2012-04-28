" General " {{{
12" Requires for 256 colors in OS X iTerm(2)

if has('syntax')
  syntax on
  syntax sync fromstart
  set background=dark
  sil! colorscheme solarized
endif

if has('cmdline_info')
  set ruler
  set showcmd
  set showmode
endif

if has('statusline')
  set laststatus=2
  set stl=%<%f
  set stl+=\ %m%r%h%w
  set stl+=%{fugitive#statusline()}
  set stl+=%=%-14.(0x%04.4B\ [E:%{&fenc}\ T:%Y\ F:%{&ff}\]%)
  set stl+=\ [L:%l/%L\ C:%v\ (%p%%)]
endif

if has('wildmenu')
  set wildmenu
  set wildmode=longest:full
  if has('wildignore')
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.psd
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
  endif
endif

if has('extra_search')
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
  set ambiwidth=double
endif

set backspace=indent,eol,start

set timeoutlen=500
set clipboard+=unnamed
set pastetoggle=<F3>

set tags=./tags;$HOME

set modeline
set modelines=5

set autowrite
set autoread
set autochdir

set hidden
set history=256

if exists('&undodir')
  set undofile
  set undoreload=256
  set undolevels=100
  let &undodir=g:MYVIM . "/undo"
endif

" Backup
set nobackup
set nowritebackup
set noswapfile

" Search
set magic
set wrapscan
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
set showmatch
set display=lastline

" Tab
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set nowrap
set display=lastline
" "}}}

" Visual "{{{

set mouse=a
set mousehide

set matchtime=2

set linebreak
set nonumber
set textwidth=80
set cursorline
set colorcolumn=+1
set nostartofline

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

set shortmess=atI

" Scroll
set scrolloff=3
set sidescrolloff=3
if &diff && has('cursorbind')
    set scrollbind
endif


set viewoptions=folds,cursor
set foldenable
set foldmethod=manual
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

" Some other cool stuff to use: ᅴ ᗛ ← ↔ ↝ ↠ ↤ ↩ ↲ ↺ ↻ ⇐ ⇠ ⇤ ⇥ ⇰ ∞ ⌦ ⌫ ⌧ ⏎ ☢☥ ☯ ☹ ☺
"set listchars=tab:▸\
""set listchars+=trail:
"set listchars+=nbsp:_
"set listchars+=eol:¬
"set listchars+=extends:>
"set listchars+=precedes:<
set listchars=tab:▸\ ,eol:¬,trail:·
set list
set showbreak=↪

"blank-空白 buffers-缓冲区 curdir-当前目录 folds-折叠 help-帮助 options-选项
"tabpages-选项卡 winsize-窗口大小 slash-转换文件路径中的\为/以使session文件兼容unix
"unix-设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

set title

set helplang=cn,en

" Encoding
set nobomb
set fileformat=unix
set fileformats=unix,mac,dos
set encoding=utf-8 nobomb
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb2312
set fencs+=gb18030,big5,cp936,chinese
set fencs+=euc-jp,euc-kr,latin1

" "}}}
