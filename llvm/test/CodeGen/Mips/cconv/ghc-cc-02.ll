; RUN: llc -mtriple=mips64el-unknown-linux-gnuabi64 < %s | FileCheck %s

define ghccc i32 @addtwoi32(i32 %x, i32 %y) nounwind {
entry:
  %tmp = add i32 %x, %y
  ret i32 %tmp
}

define ghccc i64 @addtwoi64(i64 %x, i64 %y) nounwind {
entry:
  %tmp = add i64 %x, %y
  ret i64 %tmp
}

define ghccc double @addtwodouble(double %x, double %y) nounwind {
entry:
  %tmp = fadd double %x, %y
  ret double %tmp
}

define ghccc float @addtwofloat(float %x, float %y) nounwind {
entry:
  %tmp = fadd float %x, %y
  ret float %tmp
}

define i32 @main(i32 %argc, i8** %argv) {
    %1 = call ghccc i32 @addtwoi32(i32 1, i32 2)
    %2 = call ghccc i64 @addtwoi64(i64 1, i64 2)
    %3 = call ghccc double @addtwodouble(double 1.0, double 2.0)
    %4 = call ghccc float @addtwofloat(float 1.0, float 2.0)
    ret i32 %1
}
