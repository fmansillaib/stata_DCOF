# [[STATA]: Discrimination Capacity of Features (dcof.ado)](https://drive.google.com/open?id=15rDmvm-mMWcooGO6Rxw0jwr5y76AX3SX&authuser=fmansilla%40fen.uchile.cl&usp=drive_fs) 

- #### Creado, por: Franco A. Mansilla Ibañez, Chile.
- email: franco.andres.mansilla@gmail.com
- Linkedin: https://www.linkedin.com/in/francomansilla/
- Medium: https://medium.com/@fmansillaib

`versión 1.0- 07/2022`

## Descripción: 

1. Es un código que te permite evaluar estadísticamente si una o un set de variables (usualmente x(s)) discriminan tu variable grupo.
2. El código utiliza una prueba de diferencias de varianza (Fisher) y luego si define una prueba de diferencias de medias con la t-Student, en función a los resultados de Fisher si las varianza son iguales o desiguales entre grupos.
3. Te arroja una matriz con n filas (según cantidad de variables), con: Media Grupo 1; Media Grupo 2; Estadístico t; p-value T; p-value F
4. Si tu escoger ordenar en el comando al ejecutar, se ordenara de mayor a menor el estadístico t (se encuentra en valor absoluto).


## Instalación:
- Paso 1: Descargar el archivo [finesse.ado](https://drive.google.com/open?id=15rDmvm-mMWcooGO6Rxw0jwr5y76AX3SX&authuser=fmansilla%40fen.uchile.cl&usp=drive_fs)
- Paso 2: Ir a la carpeta de Stata (usualmente Disco C) -> Carpeta ado -> Guardar archivo en letra “D”.
- Paso 3: Cerrar y Abrir Stata. 
- Paso 4: Utilizar código.

## Syntax 

En stata llamar, código:

```stata
  dcof var_x (var's_x), var_y (variable) lvl_conf (#) sample (variable) sort (#)
```

- **var_x:** Señalar la(s) variable(s) en que el código analizara. 
- **var_y:** Señalar una única variable (grupo).
- **lvl_conf:** Señalar un único numero. Por ejemplo: 90; 95 o 99 (sin el %).
- **sample:** Señalar si lo quieres para toda la muestra (poner: all_sample). Si lo quiere para una muestra especial cree una variable marcando con las observaciones para el análisis. 
- **sort:** Señalar un 1 si quiere ordenar la variable “t-Student”, en el caso contrario 0. 

## Alcance:

1. Código solo se puede aplicar para grupo de variables dicotómicas. 
2. Código solo se puede utilizar para diferencias de medios, no establecer una valor especifico en la hipótesis. 

## OUTPUT Ejemplo:
![ejemplo output](https://github.com/fmansillaib/stata_Finesse/blob/main/1.ejemplo_output.png)

