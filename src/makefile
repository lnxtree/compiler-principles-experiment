compiler: flex_bison/parser.y flex_bison/tokens.l
	bison -d -o flex_bison/parser.cpp flex_bison/parser.y
	flex -o flex_bison/tokens.cpp flex_bison/tokens.l
	g++ ast/ast.cpp printer/printer.cpp flex_bison/parser.cpp flex_bison/tokens.cpp IR/genIR.cpp IR/ir.cpp main.cpp -o compiler

clean:
	rm flex_bison/parser.cpp flex_bison/parser.hpp flex_bison/tokens.cpp compiler