" General " {{{1
" http://vim.wikia.com/wiki/Best_Vim_Tips
12" Requires for 256 colors in OS X iTerm(2)

if has ('multi_byte')
  scriptencoding utf-8
endif

if has('syntax')
  syntax enable
  syntax on
  set background=dark
  sil! colorscheme solarized
endif

if has('cmdline_info')
  set ruler
  set showcmd
  set showmode
  set report=0
endif

if has('statusline')
  set laststatus=2
  set stl=%f%m%r%h%w
  set stl+=%{fugitive#statusline()}
  set stl+=%=%-14.(0x%04.4B\ [E:%{&fenc}\ T:%Y\ F:%{&ff}\]%)
  set stl+=\ [L:%l/%L\ C:%v\ (%p%%)]
endif

if has('wildmenu')
  set wildmenu
  "set wildmode=longest:full,full
  set wildmode=list:longest,full
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

if has('folding')
  set foldcolumn=0
  set foldenable
  set foldlevel=0
  set foldmethod=marker
  set foldtext=FoldText()
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
  set ambiwidth=double
endif

" Set dictionary path
set dictionary+=/usr/share/dict/words

set cpoptions=aABceFsmq

set backspace=indent,eol,start

set timeoutlen=1200
set ttimeoutlen=50
set clipboard=unnamed,unnamedplus,autoselect
set pastetoggle=<F3>

set tags=./tags;$HOME

set modeline
set modelines=5

set autowrite
set autoread
set autochdir

set hidden
set history=233

if exists('&undodir')
  let &undodir=g:MYVIM . "/undo"
  set undofile
  set undoreload=256
  set undolevels=100
  set updatetime=1500
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
" }}}

" Formatting {{{
set formatoptions=tcrqwnl1

" Edit
set autoindent
set cindent
set smartindent
set shiftround
set noshowmatch
set virtualedit=block

" Tab
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set nowrap
set display=lastline
" }}}

" Visual "{{{
set mouse=nvr
set mousehide

set fillchars+=stl:\ ,stlnc:\

set matchtime=2

set linebreak
set breakat=\ |@-+;:,./?^I
set nonumber
set textwidth=80
set cursorline
set colorcolumn=+1
set nostartofline
set nostartofline
set linespace=0
set lazyredraw

set wildcharm=<tab>
menu Encoding.utf-8 :e ++enc=utf-8<cr>
menu Encoding.gbk :e ++enc=gbk<cr>
menu Encoding.gb2312 :e ++enc=gb2312<cr>
menu Encoding.windows-1251 :e ++enc=cp1251<cr>
menu Encoding.ibm-866 :e ++enc=ibm866<cr>

"set completeopt+=preview
set completeopt=menu,longest
set pumheight=10
set confirm

" Disable all bells
set novisualbell noerrorbells vb t_vb=

set shortmess=atToOI

" Buf
set switchbuf=useopen,usetab

" Scroll
set scrolloff=10
set scrolljump=10
if &diff && has('cursorbind')
    set scrollbind
    set diffopt+=context:3
endif

set viewoptions=folds,cursor

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

set list
" Some other cool stuff to use: ᅴ ᗛ ← ↔ ↝ ↠ ↤ ↩ ↲ ↺ ↻ ⇐ ⇠ ⇤ ⇥ ⇰ ∞ ⌦ ⌫ ⌧ ⏎ ☢☥ ☯ ☹ ☺
"set listchars=tab:->,trail:·,eol:¬,nbsp:_
set listchars=tab:→·,extends:>,precedes:<,nbsp:␠,trail:␠,eol:¬
set showbreak=↪

"blank-空白 buffers-缓冲区 curdir-当前目录 folds-折叠 help-帮助 options-选项
"tabpages-选项卡 winsize-窗口大小 slash-转换文件路径中的\为/以使session文件兼容unix
"unix-设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

set title
set titlestring=Vim:\ %f\ %h%r%m

set helplang=cn,en

" Encoding
set nobomb
set fileformat=unix
set fileformats=unix,mac,dos
set encoding=utf-8 nobomb
set termencoding=utf-8
set fencs=utf-8,ucs-bom,gbk,gb2312,gb18030,big5,cp936,chinese,euc-jp,euc-kr,latin1

" 1}}}
