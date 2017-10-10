# inspect bitcode
clang -c -emit-llvm fizzbuzz.c -o fizzbuzz.bc
llvm-dis fizzbuzz.bc -o fizzbuzz.ll

# make it more readable
# (explain basic block and branches)
opt -instnamer < fizzbuzz.ll | llvm-dis > fizzbuzz-named.ll

# optimize away the return value, run it
lli fizzbuzz-opt-ret.ll

# manually promote the i local variable to a register
# (introduces single def, phi)
lli fizzbuzz-manual-mem2reg.ll

# show that we can get the same by using the actual mem2reg pass
# (make sure to remove the optnone attribute on main if it's there)
opt -S -mem2reg fizzbuzz-named.ll | tee fizzbuzz-mem2reg.ll

# bring out the guns and compare
opt -S -O3 fizzbuzz-named.ll > fizzbuzz-O3.ll
opendiff fizzbuzz-mem2reg.ll fizzbuzz-O3.ll

# take a look at the passes that ran and the available passes
opt -S -O3 -time-passes fizzbuzz-named.ll > fizzbuzz-O3.ll
opt -help