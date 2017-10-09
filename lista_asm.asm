
; PALABRA
	global palabraLongitud
	global palabraMenor
	global palabraFormatear
	global palabraImprimir
	global palabraCopiar
	
; LISTA y NODO
	global nodoCrear
	global nodoBorrar
	global oracionCrear
	global oracionBorrar
	global oracionImprimir

; AVANZADAS
	global longitudMedia
	global insertarOrdenado
	global filtrarPalabra
	global descifrarMensajeDiabolico

; YA IMPLEMENTADAS EN C
	extern palabraIgual
	extern insertarAtras
	
	extern fprintf
	extern malloc
	extern free
	extern fopen
	extern fclose
	extern insertarAtras

; /** DEFINES **/    >> SE RECOMIENDA COMPLETAR LOS DEFINES CON LOS VALORES CORRECTOS
	%define NULL 		0
	%define TRUE 		1
	%define FALSE 		0

	%define LISTA_SIZE 	    	 8
	%define OFFSET_PRIMERO 		 0

	%define NODO_SIZE     		 16
	%define OFFSET_SIGUIENTE   	 0
	%define OFFSET_PALABRA 		 8


section .rodata


section .data
	formPaImp: db '%s',10,0
	formFopen: db 'a',0
	orVacia: db '<oracionVacia>',0
	menVacio: db '<sinMensajeDiabolico>',0
	
section .text


;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------

	; unsigned char palabraLongitud( char *p );
	palabraLongitud:
		; COMPLETAR AQUI EL CODIGO
		; Puntero esta en RDI
		push rbp
		mov rbp, rsp
		
		xor rax, rax
		;Uso r8 para avanzar en la palabra
		xor r8, r8
		mov r8, rdi
		
		.ciclo:
			cmp byte[r8], 0
			jz .termine
			inc rax
			inc r8
			jmp .ciclo
			
		.termine:
			pop rbp
			ret
			

	; bool palabraMenor( char *p1, char *p2 );
	palabraMenor:
		; COMPLETAR AQUI EL CODIGO
		; RDI esta el puntero a la primera palabra, RSI esta el puntero a la segunda palabra
		push rbp
		mov rbp, rsp
		push rbx
		sub rsp, 8
		
		xor rax, rax
		
		;r8 es donde guardo la direccion de la primera palabra
		xor r8, r8
		;r9 es donde guardo la direccion de la segunda palabra
		xor r9, r9
		mov r8, rdi
		mov r9, rsi
		xor rbx, rbx
		xor rdx, rdx
		
		.Ciclo:
			;Uso bl para guardar el caracter a comparar de la primera palabra
			mov bl, [r8]
			;Uso dl para guardar el caracter a comparar de la segunda palabra
			mov dl, [r9]
			inc r8
			inc r9
			cmp dl, 0
			je .Fal
			cmp bl, dl
			je .Ciclo
			ja .Fal
			jb .Ver
		
		.Fal:
			mov al, FALSE
			add rsp, 8
			pop rbx
			pop rbp
			ret
		
		.Ver:
			mov al, TRUE
			add rsp, 8
			pop rbx
			pop rbp
			ret



	; void palabraFormatear( char *p, void (*funcModificarString)(char*) );
	palabraFormatear:
		; COMPLETAR AQUI EL CODIGO
		; RDI esta el puntero a la palabra, RSI esta el puntero a la función
		
		push rbp
		mov rbp, rsp
		
		call rsi
		
		pop  rbp
		ret
		
		

	; void palabraImprimir( char *p, FILE *file );
	palabraImprimir:
		; COMPLETAR AQUI EL CODIGO
		
		push rbp
		mov rbp, rsp
		
		;muevo la pablabra a rdx
		mov rdx, rdi
		;muevo el file a rdi
		mov rdi, rsi
		mov rsi, formPaImp
		
		call fprintf
		
		pop  rbp
		ret

	; char *palabraCopiar( char *p );
	palabraCopiar:
		; COMPLETAR AQUI EL CODIGO
		
		push rbp
		mov rbp, rsp
		push r15
		push rbx
		; r15 tiene el puntero a la palabra
		mov r15, rdi
		
		call palabraLongitud
		
		xor rdi, rdi
		mov dil, al
		inc rdi

		call malloc
		
		;rax tiene el puntero a la nueva palabra
		;uso rbx para moverme en la nueva palabra
		xor rbx, rbx
		xor rdx, rdx
		mov rdx, rax
		mov byte[rax], 0
		
		.ciclo:
			cmp byte[r15], 0
			je .fin
			mov bl, [r15]
			mov byte[rdx], bl
			inc r15
			inc rdx
			jmp .ciclo
		
		.fin:	
			mov byte[rdx], 0
			pop rbx
			pop r15
			pop rbp
			ret
		


