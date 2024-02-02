(defmacro when1 (condition &rest body)
    `(if ,condition (progn ,@body)))

(defmacro unless1 (condition &rest body)
    `(if (not ,condition) (progn ,@body)))

(defun print-list (list)
    (dolist (x list) (print x)))

(defun print-range (n)
    (dotimes (x n) (print x)))

(defun print-range1 (n)
    "do (*vars-definition) (*test-for-end *end-form) *body
    where var definition -> *var *init *each-step"
    (do ((i 0 (1+ i))) ((>= i n)) (print i)))

(defun print-two (a b)
    (print a)
    (print b))

(defun print-ranges (n)
    "here we have two stepper-variables i and j"
    (do ((i 0 (1+ i)) (j n (1- j))) ((>= i n)) (print-two i j)))

(defun gen-range (n)
    "nums is empty list, i is counter. While i <= n - push it to nums, then return nums"
    (do ((nums nil) (i 1 (1+ i)))
            ((> i n) (nreverse nums))
        (push i nums))
    )

(defun gen-range1 (n)
    "for i from 1 to n - push it to 'nums' and return 'nums'"
    (loop for i from 1 to n collecting i))

(defun fib (n)
    (loop for i below n
              and a = 0 then b
              and b = 1 then (+ b a)
              finally (return a)))