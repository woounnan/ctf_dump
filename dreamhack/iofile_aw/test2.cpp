#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
	char *data = malloc(100);
	char *buf = "THIS IS TEST FILE!\0";
	FILE *fp;
	
	setvbuf(stdout, NULL, 2, 0);
	strcpy(data, "MEMORY LEAK SUCCESS!");
	fp = fopen("testfile","w"); 
	fp->_flags |= 0x800;        // condition _IO_IS_APPENDING
	//fp->_IO_write_base = data;
	fp->_IO_write_base = fp->_IO_write_base - 0x10;
	fp->_IO_write_ptr = data + strlen(data);
	fp->_IO_read_end = fp->_IO_write_base; // condition
	fp->_fileno = 1;                       // stdout
	fwrite(buf, 1, 1, fp);
	return 0;
}
