if exists("did_load_filetypes")
  finish
endif
let did_load_filetypes = 1

" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

" Currently finds compressed files.
if !exists("g:ft_ignore_pat")
  let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\|xz\)$'
endif

augroup filetypedetect

  au BufReadPost * syntax sync fromstart

  au TabLeave * let g:LastUsedTabPage=tabpagenr()

  " C
  au BufNewFile,BufRead *.c,*.h setf c
  au FileType c set ts=2 sw=2 sts=2 et
  au FileType c setlocal omnifunc=ccomplete#Complete

  " HTML
  au BufNewFile,BufRead *.html,*.mustache,*.ejs setf html
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType html set ts=2 sw=2 sts=2 et
  let g:javascript_enable_domhtmlcss = 1
  let g:xml_use_xhtml = 1

  " Markdown
  au BufNewFile,BufRead *.{md,mkd,mark,markdown} setf mkd
  au FileType mkd set ts=2 sw=2 sts=2 et
  au FileType html,mkd setlocal omnifunc=htmlcomplete#CompleteTags

  " Makefile
  au BufNewFile,BufRead {Makefile,makefile} setf make
  au FileType make set noet

  " PHP
  au BufNewFile,BufRead *.php setf php
  au filetype php call s:Dict()
  au filetype php setlocal omnifunc=phpcomplete#CompletePHP

  " SH
  au BufNewFile,BufRead *.sh,.zshrc setf sh
  au FileType sh set ts=2 sw=2 sts=2 et
  au FileType sh call s:Dict()

  au BufNewFile,BufRead *.sql setf sql

  " JavaScript, ECMAScript
  au BufNewFile,BufRead *.{js,javascript,es,jsx,json} setf javascript
  au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
  au FileType javascript call s:Dict()
  au FileType javascript set ts=2 sw=2 sts=2

  " CoffeeScript
  au BufNewFile,BufRead *.coffee,Cakefile setf coffee
  au FileType coffee call s:Dict()
  au FileType coffee set sw=2 fdm=indent et

  " Lisp
  au BufNewFile,BufRead *.lisp setf lisp

  au BufNewFile,BufRead *.lua setf lua

  " Taskwarrior configuration file
  au BufNewFile,BufRead .taskrc setf taskrc

  " Taskwarrior data files
  au BufNewFile,BufRead {pending,completed,undo}.data setf taskdata

  " Taskwarrior handling of 'task 42 edit'
  au BufNewFile,BufRead *.task setf taskedit

  " Nginx
  au BufNewFile,BufRead *.nginx setl ft=nginx

  " Vim
  au BufNewFile,BufRead *.vim,{*}vimrc,{*}gvimrc setf vim
  au BufWritePost .vimrc source <afile>
  au BufWritePost .gvimrc source <afile>
  " shift+k, open vim help
  au FileType vim setl keywordprg=:help
  au FileType vim set ts=2 sw=2 sts=2 et

  " CSS & LESS
  au BufNewFile,BufRead *.css setf css
  au BufNewFile,BufRead *.less setf less
  au FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
  au FileType css,less set ts=2 sw=2 sts=2 et

  " Ruby
  au BufNewFile,BufRead *.rb setf ruby
  au FileType ruby set ts=2 sw=2 sts=2 et
  au FileType ruby setlocal omnifunc=rubycomplete#Complete

  " Python
  au BufNewFile,BufRead *.py setf python
  au FileType python setlocal omnifunc=pythoncomplete#Complete

  " Enable omni completion.
  "au filetype sql setlocal omnifunc=sqlcomplete#Complete

  au BufNewFile,BufRead *.txt,*.text setf text

  " 当没有扩展名时，检测第一行
  au BufNewFile,BufRead *
    \ if !did_filetype() && expand("<amatch>") !~ g:ft_ignore_pat
    \ | ru! scripts.vim | endif

  au StdinReadPost * if !did_filetype() | ru! scripts.vim | endif

  run! ftdetect/*.vim

augroup END

au filetypedetect BufNewFile,BufRead,StdinReadPost *
  \ if !did_filetype() && expand("<amatch>") !~ g:ft_ignore_pat
  \    && (getline(1) =~ '^#' || getline(2) =~ '^#' || getline(3) =~ '^#'
  \ || getline(4) =~ '^#' || getline(5) =~ '^#') |
  \   setf conf |
  \ endif

fun! s:Dict()
  if empty(matchstr(&dictionary, &filetype))
    let &dictionary = substitute(g:MYVIM . '/dict/@.dict,' . &dictionary, '@', &filetype, '')
  endif
endfun

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
