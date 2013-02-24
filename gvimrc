set columns=88
set lines=55
set guioptions=ace
set guioptions-=TlLrR
set guifont=Monaco:h14

map <silent> <F11> :if &guioptions =~# 'T' <Bar>
  \ set guioptions-=T <Bar>
  \ set guioptions-=m <Bar>
  \ else <Bar>
  \ set guioptions+=T <Bar>
  \ set guioptions+=m <Bar>
  \ endif<cr>

highlight SpellBad term=underline gui=undercurl guisp=Orange

" Different cursors for different modes.
set guicursor=n-c:block-Cursor-blinkon0
set guicursor+=v:block-vCursor-blinkon0
set guicursor+=i-ci:ver20-iCursor

if $MAC
  " Full screen means FULL screen
  set fuoptions=maxvert,maxhorz
  " Map Cmd+<n> to move to tab <n>.
  for i in range(1,9)
    silent exec "map <D-".i."> ".i."gt"
  endfor
  map <D-0> :tablast<cr>
  noremap <D-M-Left> :tabprev<cr>
  noremap <D-M-Right> :tabnext<cr>

  macmenu &File.New\ Tab key=<nop>
  map <leader>t <Plug>PeepOpen
  set transparency=10
  set macmeta
  let macvim_hig_shift_movement = 1
  set antialias

  " Use the normal HIG movements, except for M-Up/Down
  let macvim_skip_cmd_opt_movement = 1
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  no   <M-Right>      <C-Right>
  no!  <M-Right>      <C-Right>

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  imap <M-Up>         <C-o>{

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  imap <M-Down>       <C-o>}

  imap <M-BS>         <C-w>
  inoremap <D-BS>     <esc>my0c`y
elseif $LINUX
elseif $WIN
  set langmenu=zh_CN
  language messages zh_CN.utf-8
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  autocmd GUIEnter * simalt ~x
  set guifont=Monaco:h10:cANSI
  set guifontwide=YaHei\ Mono:h10
  set shell=D:/cygwin/bin/bash
  set shellcmdflag=--login\ -c
  set shellxquote=\"
endif
