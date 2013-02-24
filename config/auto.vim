if has('autocmd')

  au FocusLost * :silent! wall

  au VimResized * :wincmd =

  augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
  augroup END

  augroup twospace
    au!
    au BufRead * :set cpoptions+=J
  augroup END

  augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
  augroup END

  augroup line_return
    au!
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute 'normal! g`"zvzz' |
      \ endif
  augroup END

  augroup tableave
    au!
    au TabLeave * let g:LastUsedTabPage=tabpagenr()
  augroup END

endif
