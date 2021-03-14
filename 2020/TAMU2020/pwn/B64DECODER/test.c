#include <stdio.h>

void main(){

int a= 0xffffbbbb;

void* vp = (int)&a;

printf("%43690x%hn\n", vp, vp);
printf("%x\n", a);




}
