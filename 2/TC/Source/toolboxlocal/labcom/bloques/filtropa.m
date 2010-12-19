function y = filtropa (x, t_x, fc, orden, db)
% function y = filtropa (x, t_x, fc, orden, db)
% Funci�n que filtra pasoalto la se�al de entrada.
% La frecuencia de corte puede variar entre 0 y la mitad de la frecuencia
% de muestreo.
% PARAMETROS DE ENTRADA;
%               x:   se�al de entrada a filtrar.
%               t_x: dominio de definici�n.
%               fc:  frecuencia de corte del filtro.
%               orden: orden del filtro.
%               db:  atenuaci�n en DBs de las frecuencias bajas.
% PARAMETROS DE SALIDA:
%               y:   se�al filtrada pasoalto.

if nargin~=5
        disp ('Error: N�mero de par�metros err�neo.');
else
        % Comprobamos la frecuencia de corte
        fs= 1/(t_x(2)-t_x(1));
        u=2*fc/fs;
        if (u>=1)
                error ('La frecuencia de corte debe ser menor que la mitad de la frecuencia de muestreo');
        end
        [B,A]=cheby2 (orden, db, u, 'high');
        y=filter (B,A,x);
end;        
