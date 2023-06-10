#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

namespace {
    struct Hello : public ModulePass {
        static char ID;
        Hello() : ModulePass(ID) {}

        bool runOnModule(Module &M) override {
            auto DL = new DataLayout(&M);

            for (auto &F : M) {
                for (auto &BB : F) {
                    for (auto &Inst : BB) {
                        if (auto *Call = dyn_cast<CallInst>(&Inst)) {
                            Function *Callee = Call->getCalledFunction();
                            std::string CalleeName = Callee->getName().str();

                            if (CalleeName.find("memset") != std::string::npos) {
                                if (auto dbgloc = Call->getDebugLoc()) {
                                    errs() << "memory overflow detected at line: " << dbgloc.getLine() << "\n";
				    return true;
                                }
                            }
                        }
                    }
                }
            }

            return false;
        }
    };
}

char Hello::ID = 0;
static RegisterPass<Hello> X("sample", "Sample Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

static void registerHelloPass(const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
}

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    registerHelloPass);
