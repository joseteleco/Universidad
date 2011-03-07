;******************************************************************
;***************	INTRODUCCION		*******************
;******************************************************************
; Comienzo con la propuesta para la realizaci�n de un ejercicio
; que consiste en hacer parpadear un led ganando un 10% de ciclo
; de trabajo cada vez que parpadea, y cuando llega al 100%,
; volviendo a 0%
;
;	Ejemplo:
; Ciclo de 1s [0-10seg] : /\_________/\_________/\_________/\_________/\_________/\_________/\_________/\_________/\_________/\_________/\_________/\_________
;                                                _          __         ___        ____       _____      ______     _______    __________
;                   Led : ___________/\_________/ \________/  \_______/   \______/    \_____/     \____/      \___/       \__/          \__________/\_________
;
;
; Este deber�a ser al menos el funcionamiento, por lo que he 
; entendido. Por lo tanto, ahora hay que planificarlo.
;
;
;******************************************************************
;***************   PLANTEAMIENTO DE RECURSOS	*******************
;******************************************************************
; 
; Se me ocurren varias maneras de hacerlo, dependiendo de los
; recursos que queramos gastar:
; 
; 1.- Haciendo que el temporizador salte cada 0'1 segundos
; 2.- Haciendo que el temporizador salte cada 1 segundo y
;	cada vez que haya que cambiar la luz del led
; 3.- Haciendo un bucle infinito que calculando el n�mero de
;	bucles concatenados nos vaya dando un valor cada vez
;	mayor (o menor)
; 4.- Usando 2 temporizadores, de forma que el que est� 
; 	preparado para hacer cuentas largas nos genere una
;	interrupci�n cada 1seg y el otro, cada vez que le toque
;	apagar el led
; 
;
; Visto que hay muchas opciones para codificar/implementar 
; la misma soluci�n, voy a utilizar la que menos recursos 
; requiere y menor complicaci�n tenga a la hora de implementarse.
;
; Debo admitir que me atrae la 4ta forma mucho, pero no lo
; considero viable en un sistema que necesite tener acceso a 
; alg�n temporizador.
;
; La siguiente opci�n que m�s me atrae, y que es bastante buena, 
; es la 2. El hecho de utilizar un solo temporizador, hace
; que sea bastante m�s viable y bastante atractiva. La raz�n por
; la que la desecho es que las operaciones aritm�ticas que tendr�a
; que hacer son algo m�s complicadas que la opci�n que voy a
; utilizar.
;
; Esta opci�n no me atrae nada, jam�s la utilizar�a por dos razones,
; la primera es que el sistema solo se puede dedicar a eso, y adem�s
; ser�a un tost�n peor que el anterior hacer los c�lculos, y solo
; de pensarlo me da una pereza horrible. Bien pensado, si se
; necesitara un sistema (�nicamente para eso) preciso, ser�a la 
; mejor opci�n. Escribir los bucles a mano, te permitir�a tener un
; control absoluto de los tiempos, no tendr�as que hacer calculos
; para la cuanto dura cada instrucci�n y te permitir�a llevar el 
; c�lculo de la forma m�s precisa posible. Esa es evidentemente, la
; opcion 3.
;
; Y la opci�n con la que me voy a quedar, es la opci�n 1. Me parece
; que es la mejor forma de hacerlo.
;
;******************************************************************
;***************    	CALCULO DEL RELOJ	  *****************
;******************************************************************
; 
; Ahora falta calcular cuan r�pido es el procesado de una instrucci�n
; los relojes (excepto por relojes externos) funcionan al ritmo que
; tarda una instrucci�n en ejecutarse. Por lo tanto, si tenemos un 
; reloj a 4MHz, como es el caso de nuestra placa, nos encontraremos
; con un contador que cada microsegundo aumenta en 1. Por lo tanto,
; necesitamos un contador que pueda generar una interrupci�n cada
; 100000 instrucciones. Para el n�mero 100000 necesitamos un contador
; de 16 bits, que llegar� hasta 131071.
;
; Como con los temporizadores nos vienen las interrupciones cada 
; vez que los contadores pasan a 0, tendr�amos que empezar la cuenta
; desde el 31071. Mas tarde calcularemos cuantas instrucciones se
; ejecutan desde que se salta a la RSI para calcular cual es el 
; valor exacto que tenemos que cargar en el reloj.
;
; En cuanto a que reloj deber�amos utilizar, se puede hacer con 
; todos, pero he decidido que voy a hacerlo con el timer2, que 
; es el que parece que tiene mas complicaci�n.
;
; Ahora por lo tanto toca calcular como lo vamos a programar, lo
; primero que vamos a hacer, va a ser poner el pre-escalador a 
; 1:16, para ahorrarnos 4 bits. por lo tanto, si antes necesitabamos
; 16 bits, ahora tendremos uno de 12 bits.
;
; Esto significa, que tenemos un contador que tenemos una cuenta 
; cada 16 instrucciones, por lo tanto, en un segundo tendremos 
; 62500 cuentas. si lo dividimos entre 10, nos quedan que en cada
; decima de segundo (0.1s) tendremos 6250 cuentas, vamos el n�mero
; al que tiene que llegar la cuenta.
;
; Ahora, nos viene el problema de que podemos llegar a contar 8 
; bits, por lo que el mayor numero que podemos contar es 256. Si 
; queremos hacerlo con este, usando el postcalador, tendremos que
; decidir cuantas cuentas queremos. Hay que tener en cuenta, que
; el postcalador tiene hasta 1:16 por lo tanto tenemos que hacer
; una descomposicion en factores:
; 	6250|2
;	3125|5
;	 625|5
;	 125|5
;	  25|5
;	   5|5
;	   1|
; 
; De aqui deducimos, que ya que al contador se le puede configurar
; hasta cuanto queremos contar, podemos decirle que cuente hasta
; 250, de tal manera, que nos quedarian:
;	6250|250
;	  25|
;
; 25, tendr�amos que contar con el post escalador hasta 25 para
; que fuera lo m�s s�ncrono posible. El problema es que solo podemos
; hacer que salte una interrupci�n de 1:16. Acabo de hacer los 
; c�lculos y me he dado cuenta de que no se puede, lo m�ximo que
; conseguir�amos ser�a una relaci�n de 1'5258, la m�xima cuenta
; que se puede conseguir es 16 * 16 * 256 * 1/4 * f. oscilacion.
; Por lo tanto, este temporizador, no est� preparado para hacer
; cuentas tan largas con el reloj interno (no pienso ponerle otro
; externo)
;
;
; Visto que no se puede con el 2, pasemos al 1. Con este ya hemos
; calculado que se puede. Por lo tanto, ahora, tendremos que repetir
; (casi) todos los calculos. Hemos hayado que lo que nos faltaban
; eran 100000 ciclos. Para contarlos, tenemos un prescalador de 1:8
; (y menores) y un contador de 16 bits (m�s que suficiente).
; 
; Por lo tanto, si dividimos 100000/8 = 12500. Tenemos que conseguir 
; contar hasta 12500 con un contador de 16 bits. Eso, ya, es facil,
; y posible. El problema con el que nos encontramos ahora es uno
; sencillo. �que pasa con esos 8 numeros que hay entre incremento e
; incremento?
; 
; Por lo tanto, tendremos que tener cuidado con saber cuantos ciclos
; pasan desde que le decimos al contador que cuente hasta que cuenta
; no se explicarme mejor, pero creo que se entiende la problematica.
; Si consigo que me quede m�ltiplo de 8, el numero de instrucciones,
; entonces utilizare el prescalador a 8, si no, a 4, si no, pues
; nada
;******************************************************************
;******************    ESTRUCTURA DE LA RSI	*******************
;******************************************************************
; Lo bueno de que se vaya ganando siempre un 10% de WC es que as�,
; puedo estucturar un contador, como al hacer piramides del tipo:
;
; 1
; 12
; 123
; 1234
; 
; Que son bloques for anidados con uno la condici�n del de encima,
; pues ahora seria:
; 	- Siempre se cuenta hacia arriba, para llevar la cuenta, y 
; 	as�, tendremos la opci�n de utilizar el DG del status, la 
; 	cuenta BCD.
;	- Por lo tanto, si la fase hacemos que empiece en la cuenta
; 	de ciclos, siempre que la fase llegue a 9, el siguiente 
; 	incremento, apagar� el led y pondr� a 0 la fase.
;	- Cuando la fase llegue al n�mero de ciclos, se aumentar�
; 	el n�mero de ciclos en uno y se encender� el led.
;		- Cuando el n�mero de ciclos llegue a 9, al pasar a
;		0, no se encender� el led.
;******************************************************************
;******************************************************************
;******************************************************************
;******************************************************************
;******************************************************************
;******************************************************************

	LIST	P=16F887
	INCLUDE "P16F887.INC"
	
