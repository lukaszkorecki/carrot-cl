;;;; carrot.lisp

(in-package #:carrot)

;; helper to get env vars
(defun get-env (key &key or-use)
  (or
   (sb-unix::posix-getenv key)
   or-use))

(defvar *statsd-host* (get-env "STATSD_HOST" :or-use "127.0.0.1"))
(defvar *statsd-port* (get-env "STATSD_PORT" :or-use 8111))
(defvar *statsd-client*
  (statsd:make-sync-client :host *statsd-host*
                           :port *statsd-port*))

(defun send-metrics (metrics)
  (dolist (m metrics)

    (let ((key (car m))
          (value (cdr m)))
      (format t ">> ~a -> ~a" key value)
      (print (statsd:guage key value :client *statsd-client*)))))

(send-metrics '(  '( "A VERY DISTINCT METRIC NAME" . 1) ))

(statsd:guage "foo" 1)
