set t_Co=256
set termencoding=utf-8
set ttyfast
set ttimeoutlen=10

augroup FastEscape
  au!
  au InsertLeave * set timeoutlen=1000
augroup END

if exists('$TMUX')
  let &t_SI = 'Ptmux;]12;#89b6e2\'
  let &t_SI = 'Ptmux;]12;#dd4010\'
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set list
set fillchars=vert:│,fold:┄,diff:╱
set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
set showbreak=↪
