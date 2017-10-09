#include "lista.h"
#include <stdio.h>
#include <stdlib.h>

void g(char *r){r[0] = 'x';}


int main (void){
	// COMPLETAR AQUI EL CODIGO
	
	
	//Ejercicio 1
	printf("Pruebo palabraLongitud: \n");
	char *e1p1 = "Alejandra";
	unsigned char e1r1 = palabraLongitud(e1p1);
	printf("La longitud de %s es: %d \n",e1p1,e1r1);
	char *e1p2 = "Hola";
	unsigned char e1r2 = palabraLongitud(e1p2);
	printf("La longitud de %s es: %d \n",e1p2,e1r2);
	char *e1p3 = "banana";
	unsigned char e1r3 = palabraLongitud(e1p3);
	printf("La longitud de %s es: %d \n",e1p3,e1r3);
	char *e1p4 = "escalerass";
	unsigned char e1r4 = palabraLongitud(e1p4);
	printf("La longitud de %s es: %d \n\n",e1p4,e1r4);
	
	
	//Ejercicio 2
	printf("Pruebo palabraMenor: \n");
	char *e2p1 = "Bien";
	bool e2r1 = palabraMenor(e1p1,e2p1);
	printf("Es %d que %s es menor que %s\n",e2r1,e1p1,e2p1);
	char *e2p2 = "hola";
	bool e2r2 = palabraMenor(e1p2,e2p2);
	printf("Es %d que %s es menor que %s\n",e2r2,e1p2,e2p2);
	char *e2p3 = "banana";
	bool e2r3 = palabraMenor(e1p3,e2p3);
	printf("Es %d que %s es menor que %s\n",e2r3,e1p3,e2p3);
	char *e2p4 = "escalerassssss";
	bool e2r4 = palabraMenor(e1p4,e2p4);
	printf("Es %d que %s es menor que %s\n",e2r4,e1p4,e2p4);
	printf("Es %d que %s es menor que %s\n\n",e2r4,"Abelu","Adrian");
	printf("Es %d que %s es menor que %s\n\n",e2r4,"a","que");
	
	
	//Ejercicio 3
	printf("Pruebo palabraFormatear: \n");
	char *e3p1 = palabraCopiar("hhhhhhh");
	printf("La palabra antes: %s\n", e3p1);
	palabraFormatear(e3p1,g);
	printf("La palabra despues: %s\n\n",e3p1);
	free(e3p1);
	
	
	//Ejercicio 4
	printf("Pruebo palabraImprimir: \n");
	printf("Imprimo Bien: ");
	palabraImprimir(e2p1,stdout);
	printf("Imprimo hola: ");
	palabraImprimir(e2p2,stdout);
	printf("Imprimo banana: ");
	palabraImprimir(e2p3,stdout);
	printf("Imprimo escalerassssss: ");
	palabraImprimir(e2p4,stdout);
	printf("Imprimo Alejandra: ");
	palabraImprimir(e1p1,stdout);
	printf("Imprimo Hola: ");
	palabraImprimir(e1p2,stdout);
	printf("\n");
	
	
	//Ejercicio 5
	printf("Pruebo palabraCopiar:\n");
	char *e5r1 = palabraCopiar(e1p1);
	printf("%s es copia de %s\n",e5r1,e1p1);
	e5r1[0] = 'x';
	printf("%s es distinto de %s\n",e5r1,e1p1);
	char *e5r2 = palabraCopiar(e1p2);
	printf("%s es copia de %s\n",e5r2,e1p2);
	char *e5r3 = palabraCopiar(e1p3);
	printf("%s es copia de %s\n",e5r3,e1p3);
	char *e5r4 = palabraCopiar(e1p4);
	printf("%s es copia de %s\n\n",e5r4,e1p4);
	
	
	//Ejercicio 6
	printf("Pruebo nodoCrear:\n");
	nodo *e6r1 = nodoCrear(e5r1);
	printf("Cree el nodo con la Palabra: %s \n",e6r1->palabra);
	nodo *e6r2 = nodoCrear(e5r2);
	printf("Cree el nodo con la Palabra: %s \n",e6r2->palabra);
	nodo *e6r3 = nodoCrear(e5r3);
	printf("Cree el nodo con la Palabra: %s \n",e6r3->palabra);
	nodo *e6r4 = nodoCrear(e5r4);
	printf("Cree el nodo con la Palabra: %s \n\n",e6r4->palabra);
	

	//Ejercicio 7
	printf("Pruebo nodoBorrar: \n");
	nodoBorrar(e6r1);
	nodoBorrar(e6r2);
	nodoBorrar(e6r3);
	nodoBorrar(e6r4);
	printf("Borre todos los nodos\n\n");
	
	
	//Ejercicio 8
	printf("Pruebo oracionCrear:\n");
	lista *e8r1 = oracionCrear();
	lista *e8r2 = oracionCrear();
	lista *e8r3 = oracionCrear();
	lista *e8r4 = oracionCrear();
	lista *e8r5 = oracionCrear();
	printf("Ya estan creadas las listas\n\n");
	
	
	//Ejercicio 10
	printf("Pruebo oracionImprimir:\n");
	char *e10p1 = palabraCopiar(e1p1);
	char *e10p2 = palabraCopiar(e1p2);
	char *e10p3 = palabraCopiar(e1p3);
	char *e10p4 = palabraCopiar(e1p4);
	char *e10p5 = palabraCopiar(e2p1);
	char *e10p6 = palabraCopiar(e2p2);
	char *e10p7 = palabraCopiar(e2p3);
	char *e10p8 = palabraCopiar(e2p4);
	char *e10p9 = palabraCopiar(e2p4);
	char *h = "hola.txt";
	insertarAtras(e8r1,e10p4);
	insertarAtras(e8r1,e10p3);
	insertarAtras(e8r1,e10p2);
	insertarAtras(e8r1,e10p1);
	insertarAtras(e8r2,e10p5);
	insertarAtras(e8r3,e10p6);
	insertarAtras(e8r3,e10p7);
	insertarAtras(e8r3,e10p8);
	insertarAtras(e8r5,e10p9);
	oracionImprimir(e8r1,h,palabraImprimir);
	oracionImprimir(e8r2,h,palabraImprimir);
	oracionImprimir(e8r3,h,palabraImprimir);
	oracionImprimir(e8r4,h,palabraImprimir);
	oracionImprimir(e8r5,h,palabraImprimir);
	printf("Mirar archivo hola.txt\n\n");
	
	//Ejercicio 11
	printf("Pruebo longitudMedia:\n");
	float e11r1 = longitudMedia(e8r1);
	printf("la longitud media de la 1º lista es: %f\n",e11r1);
	float e11r2 = longitudMedia(e8r2);
	printf("la longitud media de la 2º lista es: %f\n",e11r2);
	float e11r3 = longitudMedia(e8r3);
	printf("la longitud media de la 3º lista es: %f\n",e11r3);
	float e11r5 = longitudMedia(e8r5);
	printf("la longitud media de la 5º lista es: %f\n",e11r5);
	float e11r4 = longitudMedia(e8r4);
	printf("la longitud media de la 4º lista es: %f\n\n",e11r4);
	
	
	//Ejercicio 12
	printf("Pruebo insertarOrdenado:\n");
	lista *e12l1 = oracionCrear();
	insertarOrdenado(e12l1,palabraCopiar("Creo"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("que"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("no"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("va"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("a"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("funcionar"),palabraMenor);
	insertarOrdenado(e12l1,palabraCopiar("AAAAA"),palabraMenor);
	oracionImprimir(e12l1,"ordenado.txt",palabraImprimir);
	printf("Mirar archivo ordenado.txt\n\n");
	
	
	//Ejercicio 13
	printf("Pruebo filtrarAltaLista:\n");
	filtrarPalabra(e12l1,palabraMenor,"no");
	oracionImprimir(e12l1,"Filtrada.txt",palabraImprimir);
	filtrarPalabra(e12l1,palabraMenor,"a");
	oracionImprimir(e12l1,"Filtrada.txt",palabraImprimir);
	filtrarPalabra(e12l1,palabraIgual,"Creo");
	oracionImprimir(e12l1,"Filtrada.txt",palabraImprimir);
	printf("Mirar archivo Filtrada.txt\n\n");
	
	
	//Ejercicio 14
	printf("Pruebo descifrarMensajeDiabolico:\n");
	descifrarMensajeDiabolico(e8r1,"mensajeDiabolico.txt",palabraImprimir);
	descifrarMensajeDiabolico(e8r3,"mensajeDiabolico.txt",palabraImprimir);
	printf("Mirar archivo mensajeDiabolico.txt\n\n");
	
	//Ejercicio 9
	printf("Pruebo oracionBorrar:\n");
	oracionBorrar(e8r1);
	oracionBorrar(e8r2);
	oracionBorrar(e8r3);
	oracionBorrar(e8r4);
	oracionBorrar(e12l1);
	oracionBorrar(e8r5);
	printf("Borre todas las oraciones\n\n");
	
	return 0;
}
