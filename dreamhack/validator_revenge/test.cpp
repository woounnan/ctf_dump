#include <stdio.h>
#include <stdlib.h>

int main()
{
	malloc(0x20);
	puts("test");
	fflush(stdout);
	getchar();
}
