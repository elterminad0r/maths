#!/usr/bin/env sh

set -eu

while IFS='' read -r link; do
    link="${link#https://tartarus.org/gareth/maths/notes/}"
    # epic hack
    part="$(dirname "$link")"
    name="$(basename "$link")"
    if [ -f "pdfs/$name" ]; then
        mkdir -p "pdfs/$part";
        mv "pdfs/$name" "pdfs/$part/$name"
    fi
done < links.txt
