; ModuleID = 'memoryoverflow.c'
source_filename = "memoryoverflow.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d%d%d\00", align 1
@a = common dso_local global [10 x i64] zeroinitializer, align 16, !dbg !0
@b = common dso_local global [20 x i32] zeroinitializer, align 16, !dbg !6

; Function Attrs: nofree nounwind uwtable
define dso_local void @ignorethis2() local_unnamed_addr #0 !dbg !20 {
entry:
  %call = tail call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @a, i64 0, i64 0), i32* getelementptr inbounds ([20 x i32], [20 x i32]* @b, i64 0, i64 0)), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nounwind
declare dso_local i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @checkthisfunc() local_unnamed_addr #2 !dbg !25 {
entry:
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(96) bitcast ([10 x i64]* @a to i8*), i8 2, i64 96, i1 false), !dbg !26
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(48) bitcast ([20 x i32]* @b to i8*), i8 2, i64 48, i1 false), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nounwind uwtable
define dso_local void @ignorethis() local_unnamed_addr #0 !dbg !29 {
entry:
  %call.i = tail call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @a, i64 0, i64 0), i32* getelementptr inbounds ([20 x i32], [20 x i32]* @b, i64 0, i64 0)) #4, !dbg !30
  ret void, !dbg !32
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !33 {
entry:
  %call.i.i = tail call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @a, i64 0, i64 0), i32* getelementptr inbounds ([20 x i32], [20 x i32]* @b, i64 0, i64 0)) #4, !dbg !36
  ret i32 0, !dbg !39
}

attributes #0 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 3, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "memoryoverflow.c", directory: "/home/gli076/Workspace/CS165-project/project4/memoryoverflow")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 640, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 20)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 640, elements: !14)
!13 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!14 = !{!15}
!15 = !DISubrange(count: 10)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 "}
!20 = distinct !DISubprogram(name: "ignorethis2", scope: !3, file: !3, line: 6, type: !21, scopeLine: 6, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 7, column: 5, scope: !20)
!24 = !DILocation(line: 8, column: 1, scope: !20)
!25 = distinct !DISubprogram(name: "checkthisfunc", scope: !3, file: !3, line: 10, type: !21, scopeLine: 10, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!26 = !DILocation(line: 11, column: 5, scope: !25)
!27 = !DILocation(line: 12, column: 5, scope: !25)
!28 = !DILocation(line: 13, column: 1, scope: !25)
!29 = distinct !DISubprogram(name: "ignorethis", scope: !3, file: !3, line: 15, type: !21, scopeLine: 15, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!30 = !DILocation(line: 7, column: 5, scope: !20, inlinedAt: !31)
!31 = distinct !DILocation(line: 16, column: 5, scope: !29)
!32 = !DILocation(line: 17, column: 1, scope: !29)
!33 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 19, type: !34, scopeLine: 19, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{!9}
!36 = !DILocation(line: 7, column: 5, scope: !20, inlinedAt: !37)
!37 = distinct !DILocation(line: 16, column: 5, scope: !29, inlinedAt: !38)
!38 = distinct !DILocation(line: 20, column: 5, scope: !33)
!39 = !DILocation(line: 21, column: 5, scope: !33)
