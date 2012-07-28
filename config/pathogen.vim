sil! run bundle/pathogen/autoload/pathogen.vim
sil! cal pathogen#helptags()
sil! cal pathogen#infect()
let g:pathogen_disabled = [
  \ 'jscomplete'
  \]
