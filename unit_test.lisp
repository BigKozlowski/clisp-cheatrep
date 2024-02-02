; (defun test-+ ()
;     (and
;      (= (+ 1 2) 3)
;      (= (+ 1 2 3) 6)
;      (= (+ -1 -3) -4)))

; (defun test-+ ()
;     "~:[FAIL~;pass~] prints FAIL if arg is false and pass if true"
;     (check 
;         (= (+ 1 2) 3) 
;         (= (+ 1 2 3) 6) 
;         (= (+ -1 -3) -4)))

; (defun test-* ()
;     (check 
;         (= (* 2 2) 4)
;         (= (* 3 5) 15)))

(defvar *test-name* nil)

(deftest test-* ()
    (check 
        (= (* 2 2) 4)
        (= (* 3 5) 15)))

(deftest test-+ ()
    (check 
        (= (+ 1 2) 3) 
        (= (+ 1 2 3) 6) 
        (= (+ -1 -3) -4)))

(deftest test-arithmetic ()
    (combine-results
     (test-+)
     (test-*)))

(deftest test-math ()
    (test-arithmetic))

(defun report-result (result form)
    (format t "~:[FAIL~;pass~] ... ~a: ~a~%" result *test-name* form)
    result)

; (defmacro check (form)
;     `(report-result ,form ',form))

(defmacro check (&body forms)
    `(combine-results
      ,@(loop for f in forms collect `(report-result ,f ',f))))

(defmacro with-gensyms ((&rest names) &body body)
    `(let ,(loop for n in names collect `(,n (gensym)))
         ,@body))

(defmacro combine-results (&body forms)
    (with-gensyms (result)
                  `(let ((,result t))
                       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
                       ,result)))

(defmacro deftest (name parameters &body body)
    `(defun ,name ,parameters
         (let ((*test-name* (append *test-name* (list ',name))))
             ,@body)))