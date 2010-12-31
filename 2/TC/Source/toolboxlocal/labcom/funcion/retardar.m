function retardar=retardar(fun,to,t)
%function retardar=retardar(fun,to,t) 
% Realiza un retardo de la funci�n fun de n unidades hacia la derecha
% o la izquierda.
%PARAMETROS DE ENTRADA:
%	fun: 	funci�n que desamos retardar.
%	to: 	n�mero de unidades del eje t que deseamos retardar.
%	t: 	rango de valores o dominio de definici�n de la funci�n fun.
%PARAMETROS DE SALIDA:
%	retardo: funci�n fun retardada.

resolucion=t(2)-t(1);
n=round(to/resolucion);
retardar=desplaza(fun,n,t);
