# install llvm (plus optionally put in PATH)
# alternatively could use the LLVM that ships with Xcode
brew install llvm

# emit on-disk bitcode
clang -c -emit-llvm hello.c -o hello.bc
less hello.bc

# turn it into human-readable bitcode
llvm-dis hello.bc -o hello.ll
blime hello.ll

# compile it down to x86
llc < hello.ll | tee hello.s

# or other things
llc -mtriple=arm64-apple-macosx10.12.0 < hello.ll
llc -mtriple=mips-apple-macosx10.12.0 < hello.ll

# run it
lli hello.ll

# edit hello.ll and run it again
lli hello-modified.ll

# assemble, disassemble
as hello.s -o hello.o
objdump -D hello.o

# link and run
#   -lSystem links against libSystem, needed for the lib C runtime (start, printf)
ld -lSystem -macosx_version_min 10.12 hello.o -o hello
./hello

# (alternatively)
ld -lSystem /usr/lib/crt1.o hello.o -o hello

# edit hello.s and run it again
as hello-42ed.s -o hello-42ed.o
ld -lSystem -macosx_version_min 10.12 hello-42ed.o -o hello-42ed
./hello-42ed
echo $?
