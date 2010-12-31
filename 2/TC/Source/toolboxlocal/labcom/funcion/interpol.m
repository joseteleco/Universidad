function [y,n_y]=interpol(x,n,L)
% function [y,n_y]=interpol(x,n,L)
% Funci�n que realiza la interpolaci�n de la funci�n x por un factor L.
% Si L no es entero se redondea a su valor superior m�s pr�ximo.
% 'x' debe tener m�s de 9 muestras.
% PARAMETROS DE ENTRADA:
%               y:   funci�n que queremos interpolar.
%               n:   dominio de definici�n discreto de la funci�n de entrada.
%               L:   factor de interpolaci�n.
% PARAMETROS DE SALIDA:
%               y:   funci�n interpolada.
%               n_y :dominio de definici�n de la funci�n de salida.

L1=ceil(L);
if nargin~=3
        disp ('Error: N�mero de par�metros err�neo.');
else
        n_y=n(1):(n(2)-n(1))/L1:max(n)+(L-1)*(n(2)-n(1))/L1;
        y=interp (x,L1);
end;
