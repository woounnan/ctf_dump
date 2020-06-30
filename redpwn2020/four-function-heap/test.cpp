#include <stdio.h>
#include <stdlib.h>

int main(){
	void* ptr[8] ={0,};

	for(int i = 0; i < 8; i++){
		ptr[i] = malloc(0x100);
	}

	getchar();

	for(int i = 0; i < 8; i++){
		free(ptr[i]);
	}

}
