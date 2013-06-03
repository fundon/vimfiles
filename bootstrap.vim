" Runtime Configs: {{{

runtime config/basic.vim

set nocompatible
filetype off
runtime config/bundles.vim
filetype plugin indent on

runtime config/style.vim

if $TERM
  "runtime config/term.vim
endif

" }}}
