/*  LLVM binding
  Copyright (C) 2014 Tristan Gingold

  GHDL is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2, or (at your option) any later
  version.

  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
  for more details.

  You should have received a copy of the GNU General Public License
  along with GHDL; see the file COPYING.  If not, write to the Free
  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
  02111-1307, USA.  */
#include "llvm-c/Target.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Config/llvm-config.h"
#include "llvm-c/TargetMachine.h"
#include "llvm-c/Core.h"

using namespace llvm;

extern "C" {

void
LLVMInitializeNativeTarget_noinline (void)
{
  LLVMInitializeNativeTarget ();
}

void
LLVMInitializeNativeAsmPrinter_noinline (void)
{
  LLVMInitializeNativeAsmPrinter();
}

char *
LLVMGetDefaultNormalizedTargetTriple(void)
{
  char *triple;
  triple = LLVMGetDefaultTargetTriple();

#if LLVM_VERSION_MAJOR >= 7
  {
    char *res;
    res = LLVMNormalizeTargetTriple(triple);
    LLVMDisposeMessage(triple);
    return res;
  }
#else
  return triple;
#endif
}

}
