;;;; carrot.asd

(asdf:defsystem #:carrot-cl
  :description "Pulls out RabbitMQ stats and hands them off to Statsd"
  :author "Łukasz Korecki <lukasz@nomnom.it>"
  :license "AGPL"
  :depends-on (#:drakma
               #:cl-statsd
               #:cl-json)
  :serial t
  :components ((:file "package")
               (:file "carrot-cl")
               (:file "metrics")))
