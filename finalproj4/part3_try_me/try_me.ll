; ModuleID = 'try_me.bc'
source_filename = "try_me.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.test.test = private unnamed_addr constant [17 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [20 x i8] c"You have input: %s\0A\00", align 1
@filename = common dso_local global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str.1 = private unnamed_addr constant [22 x i8] c"uid_%d_crack_advanced\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"file name: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"uid_%d_crack\00", align 1
@str = private unnamed_addr constant [34 x i8] c"Please provide at least one input\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @test(i8* nocapture readonly %input) local_unnamed_addr #0 !dbg !25 {
entry:
  %test = alloca [17 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %input, metadata !30, metadata !DIExpression()), !dbg !35
  %0 = getelementptr inbounds [17 x i8], [17 x i8]* %test, i64 0, i64 0, !dbg !36
  call void @llvm.lifetime.start.p0i8(i64 17, i8* nonnull %0) #8, !dbg !36
  call void @llvm.dbg.declare(metadata [17 x i8]* %test, metadata !31, metadata !DIExpression()), !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(17) %0, i8* nonnull align 16 dereferenceable(17) getelementptr inbounds ([17 x i8], [17 x i8]* @__const.test.test, i64 0, i64 0), i64 17, i1 false), !dbg !37
  %call = call i8* @strcpy(i8* nonnull %0, i8* nonnull dereferenceable(1) %input) #8, !dbg !38
  %call2 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* nonnull %0), !dbg !39
  call void @llvm.lifetime.end.p0i8(i64 17, i8* nonnull %0) #8, !dbg !40
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nofree nounwind
declare dso_local i8* @strcpy(i8* noalias returned, i8* noalias nocapture readonly) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @log_result() local_unnamed_addr #4 !dbg !41 {
entry:
  %call = tail call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @filename, i64 0, i64 0), i32 1088) #8, !dbg !46
  call void @llvm.dbg.value(metadata i32 %call, metadata !45, metadata !DIExpression()), !dbg !47
  %call1 = tail call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %call) #8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree
declare !dbg !6 dso_local i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #5

declare dso_local i32 @close(...) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local void @log_result_advanced(i32 %print) local_unnamed_addr #4 !dbg !50 {
entry:
  %filename2 = alloca [100 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %print, metadata !54, metadata !DIExpression()), !dbg !60
  %cmp = icmp eq i32 %print, -272716322, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  %0 = getelementptr inbounds [100 x i8], [100 x i8]* %filename2, i64 0, i64 0, !dbg !63
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %0) #8, !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i8]* %filename2, metadata !55, metadata !DIExpression()), !dbg !64
  %call = tail call i32 (...) @getuid() #8, !dbg !65
  call void @llvm.dbg.value(metadata i32 %call, metadata !58, metadata !DIExpression()), !dbg !66
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %0, i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %call) #8, !dbg !67
  %call3 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %0), !dbg !68
  %call5 = call i32 (i8*, i32, ...) @open(i8* nonnull %0, i32 1088) #8, !dbg !69
  call void @llvm.dbg.value(metadata i32 %call5, metadata !59, metadata !DIExpression()), !dbg !66
  %call6 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %call5) #8, !dbg !70
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %0) #8, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !73
}

declare !dbg !14 dso_local i32 @getuid(...) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i32 @sprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @main(i32 %argc, i8** nocapture readonly %args) local_unnamed_addr #4 !dbg !74 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !79, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i8** %args, metadata !80, metadata !DIExpression()), !dbg !84
  %cmp = icmp sgt i32 %argc, 1, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  %call = tail call i32 (...) @getuid() #8, !dbg !87
  call void @llvm.dbg.value(metadata i32 %call, metadata !81, metadata !DIExpression()), !dbg !88
  %call1 = tail call i32 (i8*, i8*, ...) @sprintf(i8* nonnull dereferenceable(1) getelementptr inbounds ([100 x i8], [100 x i8]* @filename, i64 0, i64 0), i8* nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 %call) #8, !dbg !89
  %call2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @filename, i64 0, i64 0)), !dbg !90
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !91
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !91, !tbaa !92
  tail call void @test(i8* %0), !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([34 x i8], [34 x i8]* @str, i64 0, i64 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree nounwind }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "filename", scope: !2, file: !3, line: 6, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !17, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "try_me.c", directory: "/home/gli076/Workspace/CS165-project/progs")
