.PHONY: start

start:
	sbcl --eavl '(asdf:load-system :carrot)'
