(defun verbose-sum (x y)
    "Sum any two numbers after printing a message."
    (format t "Summing ~d and ~d.~%" x y)
    (+ x y))

(defun opt-params (a b &optional c d) 
    "In this function c and d are optional parameters."
    (list a b c d))

(defun default-values (a &optional (b 10))
    "If b is not passed - it equals to 10"
    (list a b))

(defun make-rectangle (width &optional (height width))
    "If height is not passed - we are making square (width = height)"
    (list :width width :height height))

(defun foo (a b &optional (c 3 c-supplied-p))
    "c-supplied-p returns T if c is passed and NIL otherwise"
    (list a b c c-supplied-p))

(defun listify (&rest numbers) 
    "Get all the parameters as a list"
    numbers)

(defun named (&key a b c)
    "Get all the parameters from 'associative list' (named :a 1 :b 2 :c 3) => (1 2 3)"
    (list a b c))

(defun default-named (&key (a 0) (b 0 b-supplied-p) (c (+ a b)))
    "Same as with optional, b-supplied-p is T if b is passed and NIL otherwise"
    (list a b c b-supplied-p))

(defun different-user-and-impl-names (&key ((:apple a)) ((:box b)) ((:charlie c) 0 c-supplied-p))
    "Combination of all above plus different names for user-side and implementation-side"
    (list a b c c-supplied-p))

(defun mix-opt-key (x &optional y &key z)
    "Bad practice"
    (list x y z))

(defun ret (n)
    "return as soon as finds pair"
    (dotimes (i 10)
        (dotimes (j 10)
            (when (> (* i j) n)
                  (return-from ret (list i j))))))

(defun plot (fn min max step)
    "HOF, (plot #'exp 0 4 1/2)"
    (loop for i from min to max by step do
              (loop repeat (funcall fn i) do (format t "*"))
              (format t "~%")))

(defun plot-from-list (plot-data)
    (apply #'plot plot-data))

(defun plot-doubled-values () (plot #'(lambda (x) (* 2 x)) 0 10 1))