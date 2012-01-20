" Key mappings " {{{
let mapleader = ','

" Arrow keys
nnoremap Q gq
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

noremap / /\v
noremap ? ?\v

" undo redo undolist
inoremap <c-z> <c-o>u
nnoremap t <c-r>
nnoremap <leader>ul :undolist<cr>

" Encoding
noremap <silent>eu :set fenc=utf-8<cr>:w!<cr>
noremap <silent>ec :set fenc=cp936<cr>:w!<cr>

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

if g:OS == 1 " Linux
    " copy current path
    nnoremap <silent><leader>p :let @* = expand('%:p')<cr>
    nnoremap <leader>cp y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
    nnoremap <leader>vv :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p
elseif g:OS == 2 " Max OXS pbcopy/pbpaste
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
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>n :silent tabprev<cr>
nnoremap <leader>m :silent tabnext<cr>
nnoremap <leader>tf :silent tabfirst<cr>
nnoremap <leader>tl :silent tablast<cr>
nnoremap <c-tab>:silent tabnext<cr>
nnoremap <c-s-tab>:silent tabprev<cr>

" Move Windoes
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h

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

" Line Number
noremap <silent><F2> :if &nu\|se rnu\
    \|elsei &rnu\|se rnu!\
    \|el\|se nu\|endif<cr>

" ListChar
noremap <silent><F4> :set invlist<cr>

" Trim trailling whitespace ^M
noremap <leader>M :%s/\r//g<cr>
noremap <silent><F7> :%s/\s\+$//g<cr>``

" normal: 3id, insert ddd. :help .

map <silent><leader>d o<esc>:r!date +'\%A, \%B \%d, \%Y'<cr>\
    \:r!date +'\%A, \%B \%d, \%Y' \| sed 's/./-/g'<cr>A<cr><esc>

" Change charset by ,ee
noremap <silent><leader>ee :emenu Encoding.<tab>
noremap <leader>eo :e <c-r>=expand('%:h').'/'<cr>
" "}}}
