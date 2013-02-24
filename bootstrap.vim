" Runtime Configs: {{{
filetype off

"switch opening and closing html/xml tags or if/elseif/else/end
runtime macros/matchit.vim

runtime config/pathogen.vim

filetype plugin indent on
set nocompatible

runtime config/basic.vim

if $TERM
  runtime config/term.vim
endif

runtime scripts.vim
runtime config/functions.vim
runtime config/auto.vim
runtime config/mappings.vim
runtime config/style.vim
runtime config/plugins.vim
"run config/command.vim
"run config/dict.vim

" }}}
