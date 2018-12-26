function [bits] = deSimbolosABits(z,N,muestra150)
% deSimbolosABits: extrae los 1s y los 0s de la se�al z
% Par�metros de entrada:
%   z: se�al de salida de la funci�n demoduladorFSK
%   N: "frecuencia de muestreo" (muestras/s�mbolo) con la
%   que muestreamos la se�al z
%   muestra150: ("�ltimo s�mbolo muestreado") �ltima 
%   muestra que hemos decodificado con la funci�n encuentraN
% Par�metros de salida: 
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

