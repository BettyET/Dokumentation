@echo off
bibtex main
makeindex -s main.ist main.idx
pdflatex main.tex --shell-escape
