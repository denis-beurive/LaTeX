
Under Ubuntu, you can find all OTF fonts with the command below. 

	find /usr/share/texmf/fonts/ -name "*.otf" | xargs -n1 fc-scan --format "%{fullname}\n" | sed 's/,.\+$//'

This command prints the names of the fonts. You can then use the fonts:

	\setmainfont{TeXGyreBonum-Italic}






