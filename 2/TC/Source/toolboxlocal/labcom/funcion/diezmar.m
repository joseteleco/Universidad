function [y, n_y]=diezmar(x,n,M)
%function [y, n_y]=diezmar(x,n,M)
% Esta funci�n realiza un diezmado de la se�al de entrada por un factor M.
% Si M no es entero, se redondea a su valor entero inmediatamente superior.
% 'x' debe tener al menos 25 muestras.
%PARAMETROS DE ENTRADA:
%               x:   funci�n a diezmar.
%               n:   dominio de definici�n de la funci�n de entrada.
%               M:   factor de diezmado.
%PARAMETROS DE SALIDA:
%               y:   funci�n diezmada.
%               n_y: nuevo dominio de deficini�n.

if nargin~=3
        disp ('Error: N�mero de par�metros err�neo.');
else
        M1=ceil(M);
        n_y=n(1):(n(2)-n(1))*M1:max(n);
        y=decimate(x,M1);
end;

