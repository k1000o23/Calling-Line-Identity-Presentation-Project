function [bits2]=verifica_80(bits)
% verifica_80: función que comprueba que los 80 bits (Mark Signal)
% son unos y los extrae de la secuencia de bits. En caso de que no sea correcto
% termina la ejecución y devuelve error si los 80 bits no son 1
% Parametros de entrada
%   bits: secuencia de salida de la función deSimbolosABits
% Parámetros de salida
%   bits2: secuencia de bits sin los 80 unos del Mark Signal
bits2 = [];
for i=1:(length(bits)-80)
if i+80 < length(bits)
test = all(bits(i:(i+80)) > 0);
    if test == 1
        bits(1:(i+80)) = []; 
        bits2 = bits;        
    end
end
end
if isempty(bits2)
     bits2= 'ERROR AL VERIFICAR LOS PRIMEROS 80 BITS';
end 
end
