#!/usr/bin/env zsh

set -eu
setopt glob_star_short
setopt extended_glob

mkdir -p pdfs
mkdir -p pdfs/old

cd $(dirname $(realpath $0))

echo $PWD

for f in **.pdf~pdf**; do
    pdfpath=pdfs/$(basename $f)
    oldpdfpath=pdfs/old/$(basename $f)
    if [ -f $pdfpath ]; then
        \mv $pdfpath $oldpdfpath
    fi
    if [ -f $oldpdfpath ]; then
        if diff $f $oldpdfpath; then
            echo "skipping $f"
        else
            cp $f $pdfpath
        fi
    else
        cp $f $pdfpath
    fi
done
