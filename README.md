# LaTeX

## System configuration

### Mandatory

First, you must install `texlive`:

	sudo apt-get install texlive

In order to use `lualatex`, you must install the packages listed below:

* `texlive-luatex`
* `texlive-latex-base`
* `texlive-xetex`
* `lmodern` (this package fixes a problem with luaotfload)
* `texlive-fonts-extra`
* `font-manager` (recommended)
* `fonts-font-awesome`

> See: https://tex.stackexchange.com/questions/161595/fontspec-throwing-error-with-lualatex-broken

commands:

	sudo apt-get install texlive-luatex
	sudo apt-get install texlive-latex-base
	sudo apt-get install texlive-xetex
	sudo apt-get install lmodern 
	sudo apt-get install texlive-fonts-extra
	sudo apt-get install fonts-font-awesome
	sudo apt-get install font-manager

### Recommanded

The VIM editor has a very nice LaTex mode.

	sudo apt-get install vim

## Resources

https://www.latex-howto.be/book/download_fr

https://coreight.com/content/guide-polices-typographie (what is a font ?)


