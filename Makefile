BUILD_DIR = work.dir
PDFBUILDER = pdflatex
PDFBUILDER_OPTIONS = -shell-escape -file-line-error \
					 -halt-on-error -output-directory $(BUILD_DIR)
PDFVIEWER = xdg-open

# suppress Makefile rebuilding.
Makefile: ;

# Default target (make without specified target).
.DEFAULT_GOAL := all

all: view

report.pdf: report.tex
	mkdir -p $(BUILD_DIR)
	$(PDFBUILDER) $(PDFBUILDER_OPTIONS) $^
	$(PDFBUILDER) $(PDFBUILDER_OPTIONS) $^
	mv -v $(BUILD_DIR)/$@ .

# fictive (not file-related target).
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(wildcard *converted-to.pdf)
	rm -f report.pdf

.PHONY: view
view: report.pdf
	$(PDFVIEWER) $^
