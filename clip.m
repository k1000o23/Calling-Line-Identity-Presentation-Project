clc, clear;
load sani1;
load sani2;
load sani3;
fs=8000;
x1 = sani1;
x2 = sani2;
x3 = sani3;

%Primer mensaje%
disp(" ");
disp("---------- Primer mensaje ----------");
z=demoduladorFSK(x1,fs);
[N, muestra150] = encuentraN(z);
bits = deSimbolosABits(z,N,muestra150);
bits2 = verifica_80(bits);
[trama_mt, trama_ml, trama_plm] = separa(bits2);
disp("Tipo de mensaje: " + trama_mt);
[mensajePLM] = traduce(trama_ml, trama_plm);
disp(mensajePLM);

%Segundo mensaje%
disp(" ");
disp("---------- Segundo mensaje ----------");

z=demoduladorFSK(x2,fs);
[N, muestra150] = encuentraN(z);
bits = deSimbolosABits(z,N,muestra150);
bits2 = verifica_80(bits);
[trama_mt, trama_ml, trama_plm] = separa(bits2);
disp("Tipo de mensaje: " + trama_mt);
[mensajePLM] = traduce(trama_ml, trama_plm);
disp(mensajePLM);

%Tercer mensaje%
disp(" ");
disp("---------- Tercer mensaje ----------");
z=demoduladorFSK(x3,fs);
[N, muestra150] = encuentraN(z);
bits = deSimbolosABits(z,N,muestra150);
bits2 = verifica_80(bits);
[trama_mt, trama_ml, trama_plm] = separa(bits2);
disp("Tipo de mensaje: " + trama_mt);
[mensajePLM] = traduce(trama_ml, trama_plm);
disp(mensajePLM);