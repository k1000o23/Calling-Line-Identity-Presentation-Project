%%función auxiliar para el id_llamante
function [res_id] = aux_id(long_parametro, trama_id) 
% aux_id: analiza la trama del parámetro id_llamante según las tablas
% Parametros de entrada:
	%  long_parametro: longitud del parámetro
	%  trama_id:parametro obtenido al recorrer la trama_plm y 
    %  comprobar que es tipo identificación del llamante
    % Parametro de salida:
	%  res_id : string con la id del llamante
originCall = [];
fincall = [];
for i=1:10:long_parametro*10-9   
    nOct = trama_id(i+1:i+8);
    datos = bin2dec(char(fliplr(nOct) + '0'));
    originCall = [originCall datos];
        if bin2dec(char(fliplr(trama_id(i+5:i+7)) + '0')) == 3
            data = trama_id(i+1:i+4);
        else
            data = zeros(4); 
        end
        datos = bin2dec(char(fliplr(data) + '0'));
    fincall = [fincall datos];
end
res_id = fincall;
end