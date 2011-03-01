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
; 
;

	LIST	"P16F887"
	INCLUDE "P16F887.INC"