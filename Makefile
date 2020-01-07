SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: clean en zh
en: resume.tex
	latexmk -xelatex -pdf resume.tex
zh: resume-cn.tex
	latexmk -xelatex -pdf resume-cn.tex
elab: resume-elab.tex
	latexmk -xelatex -pdf resume-elab.tex
ap: resume-ap.tex
	latexmk -xelatex -pdf resume-ap.tex

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.cut
