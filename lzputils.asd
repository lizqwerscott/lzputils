(defsystem "lzputils"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("jonathan" "yason" "str")
  :components ((:module "src"
                :components
                ((:file "json")
                 (:file "used")
                 (:file "string")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "lzputils/tests"))))

(defsystem "lzputils/tests"
  :author ""
  :license ""
  :depends-on ("lzputils"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for lzputils"
  :perform (test-op (op c) (symbol-call :rove :run c)))
