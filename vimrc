"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set et sw=2 ts=2 sts=2 ft=vim ff=unix fenc=utf-8 :       "
" Author:     fundon                                            "
" Email:      cfddream[at]gmail.com                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Check OS: "{{{
let g:win     = has('win')
let g:linux   = has('linux')
let g:mac     = has('mac') || system('uname -s') =~ 'Darwin'
let g:term    = &term =~ 'term'
let $MYVIM    = g:win ? expand('F:/develop/vim') : expand('~/.vim')

" }}}

" Load Bootstrap: "{{{
runtime bootstrap.vim
" }}}
