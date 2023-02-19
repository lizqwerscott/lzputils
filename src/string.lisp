(defpackage lzputils.string
  (:use :cl :str)
  (:export
   :include-words?
   :start-with-words?))
(in-package :lzputils.string)

(defun include-words? (text keywords &optional res)
  (if keywords
      (include-words? text
                      (cdr keywords)
                      (or res
                         (contains? (car keywords)
                                    text)))
      res))

(defun start-with-words? (text keywords &optional res)
  (if keywords
      (start-with-words? text
                         (cdr keywords)
                         (or res
                            (starts-with? (car keywords)
                                          text)))
      res))

(in-package :cl-user)