;******************************************************************
; Registros para salvar al recibir una interrupci�n
; En todos los programas, dejar� estas 4 posiciones para ello

SAVEFSR	EQU	20
SAVEPCL	EQU	21
SAVEST	EQU	22
SAVEW	EQU	23
;
; Ahora las variables de programa que voy a usar para el led.
B_LED	EQU	0;Posicion en el puerto
P_LED	EQU	PORTA;Puerto
;*****************************************************************
; Variables del programa

CICLO	EQU	30; La variable para hacer las cuentas
FASE	EQU	31;
;******************************************************************
; Inicializo el programa, direccion de reset 0000
	ORG 003; Digo que esta instruccion (la siguiente) tiene que
	; estar en la 003, pues es la �nica direcci�n que hay antes
	; del vector de interrupciones
	GOTO INI_PPAL
	
RSI:
	ORG	004;Especifico el comienzo de la RSI al lugar de una interrupci�n
	BCF	INTCON,GIE; Como voy a hacer un sistema de RSI muy completo, no
	; necesito interrupciones
;Espacio de Trabajo
	MOVWF	SAVEW;Guardo el Espacio de Trabajo
;Status
	MOVF	STATUS,W;Pongo el status en el Espacio de trabajo
	MOVWF	SAVEST;Guardo el status en su espacio correspondiente
	CLRF	STATUS;Me coloco en el espacio de trabajo 0
