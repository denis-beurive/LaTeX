#!/usr/bin/env bash
set -x

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
readonly __DIR__="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
readonly ROOT="${__DIR__}/../../.."

readonly PDFLATEX="/home/denis/.texlive/bin/x86_64-linux/pdflatex"
readonly PDF_OUT="${ROOT}/out"

if [ ! -d "${PDF_OUT}" ]; then
  mkdir "${PDF_OUT}" || exit 1
fi

"${PDFLATEX}" -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="${PDF_OUT}" equations.tex
if [ $? -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  exit 1
fi

TMP_IMAGE="${__DIR__}/equations-tmp.png"

# Crop.
# If you want to convert the background color from transparent to white, then add these options:
# -background white -alpha remove
convert  -trim -density 300 "${PDF_OUT}/equations.pdf" -quality 90 "${TMP_IMAGE}"
if [ $? -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  exit 1
fi

# Add border.
# If you want to add white background borders, then replace:
#     -bordercolor transparent
# by:
#     -bordercolor white
convert -border 20 -bordercolor transparent "${TMP_IMAGE}" "${__DIR__}/equations.png"
if [ $? -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
  exit 1
fi

rm "${TMP_IMAGE}"
