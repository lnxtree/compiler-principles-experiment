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
define i32 @gcd(i32 %arg_0, i32 %arg_1) {
label_entry:
  %v2 = alloca i32
  store i32 %arg_0, i32* %v2
  %v3 = alloca i32
  store i32 %arg_1, i32* %v3
  %v4 = alloca i32
  %v5 = load i32, i32* %v3
  %v6 = icmp eq i32 %v5, 0
  br i1 %v6, label %label_8, label %label_10
label_ret:                                                ; preds = %label_8, %label_10
  %v7 = load i32, i32* %v4
  ret i32 %v7
label_8:                                                ; preds = %label_entry
  %v9 = load i32, i32* %v2
  store i32 %v9, i32* %v4
  br label %label_ret
label_10:                                                ; preds = %label_entry
  %v11 = load i32, i32* %v3
  %v12 = load i32, i32* %v2
  %v13 = load i32, i32* %v3
  %v14 = srem i32 %v12, %v13
  %v15 = call i32 @gcd(i32 %v11, i32 %v14)
  store i32 %v15, i32* %v4
  br label %label_ret
}
define i32 @main() {
label_entry:
  %v0 = alloca i32
  %v1 = call i32 @getint()
  %v2 = alloca i32
  store i32 %v1, i32* %v2
  br label %label_4
label_ret:                                                ; preds = %label_17
  %v3 = load i32, i32* %v0
  ret i32 %v3
label_4:                                                ; preds = %label_entry, %label_7
  %v5 = load i32, i32* %v2
  %v6 = icmp sgt i32 %v5, 0
  br i1 %v6, label %label_7, label %label_17
label_7:                                                ; preds = %label_4
  %v8 = call i32 @getint()
  %v9 = alloca i32
  store i32 %v8, i32* %v9
  %v10 = call i32 @getint()
  %v11 = alloca i32
  store i32 %v10, i32* %v11
  %v12 = load i32, i32* %v9
  %v13 = load i32, i32* %v11
  %v14 = call i32 @gcd(i32 %v12, i32 %v13)
  call void @putint(i32 %v14)
  call void @putch(i32 10)
  %v15 = load i32, i32* %v2
  %v16 = sub i32 %v15, 1
  store i32 %v16, i32* %v2
  br label %label_4
label_17:                                                ; preds = %label_4
  store i32 0, i32* %v0
  br label %label_ret
}

