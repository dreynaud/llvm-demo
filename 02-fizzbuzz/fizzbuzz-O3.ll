; ModuleID = 'fizzbuzz-named.ll'
source_filename = "fizzbuzz.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [5 x i8] c"Fizz\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Buzz\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind ssp uwtable
define i32 @main() local_unnamed_addr #0 {
bb:
  br label %bb5

bb5:                                              ; preds = %bb28, %bb
  %tmp1.08 = phi i32 [ 1, %bb ], [ %tmp32, %bb28 ]
  %tmp7 = srem i32 %tmp1.08, 3
  %tmp8 = icmp eq i32 %tmp7, 0
  br i1 %tmp8, label %bb9, label %bb11

bb9:                                              ; preds = %bb5
  %tmp10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  br label %bb11

bb11:                                             ; preds = %bb9, %bb5
  %tmp13 = srem i32 %tmp1.08, 5
  %tmp14 = icmp eq i32 %tmp13, 0
  br i1 %tmp14, label %bb17.thread, label %bb17

bb17.thread:                                      ; preds = %bb11
  %tmp16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  br label %bb28

bb17:                                             ; preds = %bb11
  br i1 %tmp8, label %bb28, label %bb25

bb25:                                             ; preds = %bb17
  %tmp27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 %tmp1.08)
  br label %bb28

bb28:                                             ; preds = %bb17.thread, %bb17, %bb25
  %putchar = tail call i32 @putchar(i32 10)
  %tmp32 = add nuw nsw i32 %tmp1.08, 1
  %exitcond = icmp eq i32 %tmp32, 101
  br i1 %exitcond, label %bb33, label %bb5

bb33:                                             ; preds = %bb28
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #2

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
