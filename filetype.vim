if exists("did_load_filetypes")
    finish
endif
let did_load_filetypes = 1

augroup filetypedetect

    " C
    au BufNewFile,BufRead *.c setf c
    au filetype c setlocal omnifunc=ccomplete#Complete

    " HTML
    au BufNewFile,BufRead *.html,*.mustache,*.ejs setf html
    let g:javascript_enable_domhtmlcss = 1
    let g:xml_use_xhtml = 1
    au filetype xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Markdown
    au BufNewFile,BufRead *.{md,mkd,mark,markdown} setf mkd | set ts=2 sw=2 expandtab
    au filetype html,mkd setlocal omnifunc=htmlcomplete#CompleteTags

    " Makefile
    au BufNewFile,BufRead {Makefile,makefile} setf make | set noexpandtab

    " PHP
    au BufNewFile,BufRead *.php setf php
    au filetype php call s:Dict()
    au filetype php setlocal omnifunc=phpcomplete#CompletePHP

    " SH
    au BufNewFile,BufRead *.sh,.zshrc setf sh | set ts=2 sw=2 sts=2
    au filetype sh call s:Dict()

    " JavaScript, ECMAScript
    au BufNewFile,BufRead *.{js,javascript,es,jsx,json} setf javascript
    au filetype javascript call s:Dict()
    au filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " CoffeeScript
    au BufNewFile,BufRead *.coffee,Cakefile setf coffee | set sw=2 foldmethod=indent expandtab

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

    " CSS
    au BufNewFile,BufRead *.css setf css | set ts=2 sw=2 sts=2
    au filetype css setlocal omnifunc=csscomplete#CompleteCSS

    " LESS
    au BufNewFile,BufRead *.less setf less | set ts=2 sw=2 sts=2
    au filetype less setlocal omnifunc=csscomplete#CompleteCSS

    " Ruby
    au BufNewFile,BufRead *.rb  setf ruby | set ts=2 sw=2 sts=2
    au filetype ruby setlocal omnifunc=rubycomplete#Complete

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
