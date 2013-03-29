"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim: set et sw=2 ts=2 sts=2 ft=vim ff=unix fenc=utf-8 :	"
" Author:     cfddream						"
" Email:      cfddream[at]gmail.com				"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check OS: {{{
let $WIN    = has('win')
let $LINUX  = has('linux')
let $MACOSX = has('mac') || system('uname -s') =~ 'Darwin'
let $TERM   = &term =~ 'term'
let $MYVIM  = $WIN ? expand('F:/develop/vim') : expand('~/.vim')

" }}}

" Load Bootstrap: {{{
runtime bootstrap.vim
" }}}
