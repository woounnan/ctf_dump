#include <stdio.h>
#include <unistd.h>
int size = 0x200;
int main()
{	
	char overwrite_me[256];
	char buf[256];
	FILE *fp;
	fp = fopen("testfile","r");
	
	fp->_IO_buf_base = (char*)&size;
	fp->_IO_buf_end = (char*)&size + 8;
	fp->_fileno = 0;
	
	read(buf, 5, fp);
	printf("size: %x\n",size);
	return 0;
}
