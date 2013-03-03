" Key mappings " {{{1
let mapleader = ","
let maplocalleader = "\\"

" Stop it, hash key.
inoremap # X<BS>#

" Kill window
noremap K :q<cr>

" Man
nnoremap M K

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Toggle line numbers
nnoremap <leader>n ::if &nu\|se rnu\
  \|elsei &rnu\|se rnu!\
  \|el\|se nu\|endif<cr>

" Tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tf :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>
nnoremap <leader>lt :tabs<cr>
nnoremap <leader>tt :call SwitchLastUsedTab()<cr>
fun! SwitchLastUsedTab()
  if exists("g:LastUsedTabPage")
    exec "tabnext" g:LastUsedTabPage
  endif
endfun

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
nnoremap <F6> :set paste!<cr>
if $MACOSX " Max OXS pbcopy/pbpaste
  nnoremap <silent><leader>p :call system('pbcopy', expand('%:p'))<cr>
  vnoremap <leader>cp y:call system('pbcopy', getreg("\""))<cr>
  nnoremap <leader>vv :call setreg("\"", system('pbpaste'))<cr>p
elseif $LINUX " Linux
  " copy current path
  nnoremap <silent><leader>p :let @* = expand('%:p')<cr>
  nnoremap <leader>cp y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
  nnoremap <leader>vv :call setreg("\"", system("xclip -o -selection clipboard"))<cr>p
endif
" Allows multiple lines to be pasted correctly
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
vnoremap u <nop>
vnoremap gu u

" Highlight Group(s)
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Clean trailling whitespace ^M
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Panic Button
nnoremap <f9> mzggg?G`z

" Use shell with ctrl-z
nnoremap <c-z> :shell<cr>
" Command Mode like terminal command
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-b> <left>
cnoremap <c-d> <delete>
cnoremap <M-b> <s-left>
cnoremap <M-f> <s-right>
cnoremap <M-d> <s-right><delete>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
cnoremap <esc>d <s-right><delete>
cnoremap <c-g> <c-c>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Reformat line.
" I never use l as a macro register anyway.
nnoremap ql gqq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Easier linewise reselection
nnoremap <leader>v V`]

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" I suck at typing.
nnoremap <localleader>= ==
vnoremap - =

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" <m-j>∆ and <m-k>˚ to drag lines in any mode
noremap ∆ :m+<cr>
noremap ˚ :m-2<cr>
inoremap ∆ <esc>:m+<cr>
inoremap ˚ <esc>:m-2<cr>
vnoremap ∆ :m'>+<cr>gv
vnoremap ˚ :m-2<cr>gv

" Easy filetype switching
nnoremap _md :set ft=markdown<cr>
nnoremap _js :set ft=javascript<cr>
nnoremap _d  :set ft=diff<cr>

" Insert Mode Completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>

" Quick editing {{{
nnoremap <leader>ev :vsplit $MVIMRC<cr>
" }}}

" Searching and moment {{{
nnoremap / /\v
vnoremap / /\v
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}

map <tab> %
unmap [%
unmap ]%

" Made D behave
nnoremap D d$

" Backspace in Visual mode deletes selection
vnoremap <bs> d

" Don't move on *
nnoremap * *<c-o>

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
nnoremap Y y$
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <Leader>ls :buffers<cr>

noremap <leader>v <C-w>v

" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" }}}

" List navigation {{{
nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz
" }}}

" Folding  {{{
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where the cursor happens to be.
nnoremap zO zCzO
" }}}

" Shortcut for [] {{{
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[
" }}}

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

" Useful Shortcuts
vnoremap <leader>c "+y
vnoremap <leader>x "+d
nnoremap <leader>v "+P
vnoremap <leader>v "+p
nnoremap <leader>a ggVG

" Quickly edit/reload the vimrc file
nnoremap <silent><leader>ev :tabedit $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" Esc and Save
inoremap jj <esc>
inoremap <leader>, <esc>
vnoremap <leader>, <esc>
nnoremap <leader>q :q!<esc>
nnoremap <c-s> :update<cr>

" Search
nnoremap <silent><leader><space> :set nohls!<cr>
nnoremap <silent><leader>l :let @/=""<cr>
vnoremap * y/<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>
vnoremap # y?<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>

" Faster split resizing (+,-)
if bufwinnr(1)
  nnoremap + <c-w>+
  nnoremap - <c-w>-
endif

" Move Windoes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
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

" normal: 3id, insert ddd. :help .

iab YDATE <C-R>=strftime("%Y-%m-%dT%H:%M%:%S UTC%z")
map <silent><leader>d o<esc>:r!date +'\%H:\%M:\%S \%m/\%d/\%Y'<cr>\
  \:r!date +'\%H:\%M:\%S \%m/\%d/\%Y' \| sed 's/./-/g'<cr>A<cr><esc>

" Change charset by ,ee
noremap <silent><leader>ee :emenu Encoding.<tab>
noremap <leader>eo :e <c-r>=expand('%:h').'/'<cr>

" Codes DIR
cnoremap Codes $HOME/Codes

" ctrl - ]
norea #v # vim: set et ts=2 sts=2 sw=2 :<Esc>0f=

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓
imap aa λ

" Toggles {{{2

  " Toggle wrap/no wrap
nnoremap <leader>wr :set nowrap! nowrap?<cr>

" Toggle Background color
nnoremap <leader>bg :let &bg = &bg == 'dark' ? 'light' : 'dark'<cr>

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

nnoremap <leader>ft Vatzf

" 2}}}

" CSS properties sorted
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" 1}}}
