; ModuleID = 'useafterfree.bc'
source_filename = "useafterfree.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @use(i8* %obj) local_unnamed_addr #0 !dbg !15 {
entry:
  call void @llvm.dbg.value(metadata i8* %obj, metadata !19, metadata !DIExpression()), !dbg !20
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %obj), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 !dbg !23 {
entry:
  %call = tail call noalias dereferenceable_or_null(10) i8* @malloc(i64 10) #5, !dbg !30
  call void @llvm.dbg.value(metadata i8* %call, metadata !28, metadata !DIExpression()), !dbg !31
  %call1 = tail call noalias dereferenceable_or_null(10) i8* @malloc(i64 10) #5, !dbg !32
  call void @llvm.dbg.value(metadata i8* %call1, metadata !29, metadata !DIExpression()), !dbg !31
  tail call void @free(i8* %call) #5, !dbg !33
  tail call void @use(i8* %call), !dbg !34
  tail call void @use(i8* %call1), !dbg !35
  ret i32 0, !dbg !36
}

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare !dbg !6 dso_local void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nofree noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "useafterfree.c", directory: "/home/gli076/Workspace/CS165-project/progs")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DISubprogram(name: "free", scope: !7, file: !7, line: 563, type: !8, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2)
!7 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 "}
!15 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 5, type: !16, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !{!19}
!19 = !DILocalVariable(name: "obj", arg: 1, scope: !15, file: !1, line: 5, type: !4)
!20 = !DILocation(line: 0, scope: !15)
!21 = !DILocation(line: 6, column: 5, scope: !15)
!22 = !DILocation(line: 7, column: 1, scope: !15)
!23 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !24, scopeLine: 9, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !27)
!24 = !DISubroutineType(types: !25)
!25 = !{!26}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !{!28, !29}
!28 = !DILocalVariable(name: "obj1", scope: !23, file: !1, line: 10, type: !4)
!29 = !DILocalVariable(name: "obj2", scope: !23, file: !1, line: 11, type: !4)
!30 = !DILocation(line: 10, column: 25, scope: !23)
!31 = !DILocation(line: 0, scope: !23)
!32 = !DILocation(line: 11, column: 25, scope: !23)
!33 = !DILocation(line: 12, column: 5, scope: !23)
!34 = !DILocation(line: 13, column: 5, scope: !23)
!35 = !DILocation(line: 14, column: 5, scope: !23)
!36 = !DILocation(line: 15, column: 5, scope: !23)
