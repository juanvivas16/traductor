CXX = g++

BISON= bison -d

FLEX= flex

all: clean bison flex parser

clean:
	rm -f lex.yy.c parser parser.tab.c parser.tab.h scanner *.out

bison:
	$(BISON) parser.y

flex:
	$(FLEX) scanner.l

parser:
	$(CXX) lex.yy.c parser.tab.c -o $@

source1:
	$(CXX) source1.c -o s1.out

source2:
	$(CXX) source2.c -o s2.out

source3:
	$(CXX) source3.c -o s3.out

