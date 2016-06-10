#include<stdio.h>

int result=0;

int main(){

int i=0;
//printf("result address: %d", &result);
for (i=0; i<10; i++)
{
	result = result + 2;
//	printf("\n%d i: %d",result, &i);
}
printf("result: %d", result);
}
