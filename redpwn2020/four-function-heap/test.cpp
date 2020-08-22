#include <stdio.h>
#include <stdlib.h>

int main(){
	void* ptr[8] ={0,};

	/*
	for(int i = 0; i < 8; i++){
		ptr[i] = malloc(0x100);
	}

	getchar();

	for(int i = 0; i < 8; i++){
		free(ptr[i]);
	}
	*/
	ptr[0] = malloc(0x20);
	free(ptr[0]);
	free(ptr[0]);

}
