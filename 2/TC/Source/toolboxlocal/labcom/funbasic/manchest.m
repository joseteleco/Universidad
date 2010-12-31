function [y,t] = manchest(Rb,msg,fs)
%function [y,t] = manchest(Rb,msg,fs)
%%MANCHEST  Se�al con c�digo Manchester [-1, 0, 1].
%	MANCHEST (Rb,MSG) - Genera una se�al en banda base
% 	con c�digo Manchester sin retorno a cero de velocidad
%	Rb bits por segundo, con la forma especificada en MSG. La 
%	entrada MSG debe ser un vector de 1's y 0's. La 
%	frecuencia de muestreo por defecto es FS = 8192 Hz.
% PARAMETROS DE ENTRADA:
%	Rb:	velocidad en bits por segundo.
%	msg:	se�al binaria a codificar.
%	fs: 	frecuencia de muestreo de la se�al generada.
% PARAMETROS DE SALIDA:
%	y:	se�al bipolar generada.
%	t:	dominio temporal de definici�n.


if nargin==2
	fs=8192;
end;

positivos=zeros(1,2*length(msg));
negativos=zeros(1,2*length(msg));

for indice=1:length(msg)
	if msg(indice)==1
		negativos(2*indice)=1;
		positivos(2*indice-1)=1;
	else
		negativos(2*indice-1)=1;
		positivos(2*indice)=1;
	end;
end;
y=uniponrz (2*Rb,positivos,fs)-uniponrz (2*Rb,negativos,fs);
t=0:1/fs:(length(y)-1)/fs;
