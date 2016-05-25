#include<stdio.h>

int result=0;

int main(){

int i=0;

for (i=0; i<10; i++)
{
	result = result + 2;
	if (i==5) {
		int j=0;
		for (j=0; j<1000; j++){}
	}
}
printf("result: %d", result);
}
