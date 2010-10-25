function mensaje=det_bin (x,t,t0,Fs,Vlim,sentido)
% function mensaje=det_bin (x,t,t0,Fs,Vlim,sentido)
% 	Funci�n que muestrea una se�al a una frecuencia de Fs y decide
%	el valor digital de la se�al muestreada seg�n el umbral Vlim.
% PARAMETROS DE ENTRADA:
%	x:	se�al a muestrear.
%	t:	dominio de definici�n.
%	t0:	retardo incial para empezar a muestrear.
%	Fs:	frecuencia de muestreo.
%	Vlim:	umbral de detecci�n. 
%	signo:	Si es 'n', a un valor inferior a Vlim se le asigna
%		un '1' y a uno superior un '0', si el cualquier otra
%		cosa, se asignan al rev�s, si se introduce m�s de un 
%		car�cter da errores.
% PARAMETROS DE SALIDA:
%	mensaje: se�al binaria detectada.
frec_muestreo=1/(t(2)-t(1));
paso=1/Fs*frec_muestreo;
indice=round(t0*frec_muestreo+1);
mensaje=[];
m=length(t);
while (indice<m)
	if (x(indice)>Vlim)
		if (sentido=='n')
			mensaje=[mensaje 0];
		else
			mensaje=[mensaje 1];
		end;
	else
		if (sentido=='n')
			mensaje=[mensaje 1];
		else
			mensaje=[mensaje 0];
		end;
	end;
	indice=indice+paso;
end;
