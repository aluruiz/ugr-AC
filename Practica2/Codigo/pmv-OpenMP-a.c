#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

//#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
			                     // globales (su longitud no estará limitada por el ...
			                     // tamaño de la pila del programa)
#define VECTOR_DYNAMIC	// descomentar para que los vectores sean variables ...
						                   // dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
#define MAX 8192	  //=2^13
double V1[MAX], V2[MAX], M[MAX][MAX];
#endif


int main(int argc, char** argv){
  int i, k;
  double t1, t2, t_total;

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){
      printf("Faltan nº componentes del vector\n");
      exit(-1);
    }

  unsigned int N = atoi(argv[1]);	// Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  #ifdef VECTOR_GLOBAL
  if (N>MAX) N=MAX;
  #endif
  #ifdef VECTOR_DYNAMIC
  double *V1, *V2, **M;
  V1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
  V2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
  M = (double**) malloc(N*sizeof(double));
  if ( (V1==NULL) || (V2==NULL) || (M==NULL)){
    printf("Error en la reserva de espacio para los vectores\n");
    exit(-2);
  }

  for(i=0; i<N; i++){
    M[i]=(double*) malloc(N*sizeof(double));
    if ( M[i]==NULL ){
      printf("Error en la reserva de espacio para los vectores\n");
      exit(-2);
    }
  }
  #endif

  //Inicializar matriz y vectores
  #pragma omp parallel
  {
    #pragma omp for private(k)
    for(i=0; i<N; i++){
      V1[i] = i;
      V2[i] = 0;
      for(k=0; k<N; k++){
        M[i][k] = i + k;
      }
    }

    //Medida de tiempo
    #pragma omp single
    t1 = omp_get_wtime();

    //Calcular el producto de la matriz
    #pragma omp for private(k)
    for(i=0; i<N; i++){
      for (k=0; k<N; k++){
        V2[i] += M[i][k] * V1[k];
      }
    }

    //Medida de tiempo
    #pragma omp single
    t2 = omp_get_wtime();
  }
  t_total = t2 - t1;

  //Imprimir resultado de la suma y el tiempo de ejecución
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t / V2[0]=%8.6f V2[%d]=%8.6f\n", t_total, N, V2[0], N-1, V2[N-1]);

  if (N<20){
    for(i=0; i<N; i++){
      printf("/ V2[%d]=%5.2f\n", i, V2[i]);
    }
  }

  #ifdef VECTOR_DYNAMIC
  free(V1); // libera el espacio reservado para v1
  free(V2); // libera el espacio reservado para v2
  for (i=0; i<N; i++){
    free(M[i]);
  }
  free(M); //libera el espacio reservado para M
  #endif
return 0;
}
