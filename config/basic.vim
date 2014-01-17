" General: " {{{
"
" Encoding: "{{{
scriptencoding utf-8
set encoding=utf-8 nobomb
set fileencodings=utf-8,cp936,gbk
set fileformat=unix
set fileformats=unix,mac,dos

if has('multi_byte_ime')
	set iminsert=0 imsearch=0
endif
" }}}

" Ssearch: "{{{
set ignorecase
set smartcase
set hlsearch
set wrapscan
set magic
set gdefault
set incsearch
" }}}

" Edit: "{{{
set smarttab
set expandtab
set shiftround
set modeline

set tabstop=2
set shiftwidth=2
set softtabstop=2

" Use clipboard register.
if has('unnamedplus')
	set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

set backspace=indent,eol,start

set showmatch
set matchtime=3
set matchpairs+=<:>

set cpoptions-=m

set hidden

set autoread
set autowrite
set autochdir

set infercase
" }}}

" Folding: "{{{
set foldenable
set foldmethod=marker
set foldcolumn=3
set fillchars=vert:\|
set commentstring=%s
set foldtext=FoldText()
" }}}

set grepprg=grep\ -inH

" Exclude = from isfilename.
set isfname-==

" Undo: "{{{
set history=1000
set viminfo='100,f1
if exists('&undodir')
  let &undodir=$MYVIM. '/undo'
  set undofile
  set undoreload=10000
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif
"}}}

" Backup: "{{{
set nobackup
set nowritebackup
set noswapfile
"set directory=/tmp//
" }}}

"set helplang=cn,en
"if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
"  set ambiwidth=double
"endif

"let g:is_posix = 1

"set shell=/bin/bash\ --login


" cmdline_info
"set nowrap
"set ruler
"set showcmd
"set showmode
"set report=0

"set ttyfast
"set visualbell
"set t_vb=

" Scroll
"set nostartofline
"set scrolloff=3
"set scrolljump=7
"set sidescrolloff=10
"set sidescroll=1
"set diff
"if &diff && has('cursorbind')
"  set scrollbind
"  set diffopt+=context:3
"endif

" statusline
"set laststatus=2
"" Broken down into easily includeable segments
"set statusline=%<%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options
""set statusline+=%{fugitive#statusline()} " Git Hotness
"set statusline+=\ [%{&ff}/%Y]            " Filetype
"set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info


"set pastetoggle=<F3>
"
"set tags=./tags;$HOME



"set formatoptions=qrn1

"set autoindent
"set cindent
"set smartindent
"set virtualedit+=block

"set mouse=a
"set mousehide
"
"set fillchars=diff:⣿,vert:│
"set fillchars+=stl:\ ,stlnc:\


"set linebreak
"set breakat=\ |@-+;:,./?^I
"set nonumber
"set textwidth=79
"set cursorline
"set colorcolumn=+1
"set linespace=0
"set lazyredraw

"set wildcharm=<tab>
"menu Encoding.utf-8 :e ++enc=utf-8<cr>
"menu Encoding.cp936 :e ++enc=cp936<cr>

"set pumheight=10
"set confirm

"set shortmess=atToOI

" Buf
"set switchbuf=useopen,usetab
"
"set viewoptions=folds,cursor
"
"set equalalways
"set splitbelow
"set splitright

"" Better Completion
"set complete=.,w,b,u,t
"set completeopt=longest,menuone,preview
"
"" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
"set nrformats=alpha,hex,octal
"
"set list
"" Some other cool stuff to use: ᅴ ᗛ ← ↔ ↝ ↠ ↤ ↩ ↲ ↺ ↻ ⇐ ⇠ ⇤ ⇥ ⇰ ∞ ⌦ ⌫ ⌧ ⏎ ☢☥ ☯ ☹ ☺
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
"set showbreak=↪
"
""blank-空白 buffers-缓冲区 curdir-当前目录 folds-折叠 help-帮助 options-选项
""tabpages-选项卡 winsize-窗口大小 slash-转换文件路径中的\为/以使session文件兼容unix
""unix-设置session文件中的换行模式为unix
"set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
"
"set title
"set titlestring=Vim:\ %f\ %h%r%m
"
"set dictionary=/usr/share/dict/words
"let &spellfile=g:myvim . '/custom-dictionary.utf-8.add'
"
"" Don't try to highlight lines longer than 800 characters.
"set synmaxcol=800
"
"" Basically this makes terminal Vim work sanely.
"set notimeout
"set ttimeout
"set ttimeoutlen=10
"
"" wildmenu
"set wildmenu
"set wildmode=list:longest,full
"set wildignore+=.git,.hg,.svn
"set wildignore+=*.a,*.o,*.obj,*~
"set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.psd
"set wildignore+=*~,*.sw?,*.tmp
"set wildignore+=*.pyc,*.luac
"set wildignore+=.DS_Store

" ColorScheme: "{{{
set background=dark
let g:badwolf_tabline = 2
let g:badwolf_html_link_underline = 0
colorscheme badwolf
" }}}
" }}}
