main: full

quick: paper.tex
	xelatex paper.tex

full: paper.tex
	latexmk -pdf paper.tex

letter: resubmission-letter.tex
	latexmk -pdf resubmission-letter.tex

submit: full
	pdftk paper.pdf cat 1-25 output oopsla-main.pdf
	pdftk paper.pdf cat 26-end output oopsla-appendix.pdf

.PHONY: clean quick main full
clean:
	rm -f *.aux *.xcp *.blg *.log *.pdf *.bbl *.dvi *.out