;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------

	; nodo *nodoCrear( char *palabra );
	nodoCrear:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		sub rsp, 8
		
		;r15 guarda el puntero a la paqlabra
		xor r15, r15
		mov r15, rdi
		xor rdi, rdi
		mov rdi, NODO_SIZE
		
		call malloc
		
		mov qword[rax + OFFSET_SIGUIENTE], NULL
		mov [rax + OFFSET_PALABRA], r15
		
		add rsp, 8
		pop r15
		pop rbp	
		ret

	; void nodoBorrar( nodo *n );
	nodoBorrar:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		sub rsp, 8
		
		;r15 guarda el puntero al nodo
		xor r15, r15
		mov r15, rdi
		
		mov rdi, [r15+OFFSET_PALABRA]
		call free
		
		mov rdi, r15
		call free
		
		add rsp, 8
		pop r15
		pop rbp
		ret

	; lista *oracionCrear( void );
	oracionCrear:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		
		mov rdi, LISTA_SIZE
		call malloc
		mov qword[rax], NULL
		
		pop rbp
		ret

	; void oracionBorrar( lista *l );
	oracionBorrar:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		sub rsp, 8
		
		xor r13, r13
		;r15 guarda el puntero a la lista
		xor r15, r15
		mov r15, rdi
		;r14 guarda el puntero al primero
		xor r14, r14
		mov r14, [r15 + OFFSET_PRIMERO]
		cmp r14, NULL
		je .fin

		
		.ciclo:
			;r13 es el registro donde guardo el puntero al siguiente
			mov r13, [r14 + OFFSET_SIGUIENTE]
			mov rdi, r14
			call nodoBorrar
			mov r14, r13
			cmp r13, NULL
			jne .ciclo
			
		.fin:
			xor rdi, rdi
			mov rdi, r15
			call free
		
		add rsp, 8
		pop r13
		pop r14
		pop r15
		pop rbp
		ret

	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) );
	oracionImprimir:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		push r12
		push rbx
		sub rsp, 8
		
		;r15 guarda el puntero a la lista
		xor r15, r15
		mov r15, rdi
		;r14 guarda el puntero al nombre del archivo
		xor r14, r14
		mov r14, rsi
		;r13 guardo el puntero a la función
		xor r13, r13
		mov r13, rdx
		
		mov rdi, r14
		mov rsi, formFopen
		call fopen
		;r15 guarda el puntero al file
		xor rbx, rbx
		mov rbx, rax
		;r12 puntero con el que recorro la lista
		xor r12, r12
		mov r12, [r15 + OFFSET_PRIMERO]
		cmp r12, NULL
		je .vacio
		
		.ciclo:
			mov rdi, [r12 + OFFSET_PALABRA]
			mov rsi, rbx
			call r13
			mov r12, [r12 + OFFSET_SIGUIENTE]
			cmp r12, NULL
			je .fin
			jmp .ciclo
		
		.vacio:
			mov rdi, orVacia
			mov rsi, rbx
			call r13
		
		.fin:
			mov rdi, rbx
			call fclose
			
			add rsp, 8
			pop rbx
			pop r12
			pop r13	
			pop r14
			pop r15
			pop rbp
			ret

