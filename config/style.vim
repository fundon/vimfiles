" Highlight trailing whitespace
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Set up highlight group & retain through colorscheme changes
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
hi colorcolumn ctermbg=LightGreen ctermfg=Black guibg=LightGreen guifg=Black

syntax match myTodo /\ctodo:/ containedin=ALL
syntax match myDone /\cdone:/ containedin=ALL
syntax match myFixed /\cfixed:/ containedin=ALL
hi link myTodo TOdo
hi link myFixed Error
hi link myFixed Error

hi User1 ctermfg=LightGreen ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User2 ctermfg=Blue ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User3 ctermfg=LightRed ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
