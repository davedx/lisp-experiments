(defvar *db* nil)
(defun hello-dave () (format t "Hello, Dave. Here are your CDs:~%"))
(defun make-cd (title artist rating ripped)
	(list :title title :artist artist :rating rating :ripped ripped))
(defun print-cd (cd) (format t (getf cd :title)))
(defun add-record (cd) (push cd *db*))
(defun prompt-read (prompt)
	(format *query-io* "~a: " prompt)
	(force-output *query-io*)
	(read-line *query-io*))
(defun prompt-for-cd ()
	(make-cd
		(prompt-read "Title")
		(prompt-read "Artist")
		(or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
		(y-or-n-p "Ripped [y/n]: ")))
(defun add-cds ()
	(loop (add-record (prompt-for-cd))
		(if (not (y-or-n-p "Another? [y/n]: ")) (return))))
(defun dump-db ()
	(dolist (cd *db*)
		(format t "~{~a:~10t~a~%~}~%" cd)))

(add-record (make-cd "Appetite For Destruction" "Guns n Roses" 7 t))
(add-record (make-cd "Use Your Illusion 1" "Guns n Roses" 7 t))
(add-record (make-cd "Use Your Illusion 2" "Guns n Roses" 8 t))
(add-record (make-cd "Smells Like Teen Spirit" "Nirvana" 8 t))
(add-cds)
(hello-dave)
(dump-db)
