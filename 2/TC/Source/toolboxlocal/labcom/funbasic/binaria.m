function [x] = binaria (N)
%function [x] = binaria (N)
%BINARIA Se�al binaria de 1's y 0's aleatorios de longitud N 
%	con Pr(0)=Pr(1)=0.5. 
% PARAMETROS DE ENTRADA:
%	N:	n�mero de vits a generar.
% PARAMETROS DE SALIDA:
%	x:	se�al binaria generada.

x = randn(1,N);
x = (x < 0);
