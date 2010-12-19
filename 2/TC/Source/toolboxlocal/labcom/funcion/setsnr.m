function [y,sigma] = setsnr(signal,noise,SNR);
%SETSNR   Set signal-to-noise ratio.
%       [Y,SIGMA] = SETSNR(SIGNAL,NOISE,SNR) 
%       Devuelve una la se�al 'y' como suma de la se�al de entrada 'signal'
%	y el ruido 'noise' ajustando la potencia de �ste en el ancho 
%	de banda de 0 Hz hasta fs/2 de modo que la relaci�n se�al/ruido
%	sea igual a SNR dB.
%	La se�al de salida se define seg�n:
%           x[n] = s[n] + sigma * w[n]                        
%       donde sigma se calcula seg�n:
%                           (     Var(s[n])      )
%           SNR = 10 * log10(--------------------)
%                           (      2             )
%                           ( sigma  * Var(w[n]) )
%       donde SNR es la relaci�n S/N deseada.
%	Se ajusta la amplitud del ruido, no el de la se�al.
%       solved for sigma, x[n] can be generated.  Note, only 
%       [Y,SIGMA] = SETSNR(SIGNAL,SNR) genera y a�ade
%       ruido gaussiano blanco para obtener la relaci�n SNR.

% check the args
if nargin == 2,
    SNR = noise;
    noise = randn(size (signal));
elseif nargin ~= 3,
    error('setsnr: Invalid number of arguments...');
end;

% figure out if we have vectors
if min(size(signal)) ~= 1,
    error('setsnr: Input arg "signal" must be a 1xN or Nx1 vector...');
end;
if min(size(noise)) ~= 1,
    error('setsnr: Input arg "noise" must be a 1xN or Nx1 vector...');
end;

% check lengths
if length(signal) ~= length(noise),
    error('setsnr: Signal and noise vectors are not same lengths...');
end;

% compute mulitiplier to adjust amplitude of noise
sigma = std(signal)^2 / (std(noise)^2 * 10^(SNR/10));

% adjust noise and add the two together
y = signal + sqrt(sigma) * noise;
