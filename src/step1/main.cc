#include "codegen.h"
#include "llvm/Support/raw_ostream.h"

int main(int argc, char *argv[]) {
  if (argc == 2) {
    return (codegen::codeGenerate(argv[1], llvm::CGFT_AssemblyFile)) ? 0 : 1;
  } else {
    llvm::errs() << ((argc < 2) ? "Expect an argument.\n"
                                : "Too many arguments.");
    return 1;
  }
}