if exists("did_load_filetypes")
    finish
endif
let did_load_filetypes = 1

augroup filetypedetect

    " C
    au BufNewFile,BufRead *.c setf c
    au FileType c setlocal omnifunc=ccomplete#Complete

    " HTML
    au BufNewFile,BufRead *.html,*.mustache,*.ejs setf html
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    let g:javascript_enable_domhtmlcss = 1
    let g:xml_use_xhtml = 1

    " Markdown
    au BufNewFile,BufRead *.{md,mkd,mark,markdown} setf mkd
    au FileType mkd set ts=2 sw=2 et
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
    au FileType sh set ts=2 sw=2 sts=2
    au FileType sh call s:Dict()

    " JavaScript, ECMAScript
    au BufNewFile,BufRead *.{js,javascript,es,jsx,json} setf javascript
    au FileType javascript call s:Dict()
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " CoffeeScript
    au BufNewFile,BufRead *.coffee,Cakefile setf coffee
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
    au filetype vim setl keywordprg=:help

    " CSS & LESS
    au BufNewFile,BufRead *.css setf css
    au BufNewFile,BufRead *.less setf less
    au FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
    au FileType css,less set ts=2 sw=2 sts=2

    " Ruby
    au BufNewFile,BufRead *.rb setf ruby
    au FileType rb set ts=2 sw=2 sts=2
    au FileType ruby setlocal omnifunc=rubycomplete#Complete

    " Python
    au BufNewFile,BufRead *.py setf python
    au filetype python setlocal omnifunc=pythoncomplete#Complete

    " Enable omni completion.
    "au filetype sql setlocal omnifunc=sqlcomplete#Complete

augroup END

fun! s:Dict()
    if empty(matchstr(&dictionary, &filetype))
        let &dictionary .= substitute(g:MYVIM . '/dict/@.dict', '@', &filetype, '')
    endif
endfun
