(in-package #:carrot)

(defvar *rabbit-host* (get-env  "RABBIT_HOST" :or-use "localhost"))
(defvar *rabbit-port* (get-env "RABBIT_PORT" :or-use 15672))
(defvar *rabbit-user* (get-env "RABBIT_USER" :or-use "rabbit"))
(defvar *rabbit-pass* (get-env "RABBIT_PASS" :or-use "p4ssw0rd"))

(defvar rabbit-url-root
  (format "http://~a:~a" *rabbit-host* *rabbit-port*))

(defun api-request (path)
  (drakma:http-request (format "~a~a" rabbit-url-root path)
                       :basic-authorization '(*rabbit-user*
                                              *rabbit-password*)))
