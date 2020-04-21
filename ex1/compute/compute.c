int compute(int *A, int *B, int n) {
	int i;
	int S;

	if (n>0) {
		S = 0;

		for (i=0; i<n; i++)
			S += A[i]*B[i];

		return S;
	}
	else
		return 0;
}//end of function compute
