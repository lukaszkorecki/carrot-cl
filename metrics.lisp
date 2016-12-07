(in-package #:carrot-cl)

(defvar statsd::*client* (statsd:make-sync-client))

(defstruct metric key value)

(defun send-metrics (metrics)
  (dolist (m metrics)

    (let ((key (metric-key m))
          (value (metric-value m)))


      (format t ">> ~a -> ~a" key value)
      (statsd:guage key value))))
