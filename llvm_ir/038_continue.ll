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
  store i32 0, i32* %v1
  %v2 = alloca i32
  store i32 0, i32* %v2
  br label %label_4
label_ret:                                                ; preds = %label_10
  %v3 = load i32, i32* %v0
  ret i32 %v3
label_4:                                                ; preds = %label_entry, %label_12, %label_15
  %v5 = load i32, i32* %v1
  %v6 = icmp slt i32 %v5, 100
  br i1 %v6, label %label_7, label %label_10
label_7:                                                ; preds = %label_4
  %v8 = load i32, i32* %v1
  %v9 = icmp eq i32 %v8, 50
  br i1 %v9, label %label_12, label %label_15
label_10:                                                ; preds = %label_4
  %v11 = load i32, i32* %v2
  store i32 %v11, i32* %v0
  br label %label_ret
label_12:                                                ; preds = %label_7
  %v13 = load i32, i32* %v1
  %v14 = add i32 %v13, 1
  store i32 %v14, i32* %v1
  br label %label_4
label_15:                                                ; preds = %label_7
  %v16 = load i32, i32* %v2
  %v17 = load i32, i32* %v1
  %v18 = add i32 %v16, %v17
  store i32 %v18, i32* %v2
  %v19 = load i32, i32* %v1
  %v20 = add i32 %v19, 1
  store i32 %v20, i32* %v1
  br label %label_4
}

