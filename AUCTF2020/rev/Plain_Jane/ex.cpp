#include <stdio.h>

int main ()
{

    unsigned long long a = 0x0ab0000000234432;
    unsigned long long b = 0x0000000000000001;
    unsigned long long c = 0x0000000032123001;
    unsigned long long r1;
    int i = 0;

    __asm__ __volatile__(
/*
        "mov    %1, %%rax   \n\t"
        "xor    %2, %%rax   \n\t"
        "xor    %3, %%rax   "
        : "=&a" (r1)
        : "g" (a), "g" (b), "g"(c)
*/);


    for(i=63; i>=0; i--){

        printf("%d", (int)(r1 >> i) & 1 );

        if(i%8 == 0 ) printf(" ");
    }

    printf("\n");

    return 0;
}
