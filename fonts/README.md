
# Find the names of all the available fonts

The commands below print the names of all OTF and TTF fonts installed on your system:

	# Get the names of OTF fonts:
	
	find /usr/share/texmf/fonts/ -name "*.otf" | xargs -n1 fc-scan --format "%{fullname}\n" | sed 's/,.\+$//'
	
	# Get the names of TTF fonts:
	
	find /usr/share -name "*.ttf" | xargs -n1 fc-scan --format "%{fullname}\n" | sed 's/,.\+$//'
	
	# Get the names of OTF and TTF files:
	
	find /usr/share -name "*.ttf" -o -name "*.otf" | xargs -n1 fc-scan --format "%{fullname}\n" | sed 's/,.\+$//'

Output example:

	TeXGyreAdventor-Regular
	TeXGyreCursor-Italic
	TeXGyreHerosCondensed-Regular
	TeXGyreChorus-MediumItalic
	...

These commands print the names of the fonts. You can then use the fonts:

	\setmainfont{TeXGyreBonum-Italic}

# Look at a given font

If you want to see a given font, then you can use the follwing command:

	/usr/bin/gnome-font-viewer /usr/share/fonts/truetype/tlwg/Umpush-Bold.ttf

Resources:

https://en.wikibooks.org/wiki/LaTeX/Fonts#Using_TTF_and_OTF_fonts





