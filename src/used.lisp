(defpackage lzputils.used
  (:import-from :uiop :run-program)
  (:use :cl)
  (:export
   ;;; OS
   :run-shell

   :get-directory
   :directoryp
   :make-next-dir
   :list-directory

   ;;; Code
   :if-return
   :last1
   :append1
   :symbol-to-lower-string

   :hash-print
   ))
(in-package :lzputils.used)

;; OS
(defun run-shell (program)
  (run-program program))

(defun get-directory (file)
  (make-pathname :directory (pathname-directory file)))

(defun directoryp (dir)
  (equal dir (get-directory dir)))

(defun make-next-dir (dir-lst path)
  "get the path/dir/"
  (when (directoryp path)
    (merge-pathnames (make-pathname
                      :directory (append (list :relative)
                                         (if (stringp dir-lst)
                                             (list dir-lst)
                                             dir-lst)))
                     path)))

(defun list-directory (dir)
  (directory (make-pathname :name :wild :type :wild :defaults dir)))

;; Code
(defmacro if-return (body &body (then-body))
  (let ((g (gensym)))
    `(let ((,g ,body))
       (if ,g
         ,g
         ,then-body))))

(defun last1 (lst)
  (car (last lst)))

(defun append1 (lst item)
  (append lst
          (list item)))

(defun symbol-to-lower-string (s)
  (format nil "~(~A~)" s))

(defun hash-print (hash-table)
  (maphash #'(lambda (k v)
               (format t "~A: ~A~%" k v))
           hash-table))

(in-package :cl-user)
