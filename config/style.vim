" Highlight trailing whitespace
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight problematic whitespace (spaces before tabs) {{{
hi ProblematicSpaces ctermfg=214 ctermbg=160 cterm=bold
match ProblematicSpaces / \+\ze\t/

" Set up highlight group & retain through colorscheme changes
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
hi colorcolumn ctermbg=LightGreen ctermfg=Black guibg=LightGreen guifg=Black

highlight YELLER ctermbg=yellow
highlight GREAN ctermbg=green
highlight SEND_HELP ctermbg=red

let todo = matchadd("GREAN", "TODO")
let fixme = matchadd("YELLER", "FIXME")
let hack = matchadd("SEND_HELP", "HACK")
let bug = matchadd("SEND_HELP", "BUG")

hi User1 ctermfg=LightGreen ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User2 ctermfg=Blue ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
hi User3 ctermfg=LightRed ctermbg=Black guifg=#112605  guibg=#aefe7B gui=italic
