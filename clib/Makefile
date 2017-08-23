libtest.a: test.o
	ar rsc libtest.a test.o

test.o: test.c
	gcc -c test.c -o test.o

clean:
	rm test.o libtest.a
