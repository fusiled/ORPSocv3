#include <stdio.h>

int x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10;

int main(int argc, char const *argv[])
{
	x0=1;
	x1=2;
	x2=3;
	x3=4;
	x5=x1+x2;
	x6=x3+x4;
	x7=x5+x6;
	x8=x6+x1;
	x9=x5+x7;
	x10=x9+x2;
	printf("x10: %d\n",x10);
	fflush(stdout);
	return 0;
}
