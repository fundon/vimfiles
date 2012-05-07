sil! run bundle/pathogen/autoload/pathogen.vim
sil! cal pathogen#infect()
sil! cal pathogen#helptags()
let g:pathogen_disabled = [
  \ 'jscomplete'
  \]
