(defun sqsum (x) #'(lambda (y) (+ (* x x) (* y y)))
	)
(format t "~a~%" (apply (sqsum 5) '(2)))
