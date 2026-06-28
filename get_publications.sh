#!/bin/bash
wget -q https://github.com/cpmpercussion/preprints/raw/refs/heads/main/publications.bib -O ./_bibliography/publications.bib
sed -i'' -e '/@/s/://g' ./_bibliography/publications.bib
sed -i'' -e '/Date-Added/d' ./_bibliography/publications.bib
sed -i'' -e '/Date-Modified/d' ./_bibliography/publications.bib
#sed -i'' -e '/Bdsk-Url-/d' ./_bibliography/publications.bib
