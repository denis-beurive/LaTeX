# This document illustrates the use of the "make" tool to produce PDF files from LaTeX sources.
# 
#      Generate the PDF file:                              make 
#      Clean all the temporary files:                      make clean
#      Remove all temporary files, including the PDF file: make clear


LATEX_EXE     = /usr/bin/lualatex
LATEX_OPTIONS = -halt-on-error -shell-escape -interaction=nonstopmode --output-format=pdf
PDF_VIEWER    = xdg-open 

all: example.pdf response1.pdf

example.pdf: example.tex class.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

response1.pdf: response1.tex class.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

clean:
	rm -f *.log *.out *.aux

clear: clean
	rm -f *.pdf

