#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./rvcc "$input" > tmp.s
  $RISCV_GNU_TOOLCHAIN/bin/riscv64-unknown-linux-gnu-gcc -static -o tmp tmp.s
  $RISCV_GNU_TOOLCHAIN/bin/qemu-riscv64 -L $RISCV_GNU_TOOLCHAIN/sysroot ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 '5+20-4'

echo OK
