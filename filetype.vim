if exists("did_load_filetypes")
    finish
endif
let did_load_filetypes = 1

augroup filetypedetect

    " C
    au BufNewFile,BufRead *.c setf c
    au filetype c setlocal omnifunc=ccomplete#Complete

    " HTML
    au BufNewFile,BufRead *.html,*.mustache setf html
    let g:javascript_enable_domhtmlcss = 1
    let g:xml_use_xhtml = 1

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
    au BufNewFile,BufRead *.{js,javascript,es,jsx} setf javascript
    au filetype javascript call s:Dict()
    au filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " CoffeeScript
    au BufNewFile,BufRead *.coffee setf coffee | set sw=2 foldmethod=indent expandtab

    " Lisp
    au BufNewFile,BufRead *.lisp setf lisp

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
    au BufNewFile,BufRead *.css setf css
    au filetype css setlocal omnifunc=csscomplete#CompleteCSS

    " Ruby
    au BufNewFile,BufRead *.rb  setf ruby | set ts=2 sw=2 sts=2
    au filetype ruby setlocal omnifunc=rubycomplete#Complete

    " Enable omni completion.
    au filetype python setlocal omnifunc=pythoncomplete#Complete
    "au filetype sql setlocal omnifunc=sqlcomplete#Complete
    au filetype xml setlocal omnifunc=xmlcomplete#CompleteTags

augroup END

fun! s:Dict()
    let &dictionary .= substitute(g:MYVIM . '/dict/@.dict', '@', &filetype, '')
endfun
