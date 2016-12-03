(load "dependencies")

(defvar statsd::*client* (statsd:make-sync-client))

(defvar queue-root "amqp_queues")
(defvar stat-root "amqp_stats")

(defstruct metric key value)

(defun send-metrics (metrics)
  (dolist (m metrics)

    (let ((key (metric-key m))
          (value (metric-value m)))


      (format t ">> ~a -> ~a" key value)
      (statsd:guage key value))))


(send-metrics '( (make-metric :key "foo.test"  :value 12)
                 (make-metric :key "foo.bar"  :value 20)
                 ))
