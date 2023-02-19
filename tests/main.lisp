(defpackage lzputils/tests/main
  (:use :cl
        :lzputils
        :rove))
(in-package :lzputils/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :lzputils)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
