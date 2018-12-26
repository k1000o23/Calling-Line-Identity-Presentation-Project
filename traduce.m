function [mensajePLM] = traduce(trama_ml, trama_plm)
% traduce: función que convierte la trama de bits a string y 
% presenta el mensaje final por pantalla 
% Parámetros de entrada:
%   trama_ml: número de octetos (en decimal) a analizar en la trama_plm
%   trama_plm: información que se decodifica según las tablas
% Parámetros de salida:
%   mensajePLM: string final que concatena la info de los parámetros de plm

n = 1;
fecha_hora=0;
id_llamante=0;
mensajePLM = "";                                                                             
while n < trama_ml*10 + 1 
 
    tipo_parametro = bin2dec(char(fliplr(trama_plm(n+1:n+8)) + '0'));
    long_parametro = bin2dec(char(fliplr(trama_plm(n+11:n+18)) + '0')); 
    datos_parametro = trama_plm(n + 20 : n + 20 + 10*long_parametro); 
    
    %para cada parámetro a analizar
    if tipo_parametro == 1
        fecha_hora = aux_fecha(long_parametro, datos_parametro);
    elseif tipo_parametro == 2
        id_llamante = aux_id(long_parametro, datos_parametro); 
    else
        disp("PLM " + tipo_parametro + " no es ni Date and Time ni Calling Line Identity");
    end
 
    n = n + 20 + 10*long_parametro;
end

mensajePLM= [fecha_hora id_llamante];

mensajePLM = "Mes: "+ mensajePLM(1) + mensajePLM(2) + ". Día: " + mensajePLM(3) + mensajePLM(4) + ". Hora: " + mensajePLM(5) + mensajePLM(6) + ":"+mensajePLM(7)+  mensajePLM(8) + ". Desde el número: " + id_llamante(1) + id_llamante(2) + " "+id_llamante(3)+id_llamante(4) + id_llamante(5)+ " " +id_llamante(6) + id_llamante(7)+ " " + id_llamante(8) + id_llamante(9) + ".";

end