;FSR
	MOVF	FSR,W;Muevo el valor del registro de direccionamiento al E.T.
	MOVWF	SAVEFSR;Guardo el registro de direccionamiento indirecto
;PCLATH
	MOVF	PCLATH,W;El PCLATH no es retroalimentado por el PC 
	MOVWF	SAVEPCL;por lo que se puede salvar ahora
	CLRF	PCLATH;Y lo borramos por que estamos en el banco 0 y
	; no queremos saltar a ning�n banco de memoria

	;AQUI TODAS LAS INTERRUPCIONES POR ORDEN DE PRIORIDAD.
RETI:
	CLRF	STATUS;
	BTFSC	PIR1,TMR1IF;
		GOTO	TIMER1INTER;
	;AQUI ACABAN LAS INTERRUPCIONES

;PCLATH
	MOVF	SAVEPCL,W;
	MOVWF	PCLATH;
;FSR
	MOVF	SAVEFSR,W;
	MOVWF	FSR;
;STATUS
	MOVF	SAVEST,W;
	MOVWF	STATUS;
;Espacio de Trabajo
	MOVF	SAVEW,W;
	RETFIE;

;******************************************************************
;******************************************************************

TIMER1INTER:
	INCF	FASE;
	MOVFW	FASE;
	SUBLW	H'A';	
	BTFSC	STATUS,Z;
		CALL	RESETEA_FASE;
	MOVFW	FASE;
	SUBWF	CICLO,W;
	BTFSC	STATUS,Z;
		BSF	P_LED,B_LED;
	MOVLW	H'3C';
	MOVWF	TMR1H;
	MOVLW	H'B0';
	MOVWF	TMR1L;
	BCF	PIR1,TMR1IF;
	GOTO	RETI;

RESETEA_FASE:
	CLRF	FASE;
	INCF	CICLO,F;
	MOVFW	CICLO;
	SUBLW	H'A';
	BTFSC	STATUS,Z;
		CLRF	CICLO;
	BCF	P_LED,B_LED;
	RETURN;
	
INI_PPAL:
	CALL	INITMR1;
PROG_PPAL:
	GOTO PROG_PPAL;

INITMR1:
;***** INICIALIZAMOS VARIABLES *******
	CLRF	FASE;
	CLRF	CICLO;
	
;***** CONFIGURAMOS EL PUERTO ********
	BANKSEL	TRISA;
	BCF	P_LED,B_LED;
	BANKSEL	P_LED;
	BSF	P_LED,B_LED;
	
;***** CONFIGURAMOS EL TEMPORIZADOR *****
	BSF	PIR1,TMR1IF; Quitamos el bit de overflow
	; por si acaso ya se ha activado
	CLRF	TMR1L;ponemos a 0 el byte bajo del cont
	CLRF	TMR1H;lo mismo con el alto
	MOVLW	H'3C';incializamos los 2
	MOVWF	TMR1H;
	MOVLW	H'B0';
	MOVWF	TMR1L;
	CLRF	T1CON;reseteamos la configuracion del contador
	BSF	T1CON,T1CKPS0;configuro el prescalador
	BSF	T1CON,TMR1ON;enciendo el contador
;***** CONFIGURAMOS LAS INTERRUPCIONES *****
	BCF	PIR1,TMR1IF;
	BSF	INTCON,GIE;Activo las interrupciones globales
	BSF	INTCON,PEIE;Activo las interrupciones de perifericos
	BANKSEL	PIE1;Me muevo al banco 1
	BSF	PIE1&7f,TMR1IE;Activo la interrupci�n del timer1
	RETURN;
	
	END;
;DUDAS!!
;
;
;	CUANDO GUARDAMOS, SE SUPONE QUE SE USA EL PCLATH!