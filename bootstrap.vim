" Runtime Configs: {{{
set nocompatible

filetype off

run config/pathogen.vim

filetype plugin indent on

if g:TERM
  run config/term.vim
endif

run scripts.vim

"switch opening and closing html/xml tags or if/elseif/else/end
run macros/matchit.vim

run config/personal.vim
run config/style.vim
run config/functions.vim
run config/basic.vim
run config/mappings.vim
run config/plugins.vim
run config/auto.vim
run config/command.vim
run config/dict.vim

" }}}
