#!/usr/bin/env bash
set +x

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
readonly __DIR__="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
readonly ROOT="${__DIR__}"

readonly PDFLATEX="/home/denis/.texlive/bin/x86_64-linux/pdflatex"
readonly PDF_OUT="${ROOT}/latex-out"

if [ ! -d "${PDF_OUT}" ]; then
  mkdir "${PDF_OUT}" || exit 1
fi

"${PDFLATEX}" -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="${PDF_OUT}" equations.tex
if [ $? -eq 0 ]; then
  echo "LaTex: SUCCESS"
else
  echo "LaTex: FAILURE"
  exit 1
fi

# Convert the PDF into PNG.
# Warning: this operation may produce more that one PNG image.
#          It produces as many images as there are pages in the PDF document.
# Note: if you want to convert the background color from transparent to white, then add these options:
#       -background white -alpha remove
convert -background white -alpha remove -trim -density 300 "${PDF_OUT}/equations.pdf" -quality 90 "${__DIR__}/equations-tmp.png"
if [ $? -eq 0 ]; then
  echo "convert PDF -> PNG: SUCCESS"
else
  echo "convert PDF -> PNG: FAILURE"
  exit 1
fi

# Add border.
# If you want to add white background borders, then replace:
#     -bordercolor transparent
# by:
#     -bordercolor white

for image in $(find . -maxdepth 1 | perl -e '@v=(); while(<>) { chomp;  push @v, $_ if ($_ =~ m/\/equations-tmp(-\d+)?\.png$/)} print join " ", @v'); do
    target=$(printf "%s" "${image}" | perl -pe 's/-tmp((-\d+)\.png)$/$1/')
    convert -border 20 -bordercolor white "${image}" "${target}"
    if [ $? -eq 0 ]; then
      echo "convert (${image}): SUCCESS"
      rm ${image}
    else
      echo "convert (${image}): FAILURE"
      exit 1
    fi
done


