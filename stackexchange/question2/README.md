This code is published as an illustration for a question asked here:

https://tex.stackexchange.com/questions/442842/vertical-space-on-top-of-the-content-defined-within-an-environment

* **Makefile**: the Makefile that contains the commands used to produce the PDF files.
* **class.cls**: the LaTeX class I created for this example.
* **example.tex**: this file contains an example that shows the problem.


Generate all the PDF document:

	make 

Remove the temporary files:

	make clean

Remove the temporary files and the PDF files:

	make clear