;/** FUNCIONES AVANZADAS **/
;-----------------------------------------------------------

	; float longitudMedia( lista *l );
	longitudMedia:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		push r12
		;r15 guarda puntero a la lista
		xor r15, r15
		mov r15, rdi
		;el puntero con el que me muevo en la lista
		xor r14, r14
		mov r14, [r15 + OFFSET_PRIMERO]
		;r13 es el contador
		xor r13, r13
		;r12 es el acumulador
		xor r12, r12
		xor rax, rax
		cmp r14, NULL
		je .fin0
		
		.ciclo:
			mov rdi, [r14 + OFFSET_PALABRA]
			call palabraLongitud
			add  r12, rax
			inc r13
			mov r14, [r14 + OFFSET_SIGUIENTE]
			cmp r14, NULL
			je .termine
			jmp .ciclo
		
		.fin0:
			cvtsi2ss xmm0, r12
			jmp .fin
			
		.termine:
			cvtsi2ss xmm0, r12
			cvtsi2ss xmm1, r13
			divss xmm0, xmm1		
		
		.fin:
			pop r12
			pop r13	
			pop r14
			pop r15
			pop rbp
			ret


	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) );
	insertarOrdenado:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		push r12
		push rbx
		sub rsp, 8
		
		;si esta vacio, inserto atras
		;sino entro y comparo las palabras mientras que no llegue al final
		;si llego al final inserto atras
		;r15 guarda la lista
		xor r15, r15
		mov r15, rdi
		;r14 guarda la palabra a comparar
		xor r14, r14
		mov r14, rsi
		;r13 guarda la funcion para comparar
		xor r13, r13
		mov r13, rdx
		;r12 es el puntero con el que me voy a mover en la linea
		xor r12, r12
		mov r12, [r15 + OFFSET_PRIMERO]
		
		cmp r12, NULL
		je .insAtras
		;rbx guarda el puntero al nodo en el que estoy
		xor rbx, rbx
		mov rbx, r12
		
		mov rdi, [r12 + OFFSET_PALABRA]
		mov rsi, r14
		call r13
		cmp al, FALSE
		je .primero
		
		.ciclo:
			mov rdi, [r12 + OFFSET_PALABRA]
			mov rsi, r14
			call r13
			cmp al, FALSE
			je .insertar
			mov rbx,r12
			mov r12, [r12 + OFFSET_SIGUIENTE]
			cmp r12, NULL
			je .insAtras
			jmp .ciclo
			
		.insertar:
			mov rdi, r14
			call nodoCrear
			xor r8, r8
			mov r8, [rbx + OFFSET_SIGUIENTE]
			mov qword[rax + OFFSET_SIGUIENTE], r8
			mov qword[rbx + OFFSET_SIGUIENTE], rax
			jmp .fin
		
		.primero:
			mov rdi, r14
			call nodoCrear
			xor r8, r8
			mov r8, [r15 + OFFSET_PRIMERO]
			mov qword[rax + OFFSET_SIGUIENTE], r8
			mov qword[r15 + OFFSET_PRIMERO], rax
			jmp .fin
		
		.insAtras:
			mov rdi, r15
			mov rsi, r14
			call insertarAtras
			
			
		.fin:
			add rsp, 8	
			pop rbx	
			pop r12
			pop r13
			pop r14
			pop r15
			pop rbp
			ret
			
		
		

	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp );
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		push r12
		push rbx
		sub rsp, 8
		
		xor r15, r15
		xor r14, r14
		xor r13, r13
		xor r12, r12
		xor rbx, rbx
		;Uso r15 para guardar la lista
		mov r15, rdi
		;Uso r14 para guardar la funcion
		mov r14, rsi
		;Uso r13 para guardar la palabra a comparar
		mov r13, rdx
		;Uso r12 para moverme en la lista
		mov r12, [r15 + OFFSET_PRIMERO]
		cmp r12, NULL
		je .fin
		mov rbx, r12
		
		.ciclo:
			mov rdi, [r12 + OFFSET_PALABRA]
			mov rsi, r13
			call r14
			cmp al, FALSE
			je .borrar
			mov rbx, r12
			mov r12, [r12 + OFFSET_SIGUIENTE]
		.seCiclo:
			cmp r12, NULL
			je .fin
			jmp .ciclo
			
		.primero:
			mov r12, [r12 + OFFSET_SIGUIENTE]
			call nodoBorrar
			mov qword[r15 + OFFSET_PRIMERO], r12
			jmp .seCiclo
		
		.borrar:
			mov rdi, r12
			cmp r12, [r15 + OFFSET_PRIMERO]
			je .primero
			mov r12, [r12 + OFFSET_SIGUIENTE]
			call nodoBorrar
			mov qword[rbx + OFFSET_SIGUIENTE], r12
			jmp .seCiclo
			
		.fin:
			add rsp, 8
			pop rbx
			pop r12
			pop r13
			pop r14
			pop r15
			pop rbp
			ret
		

	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) );
	descifrarMensajeDiabolico:
		; COMPLETAR AQUI EL CODIGO
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		push r12
		push rbx
		sub rsp, 8
		
		xor r15, r15
		xor r14, r14
		xor r13, r13
		xor r12, r12
		xor rbx, rbx
		;Uso r15 para guardar la lista
		mov r15, rdi
		;Uso r14 para guardar el archivo
		mov r14, rsi
		;Uso r13 para guardar funcion para imprimir
		mov r13, rdx
		;Uso r12 para moverme en la lista
		mov r12, [r15 + OFFSET_PRIMERO]
		
		mov rdi, r14
		mov rsi, formFopen
		call fopen
		;Uso rbx para guardar el puntero al File
		mov rbx, rax
		
		cmp r12, NULL
		je .vacio
		xor r14, r14
		
		.pushTodo:
			xor r8, r8
			mov r8, [r12 + OFFSET_PALABRA]
			push r8
			inc r14
			mov r12, [r12 + OFFSET_SIGUIENTE]
			cmp r12, NULL
			je .popTodo
			jmp .pushTodo
			
			
		.popTodo:
			xor rax, rax
			mov rax, r14
			xor rdx, rdx
			xor r8, r8
			mov r8, 2
			div r8
			cmp rdx, 0
			jne .impar
			;Como es par agarro 2 palabras para mantener alineada la pila,
			;perdiendo el puntero que usaba para moverme en la lista
			pop rdi
			pop r12
			mov rsi, rbx
			call r13
			dec r14
			mov rdi, r12
			mov rsi, rbx
			call r13
			dec r14
			cmp r14, 0
			je .fin
			jmp .popTodo
			
		.impar:
			pop rdi			
			mov rsi, rbx
			call r13
			dec r14
			cmp r14, 0
			je .fin
			jmp .popTodo
			
		.vacio:
			mov rdi, menVacio
			mov rsi, rbx
			call r13
		
		.fin:
			mov rdi, rbx
			call fclose
		
		add rsp, 8
		pop rbx
		pop r12
		pop r13
		pop r14
		pop r15
		pop rbp
		ret 
