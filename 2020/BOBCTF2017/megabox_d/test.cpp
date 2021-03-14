#include <linux/seccomp.h>
#include <linux/seccomp.h>
#include <linux/filter.h>
#include <linux/audit.h>
#include <sys/ptrace.h>
#include <linux/signal.h>


int main()
{
	seccomp(SECCOMP_SET_MODE_STRICT, ss, 0);

}
	
