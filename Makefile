RM := rm

SRC := ./tex/main.tex
TEX := main.pdf

# Use "make -B EMAIL=*other email address*" to change email
EMAIL := joel.oskarsson@liu.se

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
	pdflatex $(FLAGS) "\def\english{}\def\email{$(EMAIL)}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(ENG_PDF)

$(SWE_PDF): $(SRC)
	mkdir -p build
	pdflatex $(FLAGS) "\def\swedish{}\def\email{$(EMAIL)}\input{$(SRC)}"
	mv $(BUILD_DIR)/$(TEX) $(SWE_PDF)

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)
