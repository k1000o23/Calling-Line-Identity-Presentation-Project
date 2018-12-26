function [bits] = deSimbolosABits(z,N,muestra150)
% deSimbolosABits: extrae los 1s y los 0s de la señal z
% Parámetros de entrada:
%   z: señal de salida de la función demoduladorFSK
%   N: "frecuencia de muestreo" (muestras/símbolo) con la
%   que muestreamos la señal z
%   muestra150: ("último símbolo muestreado") última 
%   muestra que hemos decodificado con la función encuentraN
% Parámetros de salida: 
%   bits: array con la secuencia de 1s y 0s
bits = [];
i  = muestra150;
while i < length(z)
    if z(round(i)) > 0
        bits = [bits 1];
    else
        bits = [bits 0];
    end
    i = i + N;
end
end

