RM := rm

SRC := ./tex/main.tex
SRC_AC  := ./tex/academic.tex
SRC_AC_SECTIONS := ./tex/sections/*
PUB_LIST  := ./tex/publications.bib
TEX := main.pdf

# Use "make -B EMAIL=*other email address*" to change email
EMAIL := joel.oskarsson@liu.se

FINAL_DIR := ./docs
BUILD_DIR := ./build

ENG_FILE := CV_english.pdf
SWE_FILE:= CV_swedish.pdf
AC_FILE:= CV.pdf

ENG_PDF := $(FINAL_DIR)/$(ENG_FILE)
SWE_PDF := $(FINAL_DIR)/$(SWE_FILE)
AC_PDF := $(FINAL_DIR)/$(AC_FILE)

FLAGS := -output-directory $(BUILD_DIR)

all: english swedish

english: $(ENG_PDF)
swedish: $(SWE_PDF)
academic: $(AC_PDF)

$(ENG_PDF): $(SRC)
	mkdir -p build
	pdflatex $(FLAGS) "\def\english{}\def\email{$(EMAIL)}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(ENG_PDF)

$(SWE_PDF): $(SRC)
	mkdir -p build
	pdflatex $(FLAGS) "\def\swedish{}\def\email{$(EMAIL)}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(SWE_PDF)

$(AC_PDF): $(SRC_AC) $(SRC_AC_SECTIONS) $(PUB_LIST)
	mkdir -p build
	latexmk -pdf -jobname=$(BUILD_DIR)/main $(SRC_AC)
	mv $(BUILD_DIR)/$(TEX) $(AC_PDF)

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)
