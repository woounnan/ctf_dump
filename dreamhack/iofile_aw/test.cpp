#include<stdio.h>

int main(){

//setvbuf(stdout, NULL, 2, 0);
	stdout->_flags = 0xfbad0000 | 0x1000 | 0x800;
	stdout->_IO_write_base -= 100;

	puts("hi");

	return 0;
}
