CFLAG=-std=c11 -g -static
CC=gcc

rvcc: rvcc.c
	$(CC) -o rvcc $(CFLAGS) rvcc.c

test: rvcc
	bash -x ./test.sh

clean:
	rm -f rvcc *.o *~ tmp*

.PHONY: test clean
