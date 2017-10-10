; ModuleID = 'fizzbuzz-named.ll'
source_filename = "fizzbuzz.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [5 x i8] c"Fizz\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Buzz\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable
define i32 @main() #0 {
bb:
  br label %bb2

bb2:                                              ; preds = %bb30, %bb
  %tmp1.0 = phi i32 [ 1, %bb ], [ %tmp32, %bb30 ]
  %tmp4 = icmp sle i32 %tmp1.0, 100
  br i1 %tmp4, label %bb5, label %bb33

bb5:                                              ; preds = %bb2
  %tmp7 = srem i32 %tmp1.0, 3
  %tmp8 = icmp eq i32 %tmp7, 0
  br i1 %tmp8, label %bb9, label %bb11

bb9:                                              ; preds = %bb5
  %tmp10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  br label %bb11

bb11:                                             ; preds = %bb9, %bb5
  %tmp13 = srem i32 %tmp1.0, 5
  %tmp14 = icmp eq i32 %tmp13, 0
  br i1 %tmp14, label %bb15, label %bb17

bb15:                                             ; preds = %bb11
  %tmp16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  br label %bb17

bb17:                                             ; preds = %bb15, %bb11
  %tmp19 = srem i32 %tmp1.0, 3
  %tmp20 = icmp ne i32 %tmp19, 0
  br i1 %tmp20, label %bb21, label %bb28

bb21:                                             ; preds = %bb17
  %tmp23 = srem i32 %tmp1.0, 5
  %tmp24 = icmp ne i32 %tmp23, 0
  br i1 %tmp24, label %bb25, label %bb28

bb25:                                             ; preds = %bb21
  %tmp27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 %tmp1.0)
  br label %bb28

bb28:                                             ; preds = %bb25, %bb21, %bb17
  %tmp29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  br label %bb30

bb30:                                             ; preds = %bb28
  %tmp32 = add nsw i32 %tmp1.0, 1
  br label %bb2

bb33:                                             ; preds = %bb2
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
