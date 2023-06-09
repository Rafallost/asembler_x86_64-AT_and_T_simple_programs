#include <stdio.h>
#include <x86intrin.h>

int main()
{

	float arr[] = { 25,4,16,64,100,81 }; //will only fetch the first four numbers, I gave more to show it
	int size = sizeof(arr) / sizeof(float);

	__m128 regf = _mm_load_ps(arr);
	regf = _mm_sqrt_ps(regf);
	_mm_store_ps(arr, regf);

	for (int i = 0; i < size; i++)
		printf("%lf\n", arr[i]);

	puts("");

	double a = 2.2, b = 5.5;

	__m128d regd = _mm_set_pd(a, b);
	__m128d muld = _mm_set1_pd(4.0); //4.0 in bouth parts

	regd = _mm_mul_pd(regd, muld);

	double arr2[2];

	_mm_store_pd(arr2, regd);

	int size2 = sizeof(arr2) / sizeof(double);

	for (int i = 0; i < size2; i++)
		printf("%lf\n", arr2[i]);

	return 0;
}