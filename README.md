# Vagrant File with Latex and on the fly packages!



### Example commands

1. Put your main.tex on the root dir of the project!
2. Then compile!

`sudo env PATH="$PATH" texliveonfly --compiler=pdflatex main.tex`

Notes:
 You must use 
`echo "export TEXLIVE_HOME='/vagrant/build'" >> ~/.profile
