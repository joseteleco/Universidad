function integrar=integrar (x)
% function integrar=integrar (x)
% Funci�n que integra una funci�n introducida como par�metro.
% PARAMETROS DE ENTRADA:
%               x:  se�al a integrar.
% PARAMETROS DE SALIDA:
%               integra: se�al de salida, integral de x.

integrar=cumsum(x);

