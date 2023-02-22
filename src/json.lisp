(defpackage lzputils.json
  (:import-from :jonathan :to-json)
  (:use :cl :yason)
  (:export
   ;;; Json
   :assoc-s
   :assoc-value
   :assoc-value-l

   :parse
   :to-json-a
   :load-json-file
   :save-json-file

   :bits-to-json
   ))
(in-package :lzputils.json)

;; Json
(setf yason:*parse-object-as* :alist)

(defun assoc-s (plist key)
  (assoc key plist :test #'string=))

(defun assoc-value (plist keys)
  (if (listp keys)
      (if keys
          (assoc-value (cdr
                        (assoc (car keys) plist :test #'string=))
                       (cdr keys))
          plist)
      (cdr (assoc keys plist :test #'string=))))

(defun assoc-value-l (plist keys)
  (when (listp keys)
    (mapcar #'(lambda (key)
                (assoc-value plist key))
            keys)))

(defun to-json-a (alist)
  (to-json alist :from :alist))

(defun load-json-file (path)
  (with-open-file (in path :direction :input :if-does-not-exist :error)
    (multiple-value-bind (s) (make-string (file-length in))
      (read-sequence s in)
      (parse s))))

(defun save-json-file (path json)
  (with-open-file (out path
                       :direction :output
                       :if-exists :overwrite
                       :if-does-not-exist :create)
    (write-sequence json out)))

(defun bits-to-json (bits)
  (parse (babel:octets-to-string bits)))

(in-package :cl-user)
