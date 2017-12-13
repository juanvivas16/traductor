CXX = clang++ -std=c++11 -Wno-unused-value -Wno-deprecated 

BISON = bison -d

FLEX = flex

LATEX = pdflatex -synctex=1 -interaction=nonstopmode

all: clean bison flex parser source1 source2 source3 flexdebug scanner

clean:
	rm -f lex.yy.c parser parser.tab.c parser.tab.h scanner *.out salida.sh

bison:
	$(BISON) parser.y

flex:
	$(FLEX) scanner.l

flexdebug:
	$(FLEX) scannerdebug.l

scanner:
	$(CXX) lex.yy.c -o $@

parser:
	$(CXX) lex.yy.c parser.tab.c -o $@

source1:
	$(CXX) source1.c -o s1.out

source2:
	$(CXX) source2.c -o s2.out

source3:
	$(CXX) source3.c -o s3.out
