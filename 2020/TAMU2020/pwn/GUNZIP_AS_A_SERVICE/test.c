#include <stdio.h>

void main(){
FILE* fp = 0;
int len = 0;
fp = fopen("test123.txt", "w");
	fprintf(fp, "%2147483647x%n", &len);
printf("len: \n", len);
fclose(fp);
}
