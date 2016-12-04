(in-package #:carrot)


(defvar queue-root "amqp_queues")
(defvar stat-root "amqp_stats")


(send-metrics '( (make-metric :key "foo.test"  :value 12)
                 (make-metric :key "foo.bar"  :value 20)
                 ))
