;;;; carrot.asd

(asdf:defsystem #:carrot
  :description "Carrot scrapes RabbitMQ stats and sends them to Statsd"
  :author "Łukasz Korecki <lukasz@nomnom.it>"
  :license "GPL"
  :depends-on (#:drakma
               #:cl-statsd
               #:cl-json)
  :serial t
  :components ((:file "package")
               (:file "get-env")
               (:file "metrics")
               (:file "carrot")))
