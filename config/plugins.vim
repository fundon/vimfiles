" Plugins " {{{

" Syntastic
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=1
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=1

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
nnoremap <silent><F8> :NERDTreeToggle<cr>
" Nerd Tree (reveal current file)
nnoremap <leader>f :NERDTree<cr>:NERDTreeClose<cr>:NERDTreeFind<cr>

" NERDCommter
if has("gui_macvim")
    let macvim_skip_hig_shift_movement = 1
    map <D-/> ,c<space>
endif

" Ack
let g:ackprg = "ack-grep -H --nocolor --nogroup --column"

" CTags
nnoremap <leader>rt :!ctags --extra=+f -R *<cr><cr>

" Taglist
let Tlist_Ctags_Cmd = $HOME . "/develop/homebrew/bin/ctags"
let Tlist_Auto_Highlight_Tag=0
let Tlist_Auto_Open=0
let Tlist_Compact_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_WinWidth = 40
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_Horiz_Window = 0
let Tlist_Close_On_Select = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Display_Prototype = 0
let Tlist_Use_SingleClick = 1
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'

" Tarbar
let g:tagbar_ctags_bin = $HOME . "/develop/homebrew/bin/ctags"
nnoremap <silent><F6> :TagbarToggle<cr>

" RagTag
let g:ragtag_global_maps = 1

" }}}
