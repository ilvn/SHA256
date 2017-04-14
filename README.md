# SHA256

SHA-256 implementation to compliment a portable byte-oriented AES-256 
implementation in C at http://www.literatecode.com/aes256 

There is also a newer version in the [mark2](mark2) directory. This version is
cleaner and closer to a reference implementation. It no longer has
built-in support features for endianness, but you may easily adapt
the code to different endianness shall you need that.

Unlike the previous implementation, the Mark 2 one is formally
verifiable with [CBMC](http://www.cprover.org/cbmc/)

