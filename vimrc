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
" Author: cfddream
" Email: cfddream[at]gmail.com
" Blog:
" Create: 2012-01-20
" Vim:set et sw=ts=sts=4 ft=vim ff=unix fenc=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check OS: {
" g:OS { 'unix': 1, 'mac': 2, 'others': 3 }
" tips: set let
" set runtimepath=~/xxx eq let &runtimepath="~/xxx"
let g:OS = has('linux') ? 1 : (has('mac') || system('uname -s') =~ 'Darwin') ? 2 : 3 
if g:OS == 1
    let g:MYVIM = expand('~/.vim')
    let g:LSB = substitute(system('lsb_release -si'), '[\s\n]\+', '', '')
elseif g:OS == 2
    let g:MYVIM = expand('~/.vim')
else
    let g:MYVIM = expand('F:/develop/vim')
endif
" }

" Load Bootstrap: {{{
"silent! runtime bootstrap.vim
runtime bootstrap.vim
" }}}
