# Extract the results for individuals/variables - MCA

Extract all the results (coordinates, squared cosine and contributions)
for the active individuals/variable categories from Multiple
Correspondence Analysis (MCA) outputs.  
  

- get_mca(): Extract the results for variables and individuals

- get_mca_ind(): Extract the results for individuals only

- get_mca_var(): Extract the results for variables only

## Usage

``` r
get_mca(res.mca, element = c("var", "ind", "mca.cor", "quanti.sup"))

get_mca_var(res.mca, element = c("var", "mca.cor", "quanti.sup"))

get_mca_ind(res.mca)
```

## Arguments

- res.mca:

  an object of class MCA \[FactoMineR\], acm \[ade4\], expoOutput/epMCA
  \[ExPosition\].

- element:

  the element to subset from the output. Possible values are "var" for
  variables, "ind" for individuals, "mca.cor" for correlation between
  variables and principal dimensions, "quanti.sup" for quantitative
  supplementary variables.

## Value

a list of matrices containing the results for the active
individuals/variable categories including :

- coord:

  coordinates for the individuals/variable categories

- cos2:

  cos2 for the individuals/variable categories

- contrib:

  contributions of the individuals/variable categories

- inertia:

  inertia of the individuals/variable categories

## References

http://www.sthda.com/english/

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
# \donttest{
# Multiple Correspondence Analysis
# ++++++++++++++++++++++++++++++
# Install and load FactoMineR to compute MCA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
poison.active <- poison[1:55, 5:15]
head(poison.active[, 1:6])
#>     Nausea Vomiting Abdominals   Fever   Diarrhae   Potato
#> 1 Nausea_y  Vomit_n     Abdo_y Fever_y Diarrhea_y Potato_y
#> 2 Nausea_n  Vomit_n     Abdo_n Fever_n Diarrhea_n Potato_y
#> 3 Nausea_n  Vomit_y     Abdo_y Fever_y Diarrhea_y Potato_y
#> 4 Nausea_n  Vomit_n     Abdo_n Fever_n Diarrhea_n Potato_y
#> 5 Nausea_n  Vomit_y     Abdo_y Fever_y Diarrhea_y Potato_y
#> 6 Nausea_n  Vomit_n     Abdo_y Fever_y Diarrhea_y Potato_y
res.mca <- MCA(poison.active, graph=FALSE)
 
 # Extract the results for variable categories
 var <- get_mca_var(res.mca)
 print(var)
#> Multiple Correspondence Analysis Results for variables
#>  ===================================================
#>   Name       Description                  
#> 1 "$coord"   "Coordinates for categories" 
#> 2 "$cos2"    "Cos2 for categories"        
#> 3 "$contrib" "contributions of categories"
 head(var$coord) # coordinates of variables
#>               Dim 1       Dim 2        Dim 3       Dim 4       Dim 5
#> Nausea_n  0.2673909  0.12139029 -0.265583253  0.03376130  0.07370500
#> Nausea_y -0.9581506 -0.43498187  0.951673323 -0.12097801 -0.26410958
#> Vomit_n   0.4790279 -0.40919465  0.084492799  0.27361142  0.05245250
#> Vomit_y  -0.7185419  0.61379197 -0.126739198 -0.41041713 -0.07867876
#> Abdo_n    1.3180221 -0.03574501 -0.005094243 -0.15360951 -0.06986987
#> Abdo_y   -0.6411999  0.01738946  0.002478280  0.07472895  0.03399075
 head(var$cos2) # cos2 of variables
#>              Dim 1        Dim 2        Dim 3       Dim 4       Dim 5
#> Nausea_n 0.2562007 0.0528025759 2.527485e-01 0.004084375 0.019466197
#> Nausea_y 0.2562007 0.0528025759 2.527485e-01 0.004084375 0.019466197
#> Vomit_n  0.3442016 0.2511603912 1.070855e-02 0.112294813 0.004126898
#> Vomit_y  0.3442016 0.2511603912 1.070855e-02 0.112294813 0.004126898
#> Abdo_n   0.8451157 0.0006215864 1.262496e-05 0.011479077 0.002374929
#> Abdo_y   0.8451157 0.0006215864 1.262496e-05 0.011479077 0.002374929
 head(var$contrib) # contributions of variables
