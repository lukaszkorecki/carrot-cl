.PHONY: start

index_path=$(HOME)/quicklisp/local-projects/system-index.txt

_pwd := $(shell pwd)
asd_path := "$(_pwd)/carrot.asd"

init-system:
	echo $(asd_path) >> $(index_path)

start:
	sbcl --eavl '(ql:quickload "carrot")'
