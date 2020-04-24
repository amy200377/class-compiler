#include <stdio.h>

int F (int n)
{
	if (n==0)
		return 1;
	else if (n==1)
		return 2;
	else
		return F(n-1)+F(n-2);
}

int
main ()
{
	int n;
	int x;

	n = 10;
	x = F(n);

	printf ("F(%d)=%d\n", n, x);

	return 0;
}//end of function main