#>              Dim 1       Dim 2        Dim 3      Dim 4      Dim 5
#> Nausea_n  1.515869  0.81100008 4.670018e+00 0.08449397 0.48977906
#> Nausea_y  5.431862  2.90608363 1.673423e+01 0.30277007 1.75504164
#> Vomit_n   3.733667  7.07226253 3.627455e-01 4.25893721 0.19036376
#> Vomit_y   5.600500 10.60839380 5.441183e-01 6.38840581 0.28554563
#> Abdo_n   15.417637  0.02943661 7.192511e-04 0.73219636 0.18424268
#> Abdo_y    7.500472  0.01432051 3.499060e-04 0.35620363 0.08963157
 
 # Extract the results for individuals
 ind <- get_mca_ind(res.mca)
 print(ind)
#> Multiple Correspondence Analysis Results for individuals
#>  ===================================================
#>   Name       Description                       
#> 1 "$coord"   "Coordinates for the individuals" 
#> 2 "$cos2"    "Cos2 for the individuals"        
#> 3 "$contrib" "contributions of the individuals"
 head(ind$coord) # coordinates of individuals
#>        Dim 1       Dim 2       Dim 3       Dim 4       Dim 5
#> 1 -0.4525811 -0.26415072  0.17151614  0.01369348 -0.11696806
#> 2  0.8361700 -0.03193457 -0.07208249 -0.08550351  0.51978710
#> 3 -0.4481892  0.13538726 -0.22484048 -0.14170168 -0.05004753
#> 4  0.8803694 -0.08536230 -0.02052044 -0.07275873 -0.22935022
#> 5 -0.4481892  0.13538726 -0.22484048 -0.14170168 -0.05004753
#> 6 -0.3594324 -0.43604390 -1.20932223  1.72464616  0.04348157
 head(ind$cos2) # cos2 of individuals
#>        Dim 1        Dim 2        Dim 3        Dim 4        Dim 5
#> 1 0.34652591 0.1180447167 0.0497683175 0.0003172275 0.0231460846
#> 2 0.55589562 0.0008108236 0.0041310808 0.0058126211 0.2148103098
#> 3 0.54813888 0.0500176790 0.1379484860 0.0547920948 0.0068349171
#> 4 0.74773962 0.0070299584 0.0004062504 0.0051072923 0.0507479873
#> 5 0.54813888 0.0500176790 0.1379484860 0.0547920948 0.0068349171
#> 6 0.02485357 0.0365775483 0.2813443706 0.5722083217 0.0003637178
 head(ind$contrib) # contributions of individuals
#>      Dim 1      Dim 2        Dim 3        Dim 4      Dim 5
#> 1 1.110927 0.98238297  0.498254685  0.003555817 0.31554778
#> 2 3.792117 0.01435818  0.088003703  0.138637089 6.23134138
#> 3 1.089470 0.25806722  0.856229950  0.380768961 0.05776914
#> 4 4.203611 0.10259105  0.007132055  0.100387990 1.21319013
#> 5 1.089470 0.25806722  0.856229950  0.380768961 0.05776914
#> 6 0.700692 2.67693398 24.769968729 56.404214518 0.04360547
 
 # You can also use the function get_mca()
 get_mca(res.mca, "ind") # Results for individuals
#> Multiple Correspondence Analysis Results for individuals
#>  ===================================================
#>   Name       Description                       
#> 1 "$coord"   "Coordinates for the individuals" 
#> 2 "$cos2"    "Cos2 for the individuals"        
#> 3 "$contrib" "contributions of the individuals"
 get_mca(res.mca, "var") # Results for variable categories
#> Multiple Correspondence Analysis Results for variables
#>  ===================================================
#>   Name       Description                  
#> 1 "$coord"   "Coordinates for categories" 
#> 2 "$cos2"    "Cos2 for categories"        
#> 3 "$contrib" "contributions of categories"
 # }
 
```
