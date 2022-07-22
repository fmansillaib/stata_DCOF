
* Santiago de Chile
* 07/2022
* ---------------------- *
* Ejemplo Código FINESSE *
* ---------------------- *
* Franco A. Mansilla Ib.

* Base de Datos *
sysuse auto, clear 

* Limpieza * 
drop make 

* Lista de variables *
ds foreign, not
global var_x = r(varlist)

* Finesse sin marca: TODA LA MUESTRA*
finesse $var_x, var_y(foreign) lvl_conf(90) sample(all_sample) sort(1)

*RESULTADO:
*A[10,5]
*              Media Grp A  Media Grp B    t-Student       pval_t  pval_fisher
*  gear_ratio    2.8065385    3.4583892    10.781144            0         .101
*        turn    41.442308    35.306122     10.58495            0            0
*displacement    233.71154    115.02766    9.6585342            0            0
*      weight    3317.1154    2344.3826    8.4897212            0         .001
*      length    196.13462    168.27107    8.1696614            0         .011
*       rep78    3.1538462    4.2653061    6.7773842            0         .044
*       trunk        14.75    10.755102    5.3987817            0         .018
*         mpg    19.826923    24.877551    4.7660457            0         .134
*    headroom    3.1538462    2.6428571     3.542728         .001            0
*       price    6072.4231    6668.9793    1.0237163         .308         .386




* Marca aleatoria.
set seed 42

gen marca = runiform()
replace marca = 1 if marca >= 0.3
replace marca = 0 if marca < 0.3
tab marca 
	
* Lista de variables *
ds foreign marca , not
global var_x = r(varlist) 

* Finesse con marca * 
finesse $var_x, var_y(foreign) lvl_conf(90) sample(marca) sort(1)

*              Media Grp A  Media Grp B    t-Student       pval_t  pval_fisher
*displacement    235.05556        109.1    9.0000932            0            0
*  gear_ratio    2.7933333        3.545    8.7176221            0         .563
*        turn    41.138889         35.3    8.1871497            0            0
*      weight    3319.1667       2285.5     7.167622            0         .088
*      length    195.83333       167.25    6.0481367            0          .14
*       rep78            3    4.2105263    5.5044414            0         .657
*       trunk    14.972222         11.1    3.7336647            0         .329
*         mpg    19.694444         25.5    3.5375258         .001         .074
*    headroom    3.1666667          2.6    3.1446149         .003         .019
*       price    6007.7778       6243.7     .2752923         .784         .318

 





