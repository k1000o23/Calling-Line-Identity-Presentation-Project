function [N,muestra150] = encuentraN(z)
% encuentraN: funci�n que extrae el n�mero de muestras por s�mbolo (N) 
% y la �ltima muestra evaluada, a partir de una se�al z
% Par�metros de entrada:
%   z: se�al de salida de la funci�n demoduladorFSK
% Par�metros de salida: 
%   N: n�mero de muestras/s�mbolo
%   muestra150: �ltima muestra evaluada

fs=8000;

%Rectificador
zr=abs(z).^2;

%Filtro Paso Banda:
%Filtro centrado en la frecuencia nominal de baudio (1200Hz)
[Bz1,Az1]=ellip(6,1,50,[1150/(fs/2) 1250/(fs/2)]);
zt=filter(Bz1,Az1,zr); %instantes de muestreo adecuados para la detecci�n
    
indices=[];
contador=0;
N=0;

for i=1:length(z)-1 
    if (zt(i)>=0) && (zt(i+1)<0)
        indices=[indices i];
    end
end

for p=1:length(indices)-1 
    if (z(indices(p))>0 && z(indices(p+1))<0) || (z(indices(p))<0 && z(indices(p+1))>0)
        contador=contador+1;
        if (contador==150)
            muestra150=indices(p);
            N=(indices(p)-indices(p-100))/100;
        end
    else
        contador=contador-1;
    end   
end

end