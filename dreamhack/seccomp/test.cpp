#include <stdio.h>
#include <sys/prctl.h>
#include <linux/seccomp.h>


int main()
{
	printf("%d\n", SECCOMP_MODE_STRICT);
}
