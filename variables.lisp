(defun add-1-2 ()
    "Local variable x and y (let (variables list) body-form)"
    (let ((x 1) (y 2)) (+ x y)))

(defun shadowing (x)
    "variables shadowing example"
    (format t "Parameter: ~a~%" x)
    (let ((x 2))
        (format t "Outer LET: ~a~%" x)
        (let ((x 3))
            (format t "Inner LET: ~a~%" x))
        (format t "Outer LET: ~a~%" x))
    (format t "Parameter: ~a~%" x))

(defun loops ()
    "Dotimes binds x as loop counter and cycles it from 0 to 9 inclusively"
    (dotimes (x 10) (format t "~d " x)))

(defun different-lets ()
    "let does not allow to use vars defined earlier in same let, but let* allows"
    (let ((x 10)
            (y (+ x 10)))
        (list x y))
    (let* ((x 10)
            (y (+ x 10)))
        (list x y)))

;;;; defvar does not change value if used again (defvar a 1) (defvar a 2) => a = 1
(defvar *fn* (let ((count 0)) #'(lambda () (setf count (1+ count)))))
;;;; On the other hand defparameter allows to redefine variable (defparameter a 1) (defparameter a 2) => a = 2
(defparameter *fn1* (let ((count 0)) #'(lambda () (setf count (1+ count)))))

