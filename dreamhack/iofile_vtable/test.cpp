#include <stdio.h>
#include <unistd.h>

int main()
{
	char buf[256]={0};
	read(0, buf, 256);
	printf("%s\n", buf);
}
