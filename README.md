# SHA256

This is an implementation of the SHA-256 secure hash algorithm defined in
[FIPS 180-4](https://csrc.nist.gov/publications/detail/fips/180/4/final)

It is not a byte-oriented implementation. Still, it may complement
a portable byte-oriented C version of AES-256 at
[www.literatecode.com/aes256](http://www.literatecode.com/aes256)


## Compile

This implementation supports `clang` (recommended) and `GCC` C compilers.
Other compilers may also work with some minor code tweaking. Apologies for
not caring about the seamless support of the MSVC compiler any longer.
Check the legacy section below if you still need that.

Use `make` or `sh sha256.c -c -o sha256.o` to compile into an object file
that you may link with your project later.

Use `make test` or `sh sha256.c -DSHA256_SELF_TEST__` to compile an
executable binary that will perform a few known answer tests for SHA-256.


## Formal verification

We rely on [C Bounded Model Checker](http://www.cprover.org/cbmc/) to formally
verify code properties.

Use `make verify` to verify the self-testing code. 

If you want to focus verification on a single function, use
`make verify FUNC=XYZ`, where `XYZ` is a function name.

Check [https://github.com/diffblue/cbmc](https://github.com/diffblue/cbmc)
for the latest version of CBMC.


## History

* 2010: The original code was written.
* 2013: The original code was published on [GitHub](https://github.com/ilvn/SHA256).
* 2014: The Mark 2 version was written (cleaner, closer to a reference implementation, formally verifiable).
* 2017: The Mark 2 version was added to the repository.
* 2022: The revamped Mark 2 version superseded the original code.

### Legacy

The original version is still available under the tag 
[legacy](https://github.com/ilvn/SHA256/releases/tag/legacy) and provided
only for reference. Therefore, it is no longer supported or recommended.
