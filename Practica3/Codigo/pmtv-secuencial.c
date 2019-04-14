#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv){
  int i, j;

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

  // Obtenemos los resultados
  for (i=0; i<N; i++)
    for (j=i; j<N; j++)
      resultado[i] += matriz[i][j] * vector[j];

  // Pintamos los resultados
  printf("Resultado:\n");
  for (i=0; i<N; i++)
    printf("%d ", resultado[i]);
  printf("\n");

  // Liberamos la memoria
  for (i=0; i<N; i++)
    free(matriz[i]);
  free(matriz);
  free(vector);
  free(resultado);
return 0;
}
