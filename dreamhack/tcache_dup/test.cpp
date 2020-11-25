#include <stdio.h>
#include <stdlib.h>
int main()
{
	char *ptr = malloc(0x20);
	free(ptr);
	free(ptr);
    
    fprintf(stderr, "malloc: %p\n", malloc(0x20));
    fprintf(stderr, "malloc: %p\n", malloc(0x20));
	return 0;
}