!4 = !{}
!5 = !{!6, !14}
!6 = !DISubprogram(name: "open", scope: !7, file: !7, line: 157, type: !8, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!7 = !DIFile(filename: "/usr/include/fcntl.h", directory: "")
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, null}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DISubprogram(name: "getuid", scope: !3, file: !3, line: 29, type: !15, flags: DIFlagArtificial, spFlags: DISPFlagOptimized, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!10, null}
!17 = !{!0}
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 800, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 100)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{!"clang version 10.0.1 "}
!25 = distinct !DISubprogram(name: "test", scope: !3, file: !3, line: 9, type: !26, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !29)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!29 = !{!30, !31}
!30 = !DILocalVariable(name: "input", arg: 1, scope: !25, file: !3, line: 9, type: !28)
!31 = !DILocalVariable(name: "test", scope: !25, file: !3, line: 11, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 136, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 17)
!35 = !DILocation(line: 0, scope: !25)
!36 = !DILocation(line: 11, column: 5, scope: !25)
!37 = !DILocation(line: 11, column: 10, scope: !25)
!38 = !DILocation(line: 12, column: 5, scope: !25)
!39 = !DILocation(line: 14, column: 5, scope: !25)
!40 = !DILocation(line: 15, column: 1, scope: !25)
!41 = distinct !DISubprogram(name: "log_result", scope: !3, file: !3, line: 17, type: !42, scopeLine: 18, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !44)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !{!45}
!45 = !DILocalVariable(name: "fd", scope: !41, file: !3, line: 19, type: !10)
!46 = !DILocation(line: 19, column: 14, scope: !41)
!47 = !DILocation(line: 0, scope: !41)
!48 = !DILocation(line: 20, column: 5, scope: !41)
!49 = !DILocation(line: 21, column: 1, scope: !41)
!50 = distinct !DISubprogram(name: "log_result_advanced", scope: !3, file: !3, line: 24, type: !51, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !53)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !10}
!53 = !{!54, !55, !58, !59}
!54 = !DILocalVariable(name: "print", arg: 1, scope: !50, file: !3, line: 24, type: !10)
!55 = !DILocalVariable(name: "filename2", scope: !56, file: !3, line: 28, type: !18)
!56 = distinct !DILexicalBlock(scope: !57, file: !3, line: 27, column: 5)
!57 = distinct !DILexicalBlock(scope: !50, file: !3, line: 26, column: 8)
!58 = !DILocalVariable(name: "uid", scope: !56, file: !3, line: 29, type: !10)
!59 = !DILocalVariable(name: "fd", scope: !56, file: !3, line: 33, type: !10)
!60 = !DILocation(line: 0, scope: !50)
!61 = !DILocation(line: 26, column: 14, scope: !57)
!62 = !DILocation(line: 26, column: 8, scope: !50)
!63 = !DILocation(line: 28, column: 9, scope: !56)
!64 = !DILocation(line: 28, column: 14, scope: !56)
!65 = !DILocation(line: 29, column: 19, scope: !56)
!66 = !DILocation(line: 0, scope: !56)
!67 = !DILocation(line: 31, column: 9, scope: !56)
!68 = !DILocation(line: 32, column: 9, scope: !56)
!69 = !DILocation(line: 33, column: 18, scope: !56)
!70 = !DILocation(line: 34, column: 9, scope: !56)
!71 = !DILocation(line: 35, column: 5, scope: !57)
!72 = !DILocation(line: 35, column: 5, scope: !56)
!73 = !DILocation(line: 36, column: 1, scope: !50)
!74 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 38, type: !75, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !78)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !10, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!78 = !{!79, !80, !81}
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !3, line: 38, type: !10)
!80 = !DILocalVariable(name: "args", arg: 2, scope: !74, file: !3, line: 38, type: !77)
!81 = !DILocalVariable(name: "uid", scope: !82, file: !3, line: 42, type: !10)
!82 = distinct !DILexicalBlock(scope: !83, file: !3, line: 41, column: 5)
!83 = distinct !DILexicalBlock(scope: !74, file: !3, line: 40, column: 8)
!84 = !DILocation(line: 0, scope: !74)
!85 = !DILocation(line: 40, column: 13, scope: !83)
!86 = !DILocation(line: 40, column: 8, scope: !74)
!87 = !DILocation(line: 42, column: 19, scope: !82)
!88 = !DILocation(line: 0, scope: !82)
!89 = !DILocation(line: 44, column: 9, scope: !82)
!90 = !DILocation(line: 45, column: 9, scope: !82)
!91 = !DILocation(line: 46, column: 14, scope: !82)
!92 = !{!93, !93, i64 0}
!93 = !{!"any pointer", !94, i64 0}
!94 = !{!"omnipotent char", !95, i64 0}
!95 = !{!"Simple C/C++ TBAA"}
!96 = !DILocation(line: 46, column: 9, scope: !82)
!97 = !DILocation(line: 47, column: 5, scope: !82)
!98 = !DILocation(line: 50, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !83, file: !3, line: 49, column: 5)
!100 = !DILocation(line: 52, column: 1, scope: !74)
