#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 3355
int a[MAX][MAX], b[MAX][MAX], c[MAX][MAX];

int main(int argc, char **argv)
{
  unsigned i, j, k;
  struct timespec cgt1,cgt2; double ncgt;

  if(argc < 2){
    fprintf(stderr, "./pmm-secuencial [TAM]\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  if(N>MAX){
    N=MAX;
  }

  // Inicializamos las matrices
  for (i=0; i<N; i++){
    for (j=0; j<N; j++){
      a[i][j] = 0;
      b[i][j] = 2;
      c[i][j] = 2;
    }
  }

  clock_gettime(CLOCK_REALTIME,&cgt1);

  // Multiplicacion
  for (i=0; i<N; i++)
    for (k=0; k<N; k++)
      for (j=0; j<N; j++)
        a[i][j] += b[i][k] * c[k][j];

  clock_gettime(CLOCK_REALTIME,&cgt2);

  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  if(N<10){
    //Pintamos la matriz
    printf("Matriz b:\n");
    for(i=0; i<N; i++){
      for(j=0; j<N; j++){
        printf("%d ", b[i][j]);
      }
      printf("\n");
    }

    printf("Matriz c:\n");
    for(i=0; i<N; i++){
      for(j=0; j<N; j++){
        printf("%d ", c[i][j]);
      }
      printf("\n");
    }

    //Pintamos la matriz solucion
    printf("Matriz a:\n");
    for(i=0; i<N; i++){
      for(j=0; j<N; j++){
        printf("%d ", a[i][j]);
      }
      printf("\n");
    }
  }

  // Pitamos la primera y la ultima linea de la matriz resultante
  printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",ncgt,a[0][0],a[N-1][N-1]);

  return 0;
}
