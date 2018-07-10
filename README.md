# LaTeX

## System configuration

### Mandatory

First, you must install `texlive`:

	sudo apt-get install texlive

In order to use `lualatex`, you must install the packages listed below:

* `texlive-luatex`
* `texlive-xetex`
* `lmodern` (this package fixes a problem with luaotfload)
* `texlive-fonts-extra`

> See: https://tex.stackexchange.com/questions/161595/fontspec-throwing-error-with-lualatex-broken

commands:

	sudo apt-get install texlive-luatex
	sudo apt-get install texlive-xetex
	sudo apt-get install lmodern 
	sudo apt-get install texlive-fonts-extra

### Recommanded

The VIM editor has a very nice LaTex mode.

	sudo apt-get install vim

## Resources

https://www.latex-howto.be/book/download_fr




