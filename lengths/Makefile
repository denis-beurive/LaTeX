#      Generate the PDF file:              make
#      Clean all the temporary files:      make clean
#      Clean all files except the sources: make clear

LATEX_EXE     = /usr/bin/lualatex
PERL_EXE      = /usr/bin/perl
LATEX_OPTIONS = -halt-on-error -shell-escape -interaction=nonstopmode --output-format=pdf
PDF_VIEWER    = xdg-open 

all: length.pdf \
     output.dim

length.pdf: length.tex basic.cls
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS" && ${PDF_VIEWER} $@

output.tex: template.tex char.pl
	${PERL_EXE} char.pl

output.dim: output.tex
	${LATEX_EXE} ${LATEX_OPTIONS} $< && echo "SUCCESS"

clean:
	rm -f *.log *.out *.aux

clear: clean
	rm -f *.pdf

