#include <stdlib.h>
#include <stdint.h>
int main()
{
	uint64_t *ptr = malloc(0x20);
	free(ptr);
	ptr[0] = 0x00007ffff7dcf000;
	uint64_t *ptr2 = malloc(0x20);
	uint64_t *ptr3 = malloc(0x20);
}
