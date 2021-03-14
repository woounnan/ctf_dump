// gcc -o fastbin_dup1 fastbin_dup1.c
#include <stdlib.h>
#include <stdio.h>
int main()
{
	long *ptr1, *ptr2;
	ptr1 = malloc(0x50);
	ptr2 = malloc(0x80);
	malloc(0x50);
	free(ptr2);
	return 0;
}
