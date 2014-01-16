" Runtime Configs: {{{
filetype off

let $NEOBUNDLE_DIR = $MYVIM . '/.bundle'

if has('vim_starting') 
  set nocompatible               " Be iMproved
  set runtimepath+=$NEOBUNDLE_DIR/neobundle
endif

call neobundle#rc(expand($NEOBUNDLE_DIR))

" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'

runtime config/bundle.vim

filetype plugin indent on     " Required!

" Enable syntax color.
syntax enable

" Installation check.
NeoBundleCheck

""switch opening and closing html/xml tags or if/elseif/else/end
"runtime macros/matchit.vim

runtime config/functions.vim
runtime config/basic.vim
"
"if $TERM
"  "runtime config/term.vim
"endif
"
""runtime scripts.vim
""runtime config/auto.vim
""runtime config/mappings.vim
""runtime config/style.vim
""run config/command.vim
""run config/dict.vim

" }}}
