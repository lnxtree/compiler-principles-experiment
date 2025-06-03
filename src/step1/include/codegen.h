#pragma once

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Host.h" // For LLVM 11, the header is located in llvm/Support folder, but for newer versions, that folder should be llvm/TargetParser.
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetRegistry.h" // For LLVM 11, the header is located in llvm/Support folder, but for newer versions, that folder should be llvm/MC.
#include "llvm/Support/TargetSelect.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"

namespace codegen {
using namespace llvm;
using namespace llvm::sys;

bool codeGenerate(const std::string &ir_filename,
                  const CodeGenFileType &gen_filetype);
std::string getGenFilename(const std::string &ir_filename,
                           const CodeGenFileType &gen_filetype);
} // namespace codegen