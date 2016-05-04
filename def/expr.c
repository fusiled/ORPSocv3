
#define ARRAYSIZE 10


#include <stdio.h>

int a=54;

int main(){
	int i=0;
	int array[ARRAYSIZE];
	for (i=0; i< ARRAYSIZE; i++){
		printf("step %d\n", i);
		array[i%ARRAYSIZE]=array[i%ARRAYSIZE]+i*(3-i);
	}
}
