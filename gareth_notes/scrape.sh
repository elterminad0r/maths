#!/usr/bin/env sh

set -eu

[ -f notes.html ] ||
wget "https://tartarus.org/gareth/maths/notes/" -O notes.html

python get_links.py > links.txt

mkdir -p pdfs

wget -P pdfs -i links.txt
