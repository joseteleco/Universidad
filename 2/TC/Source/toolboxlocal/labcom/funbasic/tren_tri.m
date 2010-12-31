function tren_tri=tren_tri (ancho,altura,periodo,t)
%function tren_tri=tren_tri (ancho,altura,periodo,t)
% Funci�n que genera un tren de pulsos en forma de diente de sierra.
% 			|\____|\____|\____|\___
% PARAMETROS DE ENTRADA:
%      	ancho: anchura del tri�ngulo.
%       altura: altura del tri�ngulo.
%	periodo: periodo de los tri�ngulos.
%	t: rango de valores o dominio de definici�n.
% PARAMETROS DE SALIDA:
%	tren_tri: tren de tri�ngulos.

if nargin~=4
        disp ('Error: N�mero de par�metros err�neo.');
else
	tren=triangu (ancho,altura,t);
	tren_tri=expanper (tren,periodo,t);
end
