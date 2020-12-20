; RUN: llc -mtriple=mips64el-unknown-linux-gnuabi64 < %s | FileCheck %s

; Assure that the GHC calling convention works (mips64el)

@base  = external global i64 ; assigned to register: s0
@sp    = external global i64 ; assigned to register: s1
@hp    = external global i64 ; assigned to register: s2
@r1    = external global i64 ; assigned to register: s3
@r2    = external global i64 ; assigned to register: s4
@r3    = external global i64 ; assigned to register: s5
@r4    = external global i64 ; assigned to register: s6
@splim = external global i64 ; assigned to register: s7

@f1 = external global float  ; assigned to register: f20
@f2 = external global float  ; assigned to register: f22
@f3 = external global float  ; assigned to register: f24
@f4 = external global float  ; assigned to register: f26

@d1 = external global double ; assigned to register: f28
@d2 = external global double ; assigned to register: f30

define ghccc void @foo() nounwind {
entry:
  %0  = load double, double* @d2
  %1  = load double, double* @d1
  %2  = load float, float* @f4
  %3  = load float, float* @f3
  %4 = load float, float* @f2
  %5 = load float, float* @f1
  %6 = load i64, i64* @splim
  %7 = load i64, i64* @r4
  %8 = load i64, i64* @r3
  %9 = load i64, i64* @r2
  %10 = load i64, i64* @r1
  %11 = load i64, i64* @hp
  %12 = load i64, i64* @sp
  %13 = load i64, i64* @base

  tail call ghccc void @bar(i64 %13, i64 %12, i64 %11, i64 %10, i64 %9, i64 %8, i64 %7, i64 %6,
                            float %5, float %4, float %3, float %2,
                            double %1, double %0) nounwind
  ret void
}

declare ghccc void @bar(i64, i64, i64, i64, i64, i64, i64, i64,
                        float, float, float, float,
                        double, double)
