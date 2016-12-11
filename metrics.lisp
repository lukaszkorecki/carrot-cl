(in-package #:carrot)

(defvar *statsd-host* (get-env "STATSD_HOST" :or-use "127.0.0.1"))
(defvar *statsd-port* (get-env "STATSD_PORT" :or-use 8111))
(defvar *statsd-client*
  (statsd:make-sync-client :host *statsd-host*
                           :port *statsd-port*))

(defun send-metrics (metrics)
  (let ((statsd::*client* *statsd-client*))
    (dolist (m metrics)

      (let ((key (car m))
            (value (cdr m)))
        (format t ">> ~a -> ~a" key value)
        (print (statsd:guage key value))))))
