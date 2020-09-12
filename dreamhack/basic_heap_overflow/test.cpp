#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
	char *p = malloc(0x8);
	char *p2 = malloc(0x20);
	memset(p, 'a', 8);
	memset(p2, 'b', 0x20);
	free(p);
	getchar();
}
