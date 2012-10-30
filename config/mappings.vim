" Key mappings " {{{1
let mapleader = ','

" Arrow keys
nnoremap Q gq
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Cursor jumps around while joining lines
nnoremap J mzJ`z

" Jumping lands on top or bottom of screen
" <shift+m>
nnoremap m nzz
" <shift+}>
nnoremap } }zz

noremap / /\v
noremap ? ?\v
nnoremap Y y$

nnoremap <c-z> :shell<cr>

" ctrl+j/ctrl+k to move up/right/down/left in insert mode
inoremap <m-k> <C-o>gk
inoremap <m-l> <C-o>l
inoremap <m-j> <C-o>gj
inoremap <m-h> <C-o>h

" speed up scrolling of viewport slightly
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" undo redo undolist
inoremap <c-z> <c-o>u
nnoremap t <c-r>
nnoremap <leader>ul :undolist<cr>

" Encoding
noremap <silent>eu :set fenc=utf-8<cr><esc>:w!<cr>
noremap <silent>ec :set fenc=cp936<cr><esc>:w!<cr>

" Encode reopen Encoding
noremap <silent>eru :e ++enc=utf-8 %<cr>
noremap <silent>erc :e ++enc=cp936 %<cr>

" redraw map
noremap <silent>sr :redraw!<cr>

" Useful Shortcuts
vnoremap <leader>c "+y
vnoremap <leader>x "+d
nnoremap <leader>v "+P
vnoremap <leader>v "+p
nnoremap <leader>a ggVG

" Allows multiple lines to be pasted correctly
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

if g:LINUX " Linux
  " copy current path
  nnoremap <silent><leader>p :let @* = expand('%:p')<cr>
  nnoremap <leader>cp y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
  nnoremap <leader>vv :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p
elseif g:MAC " Max OXS pbcopy/pbpaste
  nnoremap <silent><leader>p :call system('pbcopy', expand('%:p'))<cr>
  vnoremap <leader>cp y:call system('pbcopy', getreg("\""))<cr>
  nnoremap <leader>vv :call setreg("\"",system('pbpaste'))<cr>p
endif

" Backspace in Visual mode deletes selection
vnoremap <bs> d

" Quickly edit/reload the vimrc file
nnoremap <silent><leader>ev :tabedit $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" Sudo to write
cmap w!! w !sudo tee % > /dev/null

" Esc and Save
imap jj <esc>
inoremap <leader>, <esc>
vnoremap <leader>, <esc>
nnoremap <leader>q :q!<esc>
nnoremap <c-s> :update<cr>

" Search
nnoremap <silent><leader><space> :set nohls!<cr>
nnoremap <silent><leader>l :let @/=""<cr>
vnoremap * y/<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>
vnoremap # y?<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>

" Use shell with ctrl-z
nnoremap <c-z> :shell<cr>
" Command Mode like terminal command
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-b> <left>
cnoremap <c-d> <del>

" Cursor
" <s-i> line begin and insert
nnoremap L $
nnoremap H ^

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" Move Lines
noremap <c-up> mz:m-2<cr>`z
noremap <c-down> mz:m+<cr>`z

" Tabs
nnoremap <leader>lt :tabs<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>n :silent tabprev<cr>
nnoremap <leader>m :silent tabnext<cr>
nnoremap <leader>tf :silent tabfirst<cr>
nnoremap <leader>tl :silent tablast<cr>
nnoremap <c-tab>:silent tabnext<cr>
nnoremap <c-s-tab>:silent tabprev<cr>
nnoremap <leader>tt :call SwitchLastUsedTab()<cr>
fun! SwitchLastUsedTab()
  if exists("g:LastUsedTabPage")
    exec "tabnext" g:LastUsedTabPage
  endif
endfun

" Faster split resizing (+,-)
if bufwinnr(1)
  nnoremap + <c-w>+
  nnoremap - <c-w>-
endif

" Move Windoes
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <leader>w <c-w>v<c-w>l

" <c-0> rest
map <c-kPlus> <c-w>+
map <c-kMinus> <c-w>-
map <s-left> <c-w><
map <s-right> <c-w>>

" Indent
noremap <tab> v>
noremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" ListChar
noremap <silent><F4> :set invlist<cr>

" Trim trailling whitespace ^M
noremap <leader>M :%s/\r//g<cr>
noremap <silent><F7> :silent %s/\s\+$//g<cr>``

" normal: 3id, insert ddd. :help .

iab YDATE <C-R>=strftime("%Y-%m-%dT%H:%M%:%S UTC%z")
map <silent><leader>d o<esc>:r!date +'\%H:\%M:\%S \%m/\%d/\%Y'<cr>\
  \:r!date +'\%H:\%M:\%S \%m/\%d/\%Y' \| sed 's/./-/g'<cr>A<cr><esc>

" Change charset by ,ee
noremap <silent><leader>ee :emenu Encoding.<tab>
noremap <leader>eo :e <c-r>=expand('%:h').'/'<cr>

" :VD
cnoremap VD $HOME/Develop/VD
cnoremap WD $HOME/Works

" ctrl - ]
norea #v # vim: set et ts=2 sts=2 sw=2 :<Esc>0f=

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓
imap aa λ

" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
" :map <Leader>] :bnext<CR>
" :map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Toggles {{{2

  " Toggle wrap/no wrap
nnoremap <leader>wr :set nowrap! nowrap?<cr>

" Toggle paste mode
nnoremap <leader>pa :set paste! paste?<cr>

" Toggle line numbers
nnoremap <leader>n ::if &nu\|se rnu\
  \|elsei &rnu\|se rnu!\
  \|el\|se nu\|endif<cr>

" Toggle Background color
nnoremap <leader>bg :let &bg = &bg == 'dark' ? 'light' : 'dark'<cr>

" Space to toggle folds
nnoremap <space>z za
vnoremap <Space>z za

" "Refocus" folds
nnoremap ,z zMzvzz

nnoremap z0 zCz0

" 2}}}

" Formatting/editing text {{{2

" opt+U to toggle word case
nnoremap <m-u> g~iw
vnoremap <m-u> g~i
inoremap <m-u> <c-o>g~iw

" Format paragraph
vnoremap <c-q> gq
nnoremap <c-q> gqap
inoremap <c-q> <c-o>gqap

" create a new line below the current one and jump to it
inoremap <m-o> <C-o>o

" Different indentations
nnoremap <leader>2s :set sw=2 sts=2 ts=2<cr>
nnoremap <leader>4s :set sw=4 sts=4 ts=4<cr>

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

" Search for diff separater stuff
nnoremap <leader>fd /^←←←<\\|^=======\\|^→→→><cr>

" 2}}}

" 1}}}
