// This is a sample LLVM pass for llvm learning purpose
// This pass is used to iterate all Call Instructions in LLVM IR and check their arguments
// Understand this pass will significantly help you understand how to write another pass to achieve your own goal

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Operator.h"
#include <string>

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

/*
    In LLVM, the input IR is a Module (i.e., one input file), which consists of many Functions. And functions consist of many Basicblocks, while BasicBlocks consist of many Instructions. See references at
    https://llvm.org/docs/GettingStarted.html
    https://llvm.org/docs/WritingAnLLVMPass.html
    https://cmake.org/cmake/help/latest/guide/tutorial/index.html

    We suggest you to modify this sample program and compile it, print as much information as you can to understand how LLVM works.

    Consider LLVM IR a lower-level representation of C, but higher-level than assemble codes. You can see type / define / instruction information in LLVM IR.

    Compare the output of this code with intput LLVM IR.
*/

namespace {
    // FunctionPass is going to analyze every function in the module, you can also use ModulePass which start from runOnModule(Module &M)
struct Hello : public FunctionPass {
  static char ID;
  Hello() : FunctionPass(ID) {}
  bool runOnFunction(Function &F) override {  // Iterating over all functions defined in an input .ll file
    auto Module = F.getParent();    // Get the Module of this IR
    auto DL = new DataLayout(Module);    // Get the datalayout information of this module for future usage
    if(F.getName().find("checkthisfunc") != std::string::npos){   // Only check instructions in function which name includes "checkthisfunc", e.g. checkthisfunc(). Please change this as it applies to only part 2 and 3 do not have such a function.
        for(BasicBlock &bb : F){  // Iterate BasicBlocks in this function
            for(Instruction &inst : bb){   // Iterate Instructions in this Basicblock
                Instruction* dummy = &inst;   // Get the Instruction* class pointer from the iterator
                    // Dynamically cast a pointer from Instruction* to CallInst*, if this pointer isn't CallInst*, dyn_cast<>() will return nullptr and the if condition will be false
                    // You can also get opcode of instruction to see if it's a callinst by dummy->getOpcode();
                    if(CallInst* callinst = dyn_cast<CallInst>(dummy)){
                        errs() << "The callinst is: \n";
                        // You can print any LLVM Value* or Type* by '->print(errs())'
                        callinst->print(errs());
                        errs() << "\n";
                        Function* callee = callinst->getCalledFunction();   // Get the callee function
                        std::string calleename = callee->getName().str();   // Get the callee function name
                        // 'errs() << string1 << string2 << ...' is used to output the strings
                        errs() << "calleename: " << calleename << "\n";   // Print the Callee function name
                        // "memset" function name will appear as a substring in callee function name
                        if(auto dbgloc = callinst->getDebugLoc()){  // Get the debug information (e.g., line number). If there's no debug information, will return null
                            errs() << "linenum: " << dbgloc.getLine() << "\n"; // Print the C line number of this call instruction
                        }
                        for(unsigned int i = 0; i < callinst->getNumArgOperands(); i++){    // Iterate all arguments of this CallInst
                            Value* arg = callinst->getArgOperand(i);    // Get the i-th argument
                            if(auto btc = dyn_cast<BitCastOperator>(arg)){ 
                                // If it's a bitcast operator, it will cast a variable from one type to another type
                                // e.g., i8* nonnull align 16 dereferenceable(96) bitcast ([10 x i64]* @a to i8*)
                                // By default, if we try to print the size of array, it will be only one byte because it's an i8 pointer. 
                                // Thus, we are going to get the @a inside the bitcast operator, which is considered the first operand of the operator.
                                // Before: arg type = i8* nonnull align 16 dereferenceable(96) bitcast ([10 x i64]* @a to i8*)
                                arg = btc->getOperand(0);
                                // After: arg type = [10 x i64]* @a
                            }
                            if(arg->getType()->isPointerTy()){  // Check if this argument is pointer type. It's equaivalent to: if(isa<PointerType>(arg->getType())){}
                                Type* pointeetp = arg->getType()->getPointerElementType();  // Get pointee type, e.g., A struct stA* pointer points to a struct stA object (pointee), a pointer of type [10 x i64]* points to [10 x i64] (pointee).
                                errs() << "argnum: " << i << "\nptr type: ";
                                arg->getType()->print(errs());
                                errs() << "\npointee type: ";
                                pointeetp->print(errs());
                                errs() << "\npointeesize: " << DL->getTypeAllocSize(pointeetp).getFixedSize() << "\n";  // Print pointee type size
                            }if(arg->getType()->isIntegerTy()){ // If this argument is integer type
                                if(ConstantInt* intvalue = dyn_cast<ConstantInt>(arg)){ // If it's a constant number
                                    errs() << "argnum: " << i << " constant: " << intvalue->getSExtValue() << "\n"; // Print the number
                                }
                            }
                        }
                        
                    }
            }
        }
    }
    return false;
  }
}; // end of struct Hello
}  // end of anonymous namespace

char Hello::ID = 0;
static RegisterPass<Hello> X("sample", "Sample Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &Builder,
       legacy::PassManagerBase &PM) { PM.add(new Hello()); });