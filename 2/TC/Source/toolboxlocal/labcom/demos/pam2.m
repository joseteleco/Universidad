% Se�al PAM con c�digo Manchester.
A = 1;
f1 = 2500;
f2 = 4000;
f = 0:200:5000;

% Creaando las se�ales
W = zeros(length(f),1);
for (i = 1:1:length(f));
  W(i) = A*w1(f(i),f1) -A*w2(f(i),f1,f2);
end;

% Creando el espectro del c�digo Manchester
fn = -50000:200:50000;
j = sqrt(-1);
fs = 10000;
Ts = 1/fs;
H = sin(2*pi*fn*Ts/4);
H = H(:);
H = j*Ts*Sa(pi*fn*Ts/2) .* H;

% Creando los espectros de las se�ales PAM
fprintf('Calculando los espectros de las se�ales\n');
W1s = zeros(length(fn),1);
for (i = 1:1:length(fn));
  W1s(i) = 0;
  for (n = -5:1:5)
  % Recreating W(f) from above
    Wtemp = A*w1(fn(i)-n*fs,f1) -A*w2(fn(i)-n*fs,f1,f2);
    W1s(i) = W1s(i) + Wtemp;
  end;
end;
W1s = 1/Ts*H.*W1s;

plot_inf(3);
plot(f,W);
xlabel('f');
title('M�dulo del espectro de la se�al anal�gica');
pause;

plot(fn,abs(H));
xlabel('f');
title('M�dulo del espectro del c�digo Manchester');
pause;

plot(fn,abs(W1s));
xlabel('f');
title('M�dulo del espectro de la se�al PAM de muestreo instant�neo.');



