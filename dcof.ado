* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *
* Código de Identificación de Variables Discriminatorias *
* creado por: Franco A. Mansilla Ibañez, Chile.
* website: www.francomansilla.com 
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *


program define dcof, rclass 
version 17

args var_y var_xs lvl_conf sample sort
syntax varlist, var_y(string) lvl_conf(integer) sample(string) sort(integer)

quietly return local varname `varlist'
quietly local num : word count `varlist'

quietly ssc install matsort
quietly ssc install unique

* CON TODA LA MUESTRA *
if "`sample'" == "all_sample" {
	
	 quietly matrix A = J(`num', 5, .)
	 quietly matrix rowname A = `varlist'
	 quietly matrix colname A = "Media Grp A" "Media Grp B" t-Student pval_t pval_fisher
	
	
	 local f = 1
	
	foreach i in `varlist' {
		
		quietly unique `i'
		quietly global unique = r(unique)
		
		if $unique >= 5 { 
			
			 quietly sdtest `i', by(`var_y') level(`lvl_conf') 
			 quietly matrix A[`f',5] = round(r(p), 0.001)
			
			if r(p) <= (1- (`lvl_conf')/100) {
				 quietly ttest `i', by(`var_y') level(`lvl_conf') unequal
				 quietly matrix A[`f',1] = r(mu_1)
				 quietly matrix A[`f',2] = r(mu_2)
				 quietly matrix A[`f',3] = abs(r(t))
				 quietly matrix A[`f',4] = round(r(p), 0.001)
			}
			
			else {
				 quietly ttest `i', by(`var_y') level(`lvl_conf')  
				 quietly matrix A[`f',1] = r(mu_1)
				 quietly matrix A[`f',2] = r(mu_2)
				 quietly matrix A[`f',3] = abs(r(t))
				 quietly matrix A[`f',4] = round(r(p), 0.001)
				}
			
				quietly local ++f
		}
	}
				
}

* MUESTRA ESPECIFICA
if "`sample'" != "all_sample" {
	
	quietly matrix A = J(`num', 5, .)
	quietly matrix rowname A = `varlist'
	quietly matrix colname A = "Media Grp A" "Media Grp B" t-Student pval_t pval_fisher
	
	
	quietly local f = 1
	
	foreach i in `varlist' {
		
		quietly unique `i'
		quietly global unique = r(unique)
		
		if $unique >= 5 { 
			
			quietly sdtest `i' if `sample' == 1, by(`var_y') level(`lvl_conf') 
			quietly matrix A[`f',5] = round(r(p), 0.001)
			
			if r(p) <= (1- (`lvl_conf')/100){
				quietly ttest `i' if `sample' == 1, by(`var_y') level(`lvl_conf') unequal
				quietly matrix A[`f',1] = r(mu_1)
				quietly matrix A[`f',2] = r(mu_2)
				quietly matrix A[`f',3] = abs(r(t))
				quietly matrix A[`f',4] = round(r(p), 0.001)
			}
			
			else {
				quietly ttest `i' if `sample' == 1, by(`var_y') level(`lvl_conf')  
				quietly matrix A[`f',1] = r(mu_1)
				quietly matrix A[`f',2] = r(mu_2)
				quietly matrix A[`f',3] = abs(r(t))
				quietly matrix A[`f',4] = round(r(p), 0.001)
				}
			
				quietly local ++f
		}
	}
				
}






display " "
display "* ~~~~~~~~~~~~~~~~~~~~~ *"
display "* Información Utilizada *"
display "* ~~~~~~~~~~~~~~~~~~~~~ *"
display " "
display "~> Variable Independiente (y): `var_y' " 
display "~> Nivel de Confianza: " `lvl_conf' "%"
display "~> Variables Dependientes (x's): `varlist'" 
display " "
display "~> Resultado:"

if `sort' == 1 {
	
	
	quietly matsort A 3 "down"
	
	matrix list A
	
}
if `sort' == 0 {
	
	matrix list A
}

end
exit 
 

