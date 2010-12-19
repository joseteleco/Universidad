function x=idft_disc(esp,n)
% Funcion que sintetiza una se�al de tiempo discreto a partir de su espectro
%
% function x=idft_disc(esp,n)
%
% Parametros de entrada
%   esp: espectro de la se�al x
%   n: dominio de definicion de la se�al x
% Parametros de salida
%   x: se�al
ln=length(n)-1; %N puntos del eje de tiempos
k=-ln/2:ln/2; %Rango de definicion
%Calculo de la IDFT
wn=exp(-j*2*pi/ln);
nk=n'*k;
wnnk=wn.^(-nk);
x=esp*wnnk/ln;