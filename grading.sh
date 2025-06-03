#!/bin/bash
export PATH=/root/.opam/system/bin:/usr/local/arm/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin:/usr/lib/jvm/jdk-11/bin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/sbin:/usr/games:/usr/local/games:/snap/bin:/opt/RISCV/riscv/bin:/opt/RISCV/riscv/bin:/opt/RISCV/riscv/bin

cd src/step1
if [ -f "codegen" ]; then
    rm codegen 2>&1 >/dev/null
fi
touch err.txt
make codegen > err.txt 2>&1 
if [ $? == 0 ]; then
  cd ../../test-cases
  for file in $(find . -name "*.c"); do
    filename="${file#./}"
    filename="${filename%.c}"
    echo "Compiling $filename ..."
    clang -emit-llvm -S "$filename.c" -target riscv64-unknown-elf -o "$filename.ll" 2>/dev/null
    ../src/step1/codegen "$filename.ll"
    if ! [ -f "$filename.s" ]; then
      echo "请使用给定的函数命名文件名"
      exit 0
    fi
    if ! clang "$filename.s" ../lib/sylib.c -o "$filename" -target riscv64-unknown-elf -fuse-ld=lld 2>/dev/null; then
      echo "生成目标代码有误"
      exit 0
    fi
    qemu-riscv64 -L /opt/RISCV/riscv/bin -B 0x10000000 "$filename" < "$filename.in" > "$filename.out" 2>/dev/null

    # ./"$filename" < "$filename.in" > "$filename.out"
    if ! diff "$filename.out" "$filename.ans" >/dev/null; then
        echo "输出不一致"
        if [ -f "$filename" ]; then
            rm "$filename"
        fi
        exit 0
    fi
    rm "$filename"
  done
  echo "PASS!"
  rm *.ll *.s *.out 2>&1 >/dev/null
  rm ../src/step1/codegen
else 
  echo "An error occurred during the building process."
  echo "以下是提示信息："
  cat err.txt
fi