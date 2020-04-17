#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>


char shellcode[] = "\x31\xc0\x50\x68\x2f\x2f\x73"
                   "\x68\x68\x2f\x62\x69\x6e\x89"
                   "\xe3\x89\xc1\x89\xc2\xb0\x0b"
                   "\xcd\x80\x31\xc0\x40\xcd\x80";

int main()
{
	int pagesize = sysconf(_SC_PAGE_SIZE);
	char* addr_align = (char*)((unsigned long long)shellcode & ~(pagesize-1));

	if (mprotect(addr_align, 4096, PROT_READ | PROT_EXEC | PROT_WRITE) == -1)
       	printf("mprotect");
	  (*(void  (*)()) shellcode)();


}
