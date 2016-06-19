#include <stdio.h>

int x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13;

int main(int argc, char const *argv[])
{
	x0=1;
	x1=2;
	x2=x1+x2;
	x2=x2+1;
	x3=5;
	x4=x3+x2;
	x5=x5+4;
	x6=13;
	x7=x0+x1+x2;
	x8=x5+x7;
	x9=7+x6;
	x10=255;
	x11=512;
	x12=x11+x10;
	x13=x12;
	printf("x3: %d\n",x3);
	return 0;
}