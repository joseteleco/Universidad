function n=gauss(m,s2,t)
% function n=gauss(m,s2,t)
% Funci�n que genera ruido gaussiano blanco de media m y de varianza
% s2 en el dominio definido por t.
% PARAMETROS DE ENTRADA:
%               m:  media del ruido generado.
%               s2: varianza del ruido generado.
%               t:  dominio de definici�n del ruido.
% PARAMTROS DE SALIDA:
%               n:  se�al de ruido gaussiano blanco.

n=m+sqrt(s2)*randn (size(t));
