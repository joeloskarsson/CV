RM := rm

SRC := ./tex/main.tex
TEX := main.pdf

FINAL_DIR := ./docs
BUILD_DIR := ./build

ENG_FILE := CV_english.pdf
SWE_FILE:= CV_swedish.pdf

ENG_PDF := $(FINAL_DIR)/$(ENG_FILE)
SWE_PDF := $(FINAL_DIR)/$(SWE_FILE)

FLAGS := -output-directory $(BUILD_DIR)

all: english swedish

english: $(ENG_PDF)

swedish: $(SWE_PDF)

$(ENG_PDF): $(SRC)
	mkdir -p build
	pdflatex $(FLAGS) "\def\english{}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(ENG_PDF)

$(SWE_PDF): $(SRC)
	mkdir -p build
	pdflatex $(FLAGS) "\def\swedish{}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(SWE_PDF)

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)
