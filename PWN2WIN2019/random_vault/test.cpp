#include <stdio.h>

int main(){
	int a, b, c;
	printf("1234%n5678%n9abc%n\n", &a, &b, &c);
	printf("%d\n%d\n%d\n", a, b, c);
}
