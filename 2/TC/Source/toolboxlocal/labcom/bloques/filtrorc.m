function [y,t]=filtrorc (x, t, RC)
% function y=filtrorc (x, t, R, C)
% Funci�n que filtra la se�al introducida como par�metro con
% un filtro RC pasobajo.
% PARAMETROS DE ENTRADA:
%	x:	se�al a filtrar.
%	t:	dominio de definici�n de la se�al a filtrar.
%	RC:	valor de la constante del filtro.
% PARAMETROS DE SALIDA:
%	y:	se�al filtrada.

% Calculamos la respuesta frecuencial de la se�al

fftpts=length(x);
n = fftpts/2;
ts=t(2)-t(1);
freq = 2*pi*(1/ts); 	% Multiplicamos por 2*pi para tener radianes
w = freq*(0:n-1)./(2*(n-1));
y1=1./(1+i*RC*w);
y2=abs(ifft(y1,fftpts))*length(y1);
yf=conv(x,y2);
y=yf(ceil(fftpts/2):ceil(fftpts/2)+fftpts-1);
t=0:ts:ts*(length(y)-1);

