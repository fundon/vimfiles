set lazyredraw
set guicursor+=a:blinkon0
set mousemodel=popup

map <silent> <F11> :if &guioptions =~# 'T' <Bar>
    \ set guioptions-=T <Bar>
    \ set guioptions-=m <Bar>
    \ else <Bar>
    \ set guioptions+=T <Bar>
    \ set guioptions+=m <Bar>
    \ endif<cr>

if g:OS == 1
    set guioptions=cMg
elseif g:OS == 2
    set guioptions=cMg
    "set guifont=Monaco:h14
    set guifont=Inconsolata:h15
    " Map Cmd+<n> to move to tab <n>.
    for item in range(1,9)
        silent exec "map <D-".item."> :tabn ".item."<cr>"
        silent exec "map! <D-".item."> <C-O>:tabn ".item."<cr>"
    endfor
    set transparency=8
    let macvim_hig_shift_movement=1
    set antialias
elseif g:OS == 3
    set guioptions=cMg
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
