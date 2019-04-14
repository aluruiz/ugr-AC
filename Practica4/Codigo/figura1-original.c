#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct {
	int a;
	int b;
} S[5000];

int R[40000];

int main(){
	struct timespec cgt1,cgt2;
  double ncgt;
	int ii, i, X1, X2;

	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (ii = 0; ii < 40000; ++ii)
	{
		X1=0, X2=0;
		for (i = 0; i < 5000; ++i)
			X1 += 2 * S[i].a + ii;

 		for (i = 0; i < 5000; ++i)
			X2 += 3 * S[i].b - ii;

		if (X1 < X2)
			R[ii] = X1;
		else
			R[ii] = X2;
	}
	//Calculo del tiempo
  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  //Imprimir resultado de la suma y el tiempo de ejecución
  printf("Tiempo(seg.):%11.9f\t",ncgt);
	printf("R[0] = %i, R[3999] = %i\n", R[0], R[3999]);

	return 0;
}
