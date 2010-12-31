function [y,t_y]=det_env (x,t_x,K)
% function [y,t_y]=det_env (x,t_x,K)
% Funci�n de detecci�n de envolvente. Obtiene la envolvente de una se�al
% simulando el paso por un filtro RC de constante K.
% PARAMETROS DE ENTRADA:
%               x:   se�al de entrada.
%               t_x: dominio de definici�n de la se�al de entrada.
%               K:   constante del filtro RC.
% PARAMETROS DE SALIDA:
%               y:   envolvente de la se�al de entrada.
%               t_y: dominio de definici�n de la se�al de salida. En
%                    este caso ser� el mismo que el de entrada.

if nargin~=3
        disp ('Error: N�mero de par�metros err�neo.');
else
        indice=1;
        t_aterior=t_x;
        t_y=t_x;
        x_anterior=0;
        y=x;
        
        while (indice<=size(x,2))
                if (x(indice)>=x_anterior)
                        x_anterior=x(indice);
                        y(indice)=x(indice);
                        t_anterior=t_x(indice);
                else
                        y(indice)=x_anterior*exp(-(t_x(indice)-t_anterior)/K);
                        x_anterior=y(indice);
                end
                indice=indice+1;
        end
end                

