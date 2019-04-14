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

int main(int argc, char **argv){
  int i, j;
  double t1, t2, final;

  //Leer argumentos de entrada.
  if(argc < 2){
    fprintf(stderr, "Falta size\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  //Inicializamos la matriz triangular.
  int *vector, *resultado, **matriz;
  vector = (int *) malloc(N*sizeof(int));
  resultado = (int *) malloc(N*sizeof(int));
  matriz = (int **) malloc(N*sizeof(int *));
  for(i = 0; i<N; i++){
    matriz[i]=(int *) malloc(N*sizeof(int));
  }

  //Añadimos valores a la matriz
  for(i=0; i<N; i++){
    for(j=i; j<N; j++){
      matriz[i][j]=2;
      vector[i]=6;
      resultado[i]=0;
    }
  }

  if(N<20){
    //Pintamos la matriz
    printf("Matriz:\n");
    for(i=0; i<N; i++){
      for(j=0; j<N; j++){
        if(j >= i){
          printf("%d ", matriz[i][j]);
        }
        else{
          printf("0 ");
        }
      }
      printf("\n");
    }

    //Pintamos el vector
    printf("Vector:\n");
    for (i=0; i<N; i++){
      printf("%d ", vector[i]);
    }
    printf("\n");
  }

  #pragma omp parallel
  {
    #pragma omp single
    t1 = omp_get_wtime();

    // Obtenemos los resultados
    #pragma omp for private(j) schedule(runtime)
    for (i=0; i<N; i++)
      for (j=i; j<N; j++)
        resultado[i] += matriz[i][j] * vector[j];

    #pragma omp single
    t2 = omp_get_wtime();
  }

  final = t2 - t1;

  if(N<20){
    // Pintamos los resultados
    printf("Resultado:\n");
    for (i=0; i<N; i++)
      printf("%d ", resultado[i]);
    printf("\n");
  }

  printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n", final, resultado[0], resultado[N-1]);

  // Liberamos la memoria
  for (i=0; i<N; i++)
    free(matriz[i]);
  free(matriz);
  free(vector);
  free(resultado);
return 0;
}
