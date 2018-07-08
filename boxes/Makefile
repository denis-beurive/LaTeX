# This document illustrates the use of the "make" tool to produce PDF files from LaTeX sources.
# 
#      Generate the PDF file:         make all
#      Clean all the temporary files: make clean
#
# You may need to customise this document. 

LATEX_EXE     = /usr/bin/pdflatex
LATEX_OPTIONS = -halt-on-error -shell-escape -interaction=nonstopmode
PDF_VIEWER    = xdg-open 

makebox-framebox.pdf: makebox-framebox.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

all: makebox-framebox.pdf

clean:
	rm -f *.log *.out *.aux

