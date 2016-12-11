;;;; carrot.lisp

(in-package #:carrot)

(send-metrics :counter '(  ( "some.cntr" . 1) ))
(send-metrics :gauge '(  ( "some.gauge" . 1) ))
