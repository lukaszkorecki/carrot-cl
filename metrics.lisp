(in-package #:carrot)

(defvar *statsd-host* (get-env "STATSD_HOST" :or-use "127.0.0.1"))
(defvar *statsd-port* (get-env "STATSD_PORT" :or-use 8111))
(defvar *statsd-client*
  (statsd:make-sync-client :host *statsd-host*
                           :port *statsd-port*))

(defun send-metric (metric-type metric)
  (let* ((value (cdr metric))
         (key (car metric)))
    (format t ">> ~a | ~a -> ~a~%" metric-type key value)
    (cond
      ((eq :gauge metric-type) (statsd:guage key value))
      ((eq :counter metric-type) (statsd:counter key value)))))

(defun send-metrics (metric-type metrics)
  (let ((statsd::*client* *statsd-client*))
    (dolist (m metrics)
      (send-metric metric-type m))))
