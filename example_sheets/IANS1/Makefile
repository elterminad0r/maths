.PHONY: run

# because we need the special shell construct `time`
SHELL = bash

CCFLAGS = -Wall -pedantic -ansi -O3
CC = gcc

HASK_CCFLAGS = -O2 -dynamic -Wall
HASK_CC = ghc

# change pypy3 to python3 if you don't have PyPY
run: bin/repeats bin/c_repeats
	time bin/c_repeats 16
	time bin/repeats 15
	pypy3 repeats.py 14

bin/c_repeats: repeats.c
	$(CC) $(CCFLAGS) $< -o $@

bin/repeats: repeats.hs bin
	$(HASK_CC) $(HASK_CCFLAGS) $< -outputdir bin -o $@

bin:
	mkdir -p bin
