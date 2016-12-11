(in-package #:carrot)

;; helper to get env vars
(defun get-env (key &key or-use)
  (or
   (sb-unix::posix-getenv key)
   or-use))
