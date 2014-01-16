#!/bin/bash
modules=".gitmodules"
n=1
l=`cat $modules | wc -l | tr -d ' '`
path=""
url=""

while test $n -lt $l; do
  path=`sed -n "$((n+1))"p $modules | cut -d '=' -f2`
  path=${path//[[:space:]]}
  url=`sed -n "$((n+2))"p $modules | cut -d '=' -f2`
  url=${url//[[:space:]]}
  test -n $path \
    && test -n $url \
    && git submodule add "$url" "$path"
  let 'n = n + 3'
done

git submodule init
