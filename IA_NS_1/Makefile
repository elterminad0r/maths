.PHONY: run

# because we need the special shell construct `time`
SHELL = bash

CCFLAGS = -O2 -dynamic -Wall
CC = ghc

# change pypy3 to python3 if you don't have PyPY
run: bin/repeats
	time $< 16
	pypy3 repeats.py 16

bin/repeats: repeats.hs bin
	$(CC) $(CCFLAGS) $< -outputdir bin -o $@

bin:
	mkdir -p bin
