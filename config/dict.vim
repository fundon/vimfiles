" generate sh dict
fun! GenerateSHDict()
    :!grep keyword /usr/share/vim/vim73/syntax/sh.vim | grep -v nextgroup | awk '{ $1=""; $2=""; $3=""; print}' | perl -pe 's/\s+/\n/g' | grep -v contained | grep -v '^$' | sort | uniq > ~/.vim/dict/sh.dict
endfun
command! -nargs=0 GenerateSHDict :call GenerateSHDict()
