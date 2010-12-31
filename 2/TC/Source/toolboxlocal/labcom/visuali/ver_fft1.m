function ver_fft1 (x, t, fftpts, fre_visu, n_ite)
% function ver_fft1 (x, t, fftpts, fre_visu, n_ite)
% Funci�n que visualiza gr�ficamente una se�al y su espectro.
% PARAMETROS DE ENTRADA:
%               X:    	se�al a visualizar.
%               t:    	dominio de definici�n de las se�ales moduladas
%               fftpts: n�mero de puntos para hacer la fft.
%               fre_visu: n�mero de puntos nuevos en cada visualizaci�n.
%  (opcional)	n_ite:	n�mero de iteraciones a visualizar.
% PARAMETROS DE SALIDA:
%               Ninguno.

if ((nargin==4)|(nargin==5))
	if (nargin==4)
		n_ite=length(x);
	end;
        % Abrimos una nueva ventana
        % Para resoluci�n 800x600
        h_fig1 = figure('Unit','pixel','Pos',[100 100 600 500],'Name','Se�al X');
        % Para resoluci�n 1024x728
        %h_fig1 = figure('Unit','pixel','Pos',[200 100 600 500],'Name','Se�al X');
        set(0, 'CurrentF', h_fig1);
        
        %subplot211
        handels(1) = subplot(311);
        handels(2) = plot(0,0,'m','EraseMode','None');
        handels(3) = get(handels(1),'Title');
        set(handels(1),'Visible','off');
        
        %subplot212
        handels(4) = subplot(312);
        handels(5) = plot(0,0,'EraseMode','None');
        handels(6) = get(handels(4),'Title');
        set(handels(4),'Visible','off');
        
        %subplot313
        handels(7) = subplot(313);
        handels(8) = plot(0,0,'EraseMode','None');
        handels(9) = get(handels(4),'Title');
        set(handels(7),'Visible','off');
        
        set(h_fig1, 'UserData', handels);
        set(h_fig1,'NextPlot','new');
        
        handels = get(h_fig1,'UserData');
        buffer = zeros (1,fftpts);
        
        ts=t(2)-t(1);
        indice=1;
        m=size(x,2);
        
                n = fftpts/2;
                freq = 2*pi*(1/ts); % Multiply by 2*pi to get radians
                w = freq*(0:n-1)./(2*(n-1));
        
        
        while (((indice+fftpts)<m)&(n_ite>0))
                buffer = [buffer(fre_visu+1:fftpts) x(indice:(indice+fre_visu))];
        
                y=buffer;
        
                g = fft(y(1:fftpts),fftpts);
                         
                g = g(1:n)/length(g);
                ffts = abs(g);
        
                tvec = t(indice:(indice+fftpts));
                set(handels(1),'Visible','on','Xlim',[min(tvec) max(tvec)],'Ylim',[min(buffer*.99) max(buffer*1.01+eps)])
                set(handels(2),'XData',tvec,'YData',buffer)
                set(handels(3),'String','Tiempo')
                xl = get(handels(1),'Xlabel');
                set(xl,'String','Tiempo (seg)')
        
                tmp = 'Espectro';
        
                ysc = ffts(~isnan(ffts));
                if isempty(ysc)
                        ysc=[0 1];
                else
                        ysc = sort([min(ysc*.99), max(ysc*1.01+eps)]);
                end;
                set(handels(4),'Visible','on','Xlim',[min(w(2:n)/(2*pi)), max(w(2:n)/(2*pi))],'Ylim',ysc);
                set(handels(5),'XData',w(1:n)/(2*pi),'YData',ffts);
                set(handels(6),'String', tmp);
                xl = get(handels(4), 'Xlabel');
                set(xl,'String','Frequency (Hz)')
                yl = get(handels(4), 'Ylabel');
                set(yl, 'String','Modulo')                 
        
                %For phase plot,
                phase = angle(g);
                phase = phase(2:n);
                ysc = 180/pi*phase(~isnan(phase));
                if isempty(ysc)
                        ysc=[0 1];
                else
                        ysc = sort([min(ysc*.99), max(ysc*1.01+eps)]);
                end;
                set(handels(7),'Visible','on','Xlim',[min(w(2:n)/(2*pi)) max(w(2:n)/(2*pi))],'Ylim',ysc)
                set(handels(8),'XData',w(2:n)/(2*pi),'YData',phase)
                set(handels(9), 'String',tmp)
                xl = get(handels(7), 'Xlabel');
                set(xl, 'String', 'Frecuencia (Hz)')
                yl = get(handels(7), 'Ylabel');
                set(yl, 'String','Grados')                 
        
                % Aumentamos el indice para la siguiente iteraci�n
                indice=indice+fre_visu;
                drawnow;
		n_ite=n_ite-1;
        end
        disp ('Pulsar una tecla para terminar');
        pause;
        disp ('Finalizado');
        close;
else
        disp ('Error: N�mero de par�metros err�neo.');
end;
