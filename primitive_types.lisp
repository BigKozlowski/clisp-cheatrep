(#|
  Integers: 123
  Rational: 1/6
  Binary: #b10101 -> 21
  #b1010/1011 -> 10/11
  Octal: #o777 -> 511
  Hex: #xDADA -> 56026
  Custom radix: #9r10 -> 9
  #36rZ -> 35
 
  Floats: 1.0 -> 1.0
  1e0 -> 1.0
  1d0 -> 1.0d0
  0.123 -> 0.123
  123e-3 -> 0.123
  0.123e20 -> 1.23e+19
  123d23 -> 1.23d+25
 
  Complex: #c(2 1) -> #c(2 1)
  #c(2/3  3/4)    ==> #c(2/3 3/4)
  #c(2    1.0)    ==> #c(2.0 1.0)
  #c(2.0  1.0d0)  ==> #c(2.0d0 1.0d0)
  #c(1/2  1.0)    ==> #c(0.5 1.0)
  #c(3      0)    ==> 3
  #c(3.0  0.0)    ==> #c(3.0 0.0)
  #c(1/2    0)    ==> 1/2
  #c(-6/3   0)    ==> -2
 
  Characters: #\x -> 'x'
  \#Space -> ' '
 
  Char functions: 
  = -> char-equal
  /= -> char-not-equal
  < -> char-lessp
  > -> char-greaterp
  <= -> char-not-greaterp
  >= -> char-not-lessp
 
  Strings:
  "foobar" -> foobar -> plain string
  "foo\"bar" -> foo"bar
  "foo\\bar" -> foo\bar
  "foo\bar" -> foobar
  
  String functions: same as char, but with prefix "string-"
|#)