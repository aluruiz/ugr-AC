#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
  #define omp_set_num_threads(omp_get_num_procs())
  #define omp_in_parallel() 0
  #define omp_set_dynamic(int)
#endif

int main(int argc, char **argv)
{
  unsigned i, j, k;
  double t1, t2, final;

  if(argc < 2){
    fprintf(stderr, "./pmm-secuencial [TAM]\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  int **a, **b, **c;
  a = (int **) malloc(N*sizeof(int*));
  b = (int **) malloc(N*sizeof(int*));
  c = (int **) malloc(N*sizeof(int*));
  for (i=0; i<N; i++){
    a[i] = (int *) malloc(N*sizeof(int));
    b[i] = (int *) malloc(N*sizeof(int));
    c[i] = (int *) malloc(N*sizeof(int));
  }


// Inicializamos las matrices
  #pragma omp parallel for private(j)
    for (i=0; i<N; i++){
      for (j=0; j<N; j++){
        a[i][j] = 0;
        b[i][j] = 2;
        c[i][j] = 2;
      }
    }
    t1 = omp_get_wtime();

    // Multiplicacion
  #pragma omp parallel for private(k,j)
    for (i=0; i<N; i++)
      for (j=0; j<N; j++)
        for (k=0; k<N; k++)
          a[i][j] += b[i][k] * c[k][j];

    t2 = omp_get_wtime();
  final = t2 - t1;

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
  printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",final,a[0][0],a[N-1][N-1]);

  // Liberamos la memoria
  for (i=0; i<N; i++)
  {
    free(a[i]);
    free(b[i]);
    free(c[i]);
  }
  free(a);
  free(b);
  free(c);

  return 0;
}
