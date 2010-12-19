function desplaza=desplaza(fun,n,t)
%funcion desplaza=desplaza(fun,n,t) 
% Realiza el desplazamiento de la funci�n fun n puntos a la derecha 
% o a la izquierda.
% PARAMETROS DE ENTRADA:
%	fun: 	funci�n cuyo desplazamiento vamos a realizar.
%	n: 	n�mero de puntos que vamos a desplazar la funci�n.
%	t: 	rango de valores o dominio de definici�n de la funci�n t.
%PARAMETROS DE SALIDA:
%	desplaza: funci�n fun desplazada n puntos.

array=0 .*t;
if n>0
	union=[zeros(1,n),fun];		%funci�n ya desplazada, pero ahora
					%deberemos eliminar los puntos
					%en exceso.
	desplaza=union(:,1:length(t));
elseif n<0 & abs(n)<=length(t)
	funtruncada=fun(:,abs(n)+1:length(t));	%valores de la funci�n fun
						%que no se perder�n.
	desplaza=[funtruncada,zeros(1,abs(n))];
elseif n<0 & abs(n)>length(t)
	desplaza=zeros(1,length(t));
else
	desplaza=fun;
end;
