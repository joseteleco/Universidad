s=0;
s=Menu('Introduce el numero de ejercicio','1','2','3','4','5','6','7','salir');
if s~=8
    switch s
        case 1
            t=-2:10^-3:2;
            si=rectpuls(t);
            a=rectpuls(t+1);
            b=rectpuls(t-1);
            c=rectpuls(t/2);
            d=rectpuls(t*2);
            e=rectpuls(-t);
            
            hold on;
            subplot(3,2,1);
            plot(t,si);
            
            subplot(3,2,2);
            hold on;
            plot(t,a,'r');
            plot(t,si,'b');
            
            subplot(3,2,3);
            hold on;
            plot(t,b,'r');
            plot(t,si,'b');
            
            subplot(3,2,4);
            hold on;
            plot(t,c,'r');
            plot(t,si,'b');
            
            
            subplot(3,2,5);
            hold on;
            plot(t,d,'r');
            plot(t,si,'b');
            
            
            subplot(3,2,6);
            hold on;
            plot(t,e,'r');
            plot(t,si,'b');
            break;
        case 2
            t=-2:10^-3:2;
            
            subplot(3,1,1);
                hold on;
                a=tripuls(-1*(t+1));
                b=tripuls(-t+1);
                plot(t,a,'b');
                plot(t,b,'r');
                
            subplot(3,1,2);
                hold on;
                c=tripuls((t+1)/2);
                d=tripuls((t/2)+1);
                plot(t,c,'b');
                plot(t,d,'r');
                
            subplot(3,1,3);
                hold on;
                e=triplus((-t)/2);
                f=triplus(-(t/2));
                plot(t,e,'b');
                plot(t,f,'r');
            break;
        case 3
            t=-2:10^-3:2;
            
            subplot(2,2,1);
                hold on;
                a=tripuls(3*t-1);
                b=tripuls(-2*t+1);
                c=tripuls((t-1)/3);
                d=tripuls((-t+2)/4);
                x=tripuls(t);
                
                plot(t,x);
                plot(t,a);
                
            subplot(2,2,2);
            
                hold on;
                plot(t,x);
                plot(t,b);
                
            subplot(2,2,3);
            
                hold on;
                plot(t,x);
                plot(t,c);
                
            subplot(2,2,4);
            
                hold on;
                plot(t,x);
                plot(t,d);
            
            break;
            
        case 4
            t=-7:10^-3:7;
            
            x=tripuls((t-3)/4)+rectpuls((t-5)/3);
            pu=(tripuls((-t-3)/4)+rectpuls((-t-5)/3));
            pa=-(tripuls((-t-3)/4)+rectpuls((-t-5)/3));
            
        
            
            par=(x+pu)/2;
            impar=(x+pa)/2;
            hold on;
            plot(t,x,'g');
            plot(t,par,'b');
            plot(t,impar,'r');
            hold off;
            break;
        case 5
            
            t=0:10^-6:0.005;
            
            x=5*cos(2*pi*10^3*t-(pi/4));
            
            a=input('daleeeee');
            
            y=5*cos(2*pi*a*t-(pi/4));
            hold on;
            plot(t,x);
            plot(t,y,'g');
            plot(t,y+x,'r');
            hold off;
            
        case 6
            t=0:10^-6:0.08;
            x=3*exp(2*pi*50*t*i);
            r=real(x);
            im=imag(x);
            z=2;
            while z~=1 
                m=input('dale al complejo otra!!!');
                n=input('dale al armonico ahi petandola!!!');
                subplot(2,1,1);
                
                plot(t,r);
                hold on;
                a=m*exp(2*pi*50*t*n*1i);
                plot(t,real(a),'r');
                hold off;
                subplot(2,1,2);
                
                plot(t,im);
                hold on;
                plot(t,imag(a),'g');
                
                hold off;
            end
            break;
            
        case 7
            t=0:10^-6:0.08;
            x=3*exp(2*pi*50*t*1i);
            k=input('metele el complejo!');
            while k~=1
                
                armonico=input('metele el armoonicoooo to loco ahi!!');
                
                z1=k*exp(2*pi*50*t*1i*armonico);
                z2=k*exp(2*pi*50*t*1i*-armonico);
                
                plot(t,real(x)+real(z1)+real(z2));
                k=input('metele el complejo!');
                
                
                
            end
          
            
   
    end
            
end







