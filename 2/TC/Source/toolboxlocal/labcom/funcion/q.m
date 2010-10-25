function cola=q (x)
% function cola=q (x)
% Funci�n que calcula la el �rea de una cola gaussiana.
% PARAMETROS DE ENTRADA:
%	x:	l�mite inferior de la integral
% PARAMETROS DE SALIDA:
%	cola: 	area de la cola.
cola=exp(-x*x/2)/sqrt(2*pi*x*x);