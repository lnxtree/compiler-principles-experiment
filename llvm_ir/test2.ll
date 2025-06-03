declare i32 @getint()
declare float @getfloat()
declare i32 @getch()
declare i32 @getarray(i32*)
declare i32 @getfarray(float*)
declare void @putint(i32)
declare void @putfloat(float)
declare void @putch(i32)
declare void @putarray(i32, i32*)
declare void @putfarray(i32, float*)
declare void @_sysy_starttime(i32)
declare void @_sysy_stoptime(i32)
declare void @__aeabi_memcpy4(i32*, i32*, i32)
declare void @__aeabi_memclr4(i32*, i32)
declare void @__aeabi_memset4(i32*, i32, i32)
declare void @llvm.memset.p0.i32(i32*, i8, i32, i1)
define i32 @main() {
label_entry:
  %v0 = alloca i32
  %v1 = alloca i32
  %v2 = alloca i32
  %v3 = alloca i32
  store i32 1, i32* %v1
  store i32 2, i32* %v2
  store i32 3, i32* %v3
  %v4 = load i32, i32* %v1
  %v5 = load i32, i32* %v2
  %v6 = load i32, i32* %v3
  %v7 = mul i32 %v5, %v6
  %v8 = add i32 %v4, %v7
  call void @putint(i32 %v8)
  call void @putch(i32 10)
  store i32 0, i32* %v0
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  %v9 = load i32, i32* %v0
  ret i32 %v9
}

