#include <stdio.h> 

#include <stdlib.h> 

#include <time.h> 
#include <unistd.h>
#include <string.h>

  


int main(void) 
{ 
	FILE *fp ; 

      



  

    // Open the existing file GfgTest.c using fopen() 

    // in write mode using "w" attribute 

    fp = fopen("keys", "w") ; 
int sd = time(0);
printf("generat a key file using a seed value of [%d]\n", sd);
    srand(sd); 

    for(int i = 0; i<100; i++) 
	fprintf(fp, "%d;", rand()%100000 + 1);
fprintf(fp, "\n");
	printf("successful generate a key file\n");
    return 0; 

} 
