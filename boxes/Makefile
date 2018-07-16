# This document illustrates the use of the "make" tool to produce PDF files from LaTeX sources.
# 
#      Generate the PDF file:               make 
#      Remove all temporary file:           make clean
#      Remove all files except the sources: make clear
#
# You may need to customise this document. 

LATEX_EXE     = /usr/bin/lualatex
LATEX_OPTIONS = -halt-on-error -shell-escape -interaction=nonstopmode --output-format=pdf
PDF_VIEWER    = xdg-open 

all: makebox-framebox.pdf \
     parbox.pdf \
     specials.pdf \
     dimensions.pdf

makebox-framebox.pdf: makebox-framebox.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

parbox.pdf: parbox.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

specials.pdf: specials.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

dimensions.pdf: dimensions.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" 

clean:
	rm -f *.log *.out *.aux

clear: clean
	rm -f *.pdf *.dim
