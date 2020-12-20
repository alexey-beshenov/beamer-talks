TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(TEX_FILES:.tex=.pdf)

all: $(PDF_FILES)

%.pdf: %.tex
	xelatex $<
	xelatex $<
	xelatex -jobname=$(<:.tex=-handout) '\let\handout=1 \input' $<
	xelatex -jobname=$(<:.tex=-handout) '\let\handout=1 \input' $<

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *~
