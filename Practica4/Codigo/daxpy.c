#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

  int *y, *x;
  int i;
  struct timespec cgt1,cgt2;
  double ncgt;

  if (argc < 3) {
    fprintf(stderr, "ERROR: falta tam del vector y constante\n");
    exit(1);
  }

  unsigned n = strtol(argv[1], NULL, 10);
  int a = strtol(argv[2], NULL, 10);

  y = (int*) malloc(n*sizeof(int));
  x = (int*) malloc(n*sizeof(int));

  for (i=0; i<n; i++){
    y[i] = i+2;
    x[i] = i*2;
  }

  clock_gettime(CLOCK_REALTIME,&cgt1);

  for (i=0; i<n; i++)
    y[i] += a*x[i];

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTiempo (seg.) = %11.9f\t", ncgt);
  printf("y[0] = %i, y[%i] = %i\n", y[0], n-1, y[n-1]);

  free(y);
  free(x);

  return 0;
}
