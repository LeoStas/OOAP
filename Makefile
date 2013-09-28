
all : report.pdf

report.pdf : report.tex
	pdflatex -shell-escape -file-line-error -halt-on-error -output-directory work.dir $<
	mv -v work.dir/$@ .

clean :
	rm -rf work.dir/*
	rm report.pdf

