#include<stdio.h>

int main(){

	setvbuf(stdout, NULL, 2, 0);
	//printf("flag: %x\n", stdout->_flags);
	stdout->_flags = 0xfbad0000 | 0x1000 | 0x800;
	//printf("flag: %x\n", stdout->_flags);
	stdout->_IO_write_base -= 100;
	//printf("wp: %x\n", stdout->_IO_write_ptr);

	puts("hi");

	getchar();
	return 0;
}
