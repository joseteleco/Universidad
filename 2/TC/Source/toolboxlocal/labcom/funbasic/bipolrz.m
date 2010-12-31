function [y, t] = bipolrz(Rb,msg,fs)
%function [y, t] = bipolrz(Rb,msg,fs)
%BIPOLRZ  Se�al bipolar [-1, 0, 1].
%	BIPOLRZ (Rb,MSG) - Genera una se�al en banda base
% 	bipolar con retorno a cero de velocidad Rb bits por 
%	segundo, con la forma especificada en MSG. La 
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

anterior=-1;
positivos=zeros(1,length(msg));
negativos=zeros(1,length(msg));

for indice=1:length(msg)
	if msg(indice)==1
		if anterior==1
			negativos(indice)=1;
			anterior=-1;
		else
			positivos(indice)=1;
			anterior=1;
		end;
	end;
end;
y=uniporz (Rb,positivos,fs)-uniporz (Rb,negativos,fs);
y=y';
t=0:1/fs:(length(y)-1)/fs;
