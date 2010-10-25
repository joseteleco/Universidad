function pot=potencia (x,t)
%function pot=potencia (x,t)
%Funci�n que calcula la potencia de una sel�al seg�n la f�rmula
%               E[x(t)]^2
%PARAMETROS DE ENTRADA:
%               x:   se�al de entrada.
%               t:   dominio de definici�n de la se�al de entrada.
%PARAMETROS DE SALIDA:
%               pot: potencia de la se�al.

y=x.*x;
pot=sum(y)/length(y);
