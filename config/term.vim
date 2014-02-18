set t_Co=256
set termencoding=utf-8

augroup FastEscape
  au!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ "xterm.*"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  au VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"
endif

set list
set fillchars=vert:│,fold:┄,diff:╱
set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
set showbreak=↪
