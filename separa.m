function [trama_mt, trama_ml, trama_plm] = separa(bits2)

nOct = 0;
ml_length = bin2dec(char(fliplr(bits2(12:19)) + '0'));
for i=1:10:(length(bits2)-10)
    nOct = nOct + 1;
    if bits2(i) ~= 0  && i < 10 + 10*ml_length%bit start
        disp("ERROR en el bit START nº" + i); 
    elseif bits2(i + 9) ~= 1   && i+9 < 30 + 10*ml_length %bit stop
        aux = i + 9;
        disp("ERROR en el bit STOP nº" + aux);
    end
end
%Trama MT
if length(bits2) == 39 
    bits2 = zeros(100);
end
mt_str = bin2dec(char(fliplr(bits2(2:9)) + '0'));
if mt_str == 128
    trama_mt = "Call Setup";
    %trama_mt = 10;
else
    trama_mt = "NO es Call Setup";
    %trama_mt = 19;
end
%fin trama MT
%Trama ML
%disp("Longitud de la trama PLM: "+ ml_length + " octetos");
if ml_length > (nOct - 2)
   trama_ml = "La longitud de la trama es mayor que el número de octetos."; 
   ml_length = 0;
else
    trama_ml = ml_length;
end
%fin trama ML
%trama PLM
trama_plm = bits2(21:21+ml_length*10);
%fin trama PLM
%checksum
%parte 1 
suma = 0;
for i = 2:10:(20 + ml_length*10)
    suma = suma + bin2dec(char(fliplr(bits2(i:(i+7))) + '0'));
end
checksum_dec = bin2dec(char( fliplr( bits2( (22 + 10*ml_length) : (22 + 10*ml_length + 7) )) + '0' ));  
total = mod(suma,256) + checksum_dec;
if total - 256 ~= 0
    disp("esperado: " + total);
    disp("Error al verificar el checksum");
else
    % disp("Checksum OK"); %SOLO lo mostramos si da error
end
%fin checksum
end
