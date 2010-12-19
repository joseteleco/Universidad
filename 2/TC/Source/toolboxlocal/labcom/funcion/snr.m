function s_n_r=snr(xh,x)
%       s_n_r= snr (xh, x)
%       Funci�n que calcula la relaci�n se�al a ruido en dB de una se�al
%	cuantificada.
% PAR�METROS DE ENTRADA:
%               xh= quantized signal.
%               x = original signal.
% PAR�METRO DE SALIDA:
%               s_n_r = SNR in dBs.

error=x-xh;
x=x.*x;
error=error.*error;
s_n_r=10*log10(sum(x)/sum(error));


