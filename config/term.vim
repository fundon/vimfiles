set t_Co=256
set termencoding=utf-8

augroup FastEscape
  au!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

if exists('$TMUX')
  let &t_ti = "\<Esc>Ptmux;\<Esc>" . &t_ti . "\e[?1004h" . "\<Esc>\\"
  let &t_te = "\<Esc>Ptmux;\<Esc>" . "\e[?1004l" . &t_te . "\<Esc>\\"
  noremap <ESC>[O :echom "TEST"<cr>
else
  if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?1004h"
    let &t_te = "\e[?1004l" . &t_te
    noremap <ESC>[O :echom "TEST"<cr>
  endif
endif

set list
set fillchars=vert:│,fold:┄,diff:╱
set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
set showbreak=↪
