set columns=88
set lines=55
set guicursor+=a:blinkon0
set guioptions=ace
set guioptions-=mTlLrR
set mousehide

let g:solarized_visibility='low'

map <silent> <F11> :if &guioptions =~# 'T' <Bar>
  \ set guioptions-=T <Bar>
  \ set guioptions-=m <Bar>
  \ else <Bar>
  \ set guioptions+=T <Bar>
  \ set guioptions+=m <Bar>
  \ endif<cr>


if g:LINUX
elseif g:MAC
  "set guifont=Monaco:h14
  set guifont=Inconsolata-dz:h12
  " Map Cmd+<n> to move to tab <n>.
  for item in range(1,9)
    silent exec "map <D-".item."> :tabn ".item."<cr>"
    silent exec "map! <D-".item."> <C-O>:tabn ".item."<cr>"
  endfor

  macmenu &File.New\ Tab key=<nop>
  map <leader>t <Plug>PeepOpen
  set transparency=8
  set macmeta
  let macvim_hig_shift_movement = 1
  set antialias
elseif g:WIN
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
