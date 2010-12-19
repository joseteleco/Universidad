function dia_ojo (x, t, t0, velocidad)
% function dia_ojo (x, t, t0, velocidad)
% Funci�n que visualiza el diagrama de ojo de una se�al binaria.
% PARAMETROS DE ENTRADA:
%               x: 	se�al a visualizar.
%               t: 	dominio de definici�n de la se�al.
%               t0: 	desfase relativo inicial en el reloj de muestreo en n�mero de bits.
%			'1/3'= un tercio de bit. 
%               velocidad: bits por segundo de la se�al binaria.
% PARAMETROS DE SALIDA:
%               Ninguno.

if nargin~=4
        disp ('Error: n�mero de par�metros err�neo.');
else
        % Abrimos una nueva ventana

        h_fig1 = figure('Unit','pixel','Pos',[200 100 600 500],'Name','Diagrama de ojo');
        set(0, 'CurrentF', h_fig1);
	title ('Diagrama de ojo');
	hold on;

        paso=t(2)-t(1);
%	visualizamos el tiempo de dos bits
	puntos_por_grafico=2/(velocidad*paso); 
        buffer = zeros (1,puntos_por_grafico);
	tvec=0:paso:(puntos_por_grafico*paso);
        t_inicial=(1+t0)/(velocidad*paso);
	m=length(t);
	xlabel ('Tiempo (seg)');

	t_actual=t_inicial;
        while ((t_actual+puntos_por_grafico)<m)
                buffer=x(t_actual:t_actual+puntos_por_grafico);
		plot (tvec,buffer);
		t_actual=t_actual+puntos_por_grafico/2;
        end
        disp ('Pulsar una tecla para terminar');
%         pause;
        disp ('Finalizado');
	hold off;
%         close;
end;
