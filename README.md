# Calling-Line-Identity-Presentation-Project
Implementación del servicio CLIP con Matlab (se adjunta la norma con todas las especificaciones de codifiacicón.

## Desarrollo del proyecto

El Instituto Europeo de Normalización de las Telecomunicaciones, en adelante ETSI, ha elaborado la normativa
ETS 300 659-1 según la cual las Operadoras Telefónicas europeas envían, sobre el bucle de abonado telefónico
analógico, información acerca de la llamada entrante. En el servidor del laboratorio dispone de una copia de la
normativa para consulta. También dispone de una copia de la normativa ITU-T V.23, MODEM base de la
normativa ETSI.
En España Telefónica ofrece este servicio con las siguientes características:
1. Señalización, RING corto inicial
2. Envío de la hora, fecha y número del llamante
3. Channel Seizure Signal, bloque de 290 bits de “0”s y “1”s alternados (empieza en 0 y acaba en 1).
4. Mark Signal, bloque de 80 bits “marca” (“1”s)

## Objetivo
El objetivo final de este trabajo es la elaboración de un programa MATLAB que tomando como entrada una
señal real (digitalizada en el bucle de abonado) obtenga la hora, fecha y número del llamante. Se dispone de los
ficheros sani.mat, sani1.mat y sani2.mat de tres llamadas diferentes.
