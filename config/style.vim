" Highlight trailing whitespace
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Set up highlight group & retain through colorscheme changes
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
hi colorcolumn ctermbg=LightGreen ctermfg=Black guibg=LightGreen guifg=Black

au BufRead,InsertEnter,InsertLeave * match TODO /T\(odo\|ODO\)\:/
au BufRead,InsertEnter,InsertLeave * match FIXME /F\(ixme\|IXME\)\:/
hi FIXME ctermbg=red guibg=red

hi SpecialKey term=underline ctermfg=red guifg=darkgray
hi NonText ctermfg=red guifg=gray

hi User1 ctermfg=LightGreen ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User2 ctermfg=Blue ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User3 ctermfg=LightRed ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
