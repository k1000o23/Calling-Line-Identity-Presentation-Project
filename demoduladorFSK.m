function [z]=demoduladorFSK(x,fs)
%función que realiza una demodulación de la señal de entrada FSK y %proporciona la
% correspondiente salida en banda base
%Parametros de entrada
% x: secuencia modulada que es la entratrada al demodulador
% fs: frecuencia de muestreo
%Parámetros de salida
% z: secuencia de salida demodulada

%Filtro1
Wn1=[900/(fs/2) 1700/(fs/2)];
[B1,A1]=ellip(2,0.5,20,Wn1); % B,A: coeficientes del numerador y denominador que describen el filtro
x1=filter(B1,A1,x); %Señal filtrada

%Filtro0
Wn0=[1700/(fs/2) 2500/(fs/2)];
[B0,A0]=ellip(2,0.5,20,Wn0);
x0=filter(B0,A0,x); 

%Rectificador
r1=abs(x1).^2;
r0=abs(x0).^2;

%FIR
h=[1/3 1/3 1/3];
z1=filter(h,1,r1);
z0=filter(h,1,r0);

%Señal demodulada
z = z1-z0;

end

