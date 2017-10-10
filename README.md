# LLVM

## What is it?
An open-source modular compiler framework

## What does it mean?
It used to stand for "Low-Level Virtual Machine", but the acronym has grown increasingly inaccurate and now it's officially not an acronym anymore.

## A bit of history
* 2000 started as a research project at the University of Illinois by [Chris Lattner](http://nondot.org/sabre/)
* 2005 Chris hired by Apple to keep working on LLVM
* 2011 LLVM becomes the [default compiler in Xcode](https://en.wikipedia.org/wiki/Xcode#4.x_series) (used to be GCC)
* 2015 LLVM becomes the [only compiler in Xcode](https://en.wikipedia.org/wiki/Xcode#5.x_series)

## What's the point?
* for Apple:
  * better IDE integration (auto-completion, compilation warnings, static code analysis)
  * faster compilation times than GCC
  * first amd64 compiler in the world (for iPhone 5S and up)
  * support for cool new language and runtime features like [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html) and Objective-C blocks
  * [Swift](https://developer.apple.com/swift/)!
* for Google:
  * [custom compilation warnings](http://blog.llvm.org/2011/05/c-at-google-here-be-dragons.html) and automatic refactoring on a large codebase
  * [TSan](https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual): data race detection for C/C++
  * [ASan](https://github.com/google/sanitizers/wiki/AddressSanitizer): memory error detection
  * [Native Client](https://developer.chrome.com/native-client) (now deprecated in favor of WebAssembly)
* for students and researchers:
  * the framework makes it very easy to write a specific analysis/optimization and run it on real programs

## How does it work?
* architecture:
  * many frontends (first-class C, C++, Obj-C and Swift support, Haskell support in GHC)
  * many targets
```
➜  llvm-demo git:(master) ✗ llc -version
LLVM (http://llvm.org/):
  LLVM version 5.0.0
  Optimized build.
  Default target: x86_64-apple-darwin16.7.0
  Host CPU: ivybridge

  Registered Targets:
    aarch64    - AArch64 (little endian)
    aarch64_be - AArch64 (big endian)
    amdgcn     - AMD GCN GPUs
    arm        - ARM
    arm64      - ARM64 (little endian)
    armeb      - ARM (big endian)
    bpf        - BPF (host endian)
    bpfeb      - BPF (big endian)
    bpfel      - BPF (little endian)
    hexagon    - Hexagon
    lanai      - Lanai
    mips       - Mips
    mips64     - Mips64 [experimental]
    mips64el   - Mips64el [experimental]
    mipsel     - Mipsel
    msp430     - MSP430 [experimental]
    nvptx      - NVIDIA PTX 32-bit
    nvptx64    - NVIDIA PTX 64-bit
    ppc32      - PowerPC 32
    ppc64      - PowerPC 64
    ppc64le    - PowerPC 64 LE
    r600       - AMD GPUs HD2XXX-HD6XXX
    sparc      - Sparc
    sparcel    - Sparc LE
    sparcv9    - Sparc V9
    systemz    - SystemZ
    thumb      - Thumb
    thumbeb    - Thumb (big endian)
    x86        - 32-bit X86: Pentium-Pro and above
    x86-64     - 64-bit X86: EM64T and AMD64
    xcore      - XCore
```
  * modular mid-level optimizations
* enabling technology: the [LLVM IR](https://llvm.org/docs/LangRef.html) (bitcode)
  * similar in principle to something like JVM bytecode
  * enables analysis and implementation passes to be language and target-agnostic
  * type-safe
  * register-based (like Dalvik)
  * SSA representation
  * explicit def-use chains

## Demo time
* [hello-c](hello-c)
* [fizzbuzz](fizzbuzz)

## Further Reading
[The Architecture of Open Source Applications - LLVM](http://www.aosabook.org/en/llvm.html)
