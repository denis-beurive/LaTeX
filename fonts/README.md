
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

# Clear caches for luaotfload

If you have troubles with `luaotfload`, you can delete the `lualatex` cache and rebuild it.

First, find the path to the cache:

	luaotfload-tool --diagnose=environment,permissions | grep 'Checking permissions of'

> By default, the cache should be under your home directory. If you can't fond it, then try that: `sudo / find -name ".texmf-var" -print` 

Delete the cache:

	rm -rf ~/.texmf-var/luatex-cache/*

And then, rebuild the cache:

	luaotfload-tool --update

Resources:

https://en.wikibooks.org/wiki/LaTeX/Fonts#Using_TTF_and_OTF_fonts





