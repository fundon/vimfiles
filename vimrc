""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _________________________
"( cfddream's VIM Settings )
" -------------------------
"   o
"    o
"     o  .--.
"       |o_o |
"       |:_/ |
"      //   \ \
"     (|     | )          ,-O  Ubuntu Linux
"     /'\_   _/`\       O(_ )) http://www.ubuntu.com/
"     \___)=(___/         `-O  Linux for Human Beings
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Author:     cfddream
" Email:      cfddream[at]gmail.com
" Blog:       http://kissdry.com/
" Modified:   2012-04-25
" Vim: set et sw=2 ts=2 sts=2 ft=vim ff=unix fenc=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check OS: {{{
" tips: set let
" set runtimepath=~/xxx eq let &runtimepath="~/xxx"
let g:WIN   = has('win')
let g:MAC   = has('mac') || system('uname -s') =~ 'Darwin'
let g:UNIX  = has('unix')
let g:LINUX = has('linux')
let g:TERM  = &term =~ 'term'
let g:MYVIM = g:WIN ? expand('F:/develop/vim') : expand('~/.vim')

" }}}

" Load Bootstrap: {{{
sil run bootstrap.vim
" }}}
