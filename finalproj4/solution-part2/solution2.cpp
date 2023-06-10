#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
struct UseAfterFreePass : public FunctionPass {
  static char ID;
  UseAfterFreePass() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override {
    for (auto &BB : F) {
      for (auto &Inst : BB) {
        if (auto *Call = dyn_cast<CallInst>(&Inst)) {
          Function *Callee = Call->getCalledFunction();
          std::string CalleeName = Callee->getName().str();

          // Check for call to 'free' function
          if (CalleeName == "free") {
            Value *Arg = Call->getArgOperand(0);

            // Iterate over uses of the free'd pointer
            for (User *User : Arg->users()) {
              if (auto *Inst = dyn_cast<Instruction>(User)) {
                if (Inst->mayReadOrWriteMemory()) {
                  if (auto dbgLoc = Inst->getDebugLoc()) {
                    errs() << "use after free detected at line: " << dbgLoc.getLine() << "\n";
		    return true;
                  }
                }
              }
            }
          }
        }
      }
    }

    return false;
  }
};
} // namespace

char UseAfterFreePass::ID = 0;
static RegisterPass<UseAfterFreePass> X("use-after-free", "Use-After-Free Pass",
                                         false /* Only looks at CFG */,
                                         false /* Analysis Pass */);
