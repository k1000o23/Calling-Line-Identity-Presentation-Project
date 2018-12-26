%%función auxiliar para la fecha y hora
function [res_fecha] = aux_fecha(long_parametro, trama_fecha) 
% aux_fecha: analiza la trama del parámetro fecha y hora según las tablas
% Parametros de entrada:
	%  long_parametro:longitud del parámetro
	%  trama_fecha: parámetro obtenido al recorrer la trama_plm y 
    %  comprobar que es tipo fecha y hora
% Parametro de salida:
	%  res_fecha : string con la fecha	
res_fecha = [];
for i=1:10:(long_parametro*10) 
    if bin2dec(char(fliplr(trama_fecha(i+5:i+7)) + '0')) == 3
        data = trama_fecha(i+1:i+4);
    else
        data = zeros(4); 
    end
    datos = bin2dec(char(fliplr(data) + '0'));
    res_fecha = [res_fecha datos];  
end

end