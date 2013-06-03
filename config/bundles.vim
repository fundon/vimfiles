" let Vundle manage Vundle
set rtp+=$MYVIM/bundle/vundle/
call vundle#rc()

" Bundles {{{

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"" surround.vim: quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'

" Colorschema
Bundle 'molokai'
Bundle 'altercation/vim-colors-solarized'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'mileszs/ack.vim'
map <leader>a :Ack!<Space>
let g:ackprg = 'ag --nogroup --nocolor --column'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.bundle$'

Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/ctags.vim'

Bundle 'mattn/zencoding-vim'

" }}}
