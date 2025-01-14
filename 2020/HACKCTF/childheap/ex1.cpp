// gcc -o fastbin_dup2 fastbin_dup2.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
char name[16];
int overwrite_me;
int main()
{
	int ch, idx;
	int i = 0;
	char *ptr[10];
	setvbuf(stdout, 0, 2, 0);
	setvbuf(stdin, 0, 2, 0);
	printf("Name : ");
	read(0, name, 16);
	while (1) {
		printf("> ");
		scanf("%d", &ch);
		switch(ch) {
			case 1: 
				if( i >= 10 ) {
					printf("Do not overflow\n");
					exit(0);
				} 
				ptr[i] = malloc(32);
				printf("Allocated Address : %x\n", ptr[i]);
				printf("Data: ");
				read(0, ptr[i], 32-1);
				i++;
				break;
			case 2:
				printf("idx: ");
				scanf("%d", &idx);
				free(ptr[idx]);
				break;
			case 3:
				printf("overwrite_me : %x\n", overwrite_me);
				if( overwrite_me == 0xDEADBEEF ) {
					system("/bin/sh");
				}
				break;
			default:
				break;
		}
	}
	return 0;
}
