# LaTeX

## System configuration

### Mandatory

First, you must install `texlive`:

```bash
sudo apt-get install texlive
```

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

```bash
sudo apt-get install texlive-luatex
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-xetex
sudo apt-get install lmodern 
sudo apt-get install texlive-fonts-extra
sudo apt-get install fonts-font-awesome
sudo apt-get install font-manager
```

### Recommanded

The VIM editor has a very nice LaTex mode.

```bash
sudo apt-get install vim
```

## Resources

* https://www.latex-howto.be/book/download_fr
* https://coreight.com/content/guide-polices-typographie (what is a font ?)

## Notes

### Basic installation

TexLive has a very interesting feature: you can choose what you want to install.
If you want, you can just install the basic resources. See [this post](https://tex.stackexchange.com/questions/397174/minimal-texlive-installation).

Go to the [TexLive site](https://www.tug.org/texlive/acquire-netinstall.html), and download the network installer.

Run the installer:

```bash
./install-tl -gui text
```

Then, during the installation process, then you can choose:

* the type of installation you want (you can choose the basic installation, for example).
* the directories where you want to install the distribution components (`TEXBASE`, `TEXDIR`, `TEXMFLOCAL`, `TEXMFSYSVAR`, `TEXMFSYSCONFIG`).

### Converting equations into images

Useful resources to quickly generate formulas using TexLive base installation:

* [equations.tex](equations/equations.tex)
* [equations.sh](equations/equations.sh)

### Generate nice Python listing

Useful resources to quickly generate Python code using TexLive base installation:

* [listing.pl](python/listing.pl)
* [python.tex](python/python.tex)

> You need to install the great [pythonhighlight package](https://github.com/olivierverdier/python-latex-highlighting).

### Installing packages

#### Automated installation

> To install a LaTeX package: `tlmgr install <package name>` (see [this link](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages))

#### Manual installation

The procedure is very well described [here](https://tex.stackexchange.com/questions/73016/how-do-i-install-an-individual-package-on-a-linux-system).

The simplest way to install a package is to install it for user-only usage. In a nutshell, let's install the great Python package [pythonhighlight](https://github.com/olivierverdier/python-latex-highlighting):

```bash
$ PACKAGE_NAME="pythonhighlight"
$ kpsewhich -var-value TEXMFHOME
/home/denis/texmf
$ PACKAGE_PATH="/home/denis/texmf/tex/latex/${PACKAGE_NAME}"
$ mkdir -p "${PACKAGE_PATH}"
$ cp pythonhighlight.sty "${PACKAGE_PATH}"
```



