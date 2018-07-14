This code is published as an illustration for a question asked here:

https://tex.stackexchange.com/questions/440591/how-can-i-make-sure-that-an-arbitrary-part-of-a-document-is-printed-on-the-sam

* **Makefile**: the Makefile that contains the commands used to produce the PDF files.
* **class.cls**: the LaTeX class I created for this example.
* **list.tex**: this file contains an example that shows the workaround I found for lists. Please not that this workaround is not satisfactory.
* **table.tex**: this file contains an example that shows the problem with tables.

Generate all the PDF document:

	make all

Remove the temporary files:

	make clean

Remove the temporary files and the PDF files:

	make clear


