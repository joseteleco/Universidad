function error=p_errort (A,s2)
% function error=p_errort (A,s2)
% Funci�n que calcula la probabilidad de error en la detecci�n de 
% una se�al binaria ruidosa.
% PARAMETROS DE ENTRADA:
%	A:	se�al unipolar	A=sqrt(2*Sr)
%	s2:	se�al polar	A=sqrt(4*Sr)
% PARAMETROS DE SALIDA:
%	p_errort: probabilidad de error te�rico.
%k=A/(2*sqrt(s2));
k=6;
error=exp(-k*k/2)/sqrt(2*pi*k*k);