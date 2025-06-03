#!/bin/bash

cd src/step1
# if [ -f "codegen" ]; then
#    rm codegen 2>&1 >/dev/null
# fi
touch err.txt
make codegen > err.txt 2>&1 >/dev/null
if [ $? == 0 ]; then 
  chmod +x codegen
  cd ../../llvm_ir
  
  read -p '' case

  irfile=$case
  target=${case/".ll"/".riscv"}
  infile=${case/".ll"/".in"}
  asmfile=${case/".ll"/".s"}

  ../src/step1/codegen $irfile
  if [ -f $asmfile ]; then
      # qemu-arm -L /usr/arm-linux-gnueabihf/ -B 0x10000000 "$filename" < "$filename.in" > "$filename.out" 2>/dev/null 
      # arm-linux-gnueabihf-gcc $asmfile ../lib/libsysy.a -o $target -static
      #clang -target riscv64-unknown-elf -march=rv64i2p0 $asmfile ../lib/sylib.c -o $target -fuse-ld=lld
      riscv64-unknown-elf-gcc $asmfile ../lib/sylib.c -o $target 
      # If InFile exists, Redirect and Compare
      if [ $? == 0 ]; then 
          if [ -f $infile ]; then
	            qemu-riscv64  -L /opt/RISCV/riscv/bin -B 0x10000000 ./$target < $infile 
	            echo $?
          else
	            qemu-riscv64  -L /opt/RISCV/riscv/bin -B 0x10000000 ./$target 
	            echo $?
          fi
      else
          echo "riscv汇编编译失败！！"    
      fi
  else 
    echo "Codegen未生成arm汇编代码！"
  fi   
else  
    echo "Codegen未编译成功，请排查程序错误！以下是提示信息："
    cat err.txt
fi 