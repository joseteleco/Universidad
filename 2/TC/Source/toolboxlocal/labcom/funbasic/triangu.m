function [triangu,t]=triangu(anchura,altura,Fs)
%Funci�n tri�ngulo(anchura, altura,Fs)
%PARAMETROS DE ENTRADA:
%	anchura: anchura del pulso triangular.
%	altura:	altura delpulso triangular.
%	Fs:	frecuencia de muestreo.
%PARAMETROS DE SALIDA:
%	triang: la propia funci�n tri�ngulo.
%	t:	dominio de definici�n.
pulso=ones(1,anchura*Fs/2);
triangu=conv(pulso,pulso);
triangu=triangu/max(triangu)*altura;
t=0:1/32000:(length(triangu)-1)/32000;
