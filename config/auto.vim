if has('autocmd')

  au VimEnter * echo "Hello KissDry :)"

augroup vimrcEx
  au!

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
augroup END

endif
