#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void getString(char* p_str)
{
  unsigned int result; // eax@5
  unsigned int i; // [sp+8h] [bp-Ch]@1
  int idx; // [sp+Ch] [bp-8h]@1
  char blah[]="APRMXCSBCEDISBVXISXWERJRWSZARSQ";

  idx = 0;
  for ( i = 0; ; ++i )
  {
    result = i;
    if ( i > 0x1F )
      break;
    if ( !(i & 1) ){
	    printf("i:%c\n", blah[i]);
      *(15 - idx++ + p_str) = blah[i];
    }
  }
  puts(p_str);
}

void enc(char *input, int num17, int num12){
 int len = strlen(input);
  char* dst =(char*) calloc(len, 1u);
  int i = 0;
  for ( i = 0; strlen(input) > i; ++i )
  {
    if ( input[i] == 32 )
      dst[i] = input[i];
    else
      dst[i] = (num17 * (input[i] - 65) + num12) % 26 + 65;
  }
  //puts(dst);	
}

int main(){

	char blah[]="APRMXCSBCEDISBVXISXWERJRWSZARSQ";
	char ans[]="ifhqdsngtcvycnfe";
	enc(ans, 17, 12);
	char* p_str =(char*)calloc(0x20u, 4u);
	getString(p_str);
	return 1;
}
