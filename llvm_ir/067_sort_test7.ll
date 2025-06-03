@buf = global [2 x [100 x i32]] zeroinitializer
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
define void @merge_sort(i32 %arg_0, i32 %arg_1) {
label_entry:
  %v2 = alloca i32
  store i32 %arg_0, i32* %v2
  %v3 = alloca i32
  store i32 %arg_1, i32* %v3
  %v4 = load i32, i32* %v2
  %v5 = add i32 %v4, 1
  %v6 = load i32, i32* %v3
  %v7 = icmp sge i32 %v5, %v6
  br i1 %v7, label %label_8, label %label_9
label_ret:                                                ; preds = %label_8, %label_103
  ret void
label_8:                                                ; preds = %label_entry
  br label %label_ret
label_9:                                                ; preds = %label_entry
  %v10 = load i32, i32* %v2
  %v11 = load i32, i32* %v3
  %v12 = add i32 %v10, %v11
  %v13 = sdiv i32 %v12, 2
  %v14 = alloca i32
  store i32 %v13, i32* %v14
  %v15 = load i32, i32* %v2
  %v16 = load i32, i32* %v14
  call void @merge_sort(i32 %v15, i32 %v16)
  %v17 = load i32, i32* %v14
  %v18 = load i32, i32* %v3
  call void @merge_sort(i32 %v17, i32 %v18)
  %v19 = load i32, i32* %v2
  %v20 = alloca i32
  store i32 %v19, i32* %v20
  %v21 = load i32, i32* %v14
  %v22 = alloca i32
  store i32 %v21, i32* %v22
  %v23 = load i32, i32* %v2
  %v24 = alloca i32
  store i32 %v23, i32* %v24
  br label %label_25
label_25:                                                ; preds = %label_9, %label_58
  %v26 = load i32, i32* %v20
  %v27 = load i32, i32* %v14
  %v28 = icmp slt i32 %v26, %v27
  br i1 %v28, label %label_38, label %label_37
label_29:                                                ; preds = %label_38
  %v30 = load i32, i32* %v20
  %v31 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v30
  %v32 = load i32, i32* %v31
  %v33 = load i32, i32* %v22
  %v34 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v33
  %v35 = load i32, i32* %v34
  %v36 = icmp slt i32 %v32, %v35
  br i1 %v36, label %label_42, label %label_50
label_37:                                                ; preds = %label_25, %label_38
  br label %label_61
label_38:                                                ; preds = %label_25
  %v39 = load i32, i32* %v22
  %v40 = load i32, i32* %v3
  %v41 = icmp slt i32 %v39, %v40
  br i1 %v41, label %label_29, label %label_37
label_42:                                                ; preds = %label_29
  %v43 = load i32, i32* %v20
  %v44 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v43
  %v45 = load i32, i32* %v44
  %v46 = load i32, i32* %v24
  %v47 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %v46
  store i32 %v45, i32* %v47
  %v48 = load i32, i32* %v20
  %v49 = add i32 %v48, 1
  store i32 %v49, i32* %v20
  br label %label_58
label_50:                                                ; preds = %label_29
  %v51 = load i32, i32* %v22
  %v52 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v51
  %v53 = load i32, i32* %v52
  %v54 = load i32, i32* %v24
  %v55 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %v54
  store i32 %v53, i32* %v55
  %v56 = load i32, i32* %v22
  %v57 = add i32 %v56, 1
  store i32 %v57, i32* %v22
  br label %label_58
label_58:                                                ; preds = %label_42, %label_50
  %v59 = load i32, i32* %v24
  %v60 = add i32 %v59, 1
  store i32 %v60, i32* %v24
  br label %label_25
label_61:                                                ; preds = %label_37, %label_65
  %v62 = load i32, i32* %v20
  %v63 = load i32, i32* %v14
  %v64 = icmp slt i32 %v62, %v63
  br i1 %v64, label %label_65, label %label_75
label_65:                                                ; preds = %label_61
  %v66 = load i32, i32* %v20
  %v67 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v66
  %v68 = load i32, i32* %v67
  %v69 = load i32, i32* %v24
  %v70 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %v69
  store i32 %v68, i32* %v70
  %v71 = load i32, i32* %v20
  %v72 = add i32 %v71, 1
  store i32 %v72, i32* %v20
  %v73 = load i32, i32* %v24
  %v74 = add i32 %v73, 1
  store i32 %v74, i32* %v24
  br label %label_61
label_75:                                                ; preds = %label_61
  br label %label_76
label_76:                                                ; preds = %label_75, %label_80
  %v77 = load i32, i32* %v22
  %v78 = load i32, i32* %v3
  %v79 = icmp slt i32 %v77, %v78
  br i1 %v79, label %label_80, label %label_90
label_80:                                                ; preds = %label_76
  %v81 = load i32, i32* %v22
  %v82 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v81
  %v83 = load i32, i32* %v82
  %v84 = load i32, i32* %v24
  %v85 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %v84
  store i32 %v83, i32* %v85
  %v86 = load i32, i32* %v22
  %v87 = add i32 %v86, 1
  store i32 %v87, i32* %v22
  %v88 = load i32, i32* %v24
  %v89 = add i32 %v88, 1
  store i32 %v89, i32* %v24
  br label %label_76
label_90:                                                ; preds = %label_76
  br label %label_91
label_91:                                                ; preds = %label_90, %label_95
  %v92 = load i32, i32* %v2
  %v93 = load i32, i32* %v3
  %v94 = icmp slt i32 %v92, %v93
  br i1 %v94, label %label_95, label %label_103
label_95:                                                ; preds = %label_91
  %v96 = load i32, i32* %v2
  %v97 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %v96
  %v98 = load i32, i32* %v97
  %v99 = load i32, i32* %v2
  %v100 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %v99
  store i32 %v98, i32* %v100
  %v101 = load i32, i32* %v2
  %v102 = add i32 %v101, 1
  store i32 %v102, i32* %v2
  br label %label_91
label_103:                                                ; preds = %label_91
  br label %label_ret
}
define i32 @main() {
label_entry:
  %v0 = alloca i32
  %v1 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %v2 = getelementptr [100 x i32], [100 x i32]* %v1, i32 0, i32 0
  %v3 = call i32 @getarray(i32* %v2)
  %v4 = alloca i32
  store i32 %v3, i32* %v4
  %v5 = load i32, i32* %v4
  call void @merge_sort(i32 0, i32 %v5)
  %v6 = load i32, i32* %v4
  %v7 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %v8 = getelementptr [100 x i32], [100 x i32]* %v7, i32 0, i32 0
  call void @putarray(i32 %v6, i32* %v8)
  store i32 0, i32* %v0
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  %v9 = load i32, i32* %v0
  ret i32 %v9
}

