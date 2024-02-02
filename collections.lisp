(#|
  Vectors:
    Static -
    (vector) -> #()
    #() -> #()
 
    Semi-dynamic -
    (make-array len :fill-pointer ptr) -> vector with max length of len
    (vector-push element *vector*) -> returns incremented fill-pointer and pushes new element to vector
    (vector-pop *vector*) -> returns last element and decrements fill-pointer
 
    (make-array len :fill-pointer ptr :adjustable t) -> this vector can be extended with vector-push-extend
 
    Typed vector
    (make-array 5 :fill-pointer 0 :element-type 'character) -> this vec can hold only char elements
 
    Accessing values -
    (length *vec*) -> returns length of vector
    (elt *vec* idx) -> returns element at idx position (by ref) so we can setf it
    (setf (elt *vec* idx) new-value)
 
    Iterating -
    (count val *vec*) - counts val occurences in vec
    (find val *vec*) - returns val if found or nil otherwise in vec
    (position val *vec*) - returns idx of val if found or nil otherwise
    (remove val *vec*) - returns new vec with all val occurences removed
    (substitute new-val old-val *vec*) - returns new vec with all old-val occurences replaced with new-val
      Additional named args for iterating:
        :test - func that takes two params and returns bool (count "foo" #("foo" "bar" "baz") :test #'string=) -> 1
        :key - one-arg func, extracts 'key' value which will be compared to item (find 'c #((a 1) (b 2) (c 3)) :key #'first) -> (c 3)
        :start and :end - delimits indexes to work between
        :from-end - if non-nil reverses iterating
        :count - specifies count of elements to remove or substitute
 
    HOF iterating -
    <basic-iter-name>-if
    <basic-iter-name>-if-not
    predicate is the first argument
    Also we have remove-duplicates function (set from array): (remove-duplicates #(1 2 1 3 3 2)) -> #(1 2 3)
 
    Whole sequence manipulation - 
    (copy-seq *vec*) returns same sequence
    (reverse *vec*) returns reversed sequence
    (concatenate type *vec1* *vec2*) returns sequence *vec1*->*vec2*
      (concatenate 'vector #(1 2 3) '(4 5 6))    ==> #(1 2 3 4 5 6)
      (concatenate 'list #(1 2 3) '(4 5 6))      ==> (1 2 3 4 5 6)
      (concatenate 'string "abc" '(#\d #\e #\f)) ==> "abcdef"
 
    Sorting and merging:
    (sort *vec* pred) - sorts vec by predicate
    (stable-sort *vec* pred) - as sort, but without reordering
      *sorts may destruct collection, so consider using something like
        (setf my-collection (sort my-collection pred))
    (merge type collection1 collection2 pred) -> like concatenate, but if both collections are sorted with pred - result will be also sorted with it
 
    Subsequences - 
      (subseq "foobarbaz" 3) -> "barbaz"
      (subseq "foobarbaz" 3 6) -> "bar"
      Returns setf-able value
      (defparameter *seq* (copy-seq "foobarbaz"))
      (setf (subseq *seq* 3 6) "xxx") -> "fooxxxbaz"
      (setf (subseq *seq* 3 6) "abcd") -> "fooabcbaz" - new val is too long, extra ignored
      (setf (subseq *seq* 3 6) "xx") -> "fooxxcbaz" - new val is too short, changed only part of subseq
      (search "bar" "foobarbaz") -> 3 - finds index of subseq start
      (mismatch "foobarbaz" "foom") -> 3 - returns first mismatching element index or nil if both collections are same
|#)