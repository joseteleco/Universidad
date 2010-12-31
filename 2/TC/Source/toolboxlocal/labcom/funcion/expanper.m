function expanper=expanper(fun,T,t)
% function expanper=expanper(fun,T,t)
% Funi�n qu realiza la expansi�n peri�dica de la funci�n fun con el
% per�odo T.
%PARAMETROS DE ENTRADA:
%	fun: 	funci�n cuya expansi�n peri�dica deseamos realizar.
%	T: 	per�odo de la funci�n expandida.
%	t: 	rango de valores de la funci�n fun.
%PARAMETROS DE SALIDA
%	expanper: expansi�n peri�dica de la funci�n fun.

suma=fun;
desplazamiento=T;
while desplazamiento < 2*max(t) 			%se escoge 2*max(t)
	sumando2=retardar(fun,desplazamiento,t);
	suma=suma+sumando2;			        %porque en ese momento
	desplazamiento=desplazamiento+T;		%estamos seguros de
end;							%que habremos reali-
desplazamiento=-T;					%zado todos los posi-
while abs(desplazamiento) < 2*max(t)			%desplazmientos de la
	suma=suma+retardar(fun,desplazamiento,t);	%funci�n fun y sus
	desplazamiento=desplazamiento-T;		%respectivas sumas.
end;
expanper=suma;
