# Extract the results for individuals/variables/group/partial axes - MFA

Extract all the results (coordinates, squared cosine and contributions)
for the active individuals/quantitative variables/qualitative variable
categories/groups/partial axes from Multiple Factor Analysis (MFA)
outputs.  
  

- get_mfa(): Extract the results for variables and individuals

- get_mfa_ind(): Extract the results for individuals only

- get_mfa_var(): Extract the results for variables (quantitatives,
  qualitatives and groups)

- get_mfa_partial_axes(): Extract the results for partial axes only

## Usage

``` r
get_mfa(
  res.mfa,
  element = c("ind", "quanti.var", "quali.var", "group", "partial.axes")
)

get_mfa_ind(res.mfa)

get_mfa_var(res.mfa, element = c("quanti.var", "quali.var", "group"))

get_mfa_partial_axes(res.mfa)
```

## Arguments

- res.mfa:

  an object of class MFA \[FactoMineR\].

- element:

  the element to subset from the output. Possible values are "ind",
  "quanti.var", "quali.var", "group" or "partial.axes".

## Value

a list of matrices containing the results for the active
individuals/quantitative variable categories/qualitative variable
categories/groups/partial axes including :

- coord:

  coordinates for the individuals/quantitative variable
  categories/qualitative variable categories/groups/partial axes

- cos2:

  cos2 for the individuals/quantitative variable categories/qualitative
  variable categories/groups/partial axes

- contrib:

  contributions of the individuals/quantitative variable
  categories/qualitative variable categories/groups/partial axes

- inertia:

  inertia of the individuals/quantitative variable
  categories/qualitative variable categories/groups/partial axes

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

Fabian Mundt <f.mundt@inventionate.de>

## Examples

``` r
# Multiple Factor Analysis
# ++++++++++++++++++++++++
# Install and load FactoMineR to compute MFA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
name.group=c("desc","desc2","symptom","eat"), num.group.sup=1:2,
graph = FALSE)
 
 # Extract the results for qualitative variable categories
 var <- get_mfa_var(res.mfa, "quali.var")
 print(var)
#> Multiple Factor Analysis results for qualitative variable categories 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(var$coord) # coordinates of qualitative variables
#>               Dim.1        Dim.2       Dim.3       Dim.4       Dim.5
#> Nausea_n  0.2995559 -0.008263233 -0.15087999 -0.05120534  0.02684045
#> Nausea_y -1.0734086  0.029609918  0.54065330  0.18348582 -0.09617827
#> Vomit_n   0.4923055 -0.335833158  0.06315216  0.20249017  0.03344304
#> Vomit_y  -0.7384582  0.503749737 -0.09472824 -0.30373526 -0.05016455
#> Abdo_n    1.4594717 -0.253368918 -0.02659215 -0.10539596 -0.03153966
#> Abdo_y   -0.7100132  0.123260555  0.01293672  0.05127371  0.01534362
 head(var$cos2) # cos2 of qualitative variables
#>              Dim.1        Dim.2       Dim.3       Dim.4        Dim.5
#> Nausea_n 0.5675315 0.0004318514 0.143978489 0.016583068 0.0045563154
#> Nausea_y 0.5675315 0.0004318514 0.143978489 0.016583068 0.0045563154
#> Vomit_n  0.5335539 0.2482881886 0.008779814 0.090264467 0.0024621829
#> Vomit_y  0.5335539 0.2482881886 0.008779814 0.090264467 0.0024621829
#> Abdo_n   0.9163124 0.0276158818 0.000304200 0.004778594 0.0004279236
#> Abdo_y   0.9163124 0.0276158818 0.000304200 0.004778594 0.0004279236
 head(var$contrib) # contributions of qualitative variables
#>              Dim.1       Dim.2       Dim.3     Dim.4      Dim.5
#> Nausea_n  1.041575 0.002357361 1.112155571 0.1542638 0.05473887
#> Nausea_y  3.732310 0.008447211 3.985224130 0.5527787 0.19614761
#> Vomit_n   2.158985 2.988262782 0.149528552 1.8513432 0.06521886
#> Vomit_y   3.238478 4.482394173 0.224292828 2.7770149 0.09782829
#> Abdo_n   10.349759 0.927762633 0.014461496 0.2735807 0.03163984
#> Abdo_y    5.035018 0.451343984 0.007035322 0.1330933 0.01539236
 
 # Extract the results for individuals
 ind <- get_mfa_ind(res.mfa)
 print(ind)
#> Multiple Factor Analysis results for individuals 
#>  ===================================================
#>   Name                      Description                      
#> 1 "$coord"                  "Coordinates"                    
#> 2 "$cos2"                   "Cos2, quality of representation"
#> 3 "$contrib"                "Contributions"                  
#> 4 "$coord.partiel"          "Partial coordinates"            
#> 5 "$within.inertia"         "Within inertia"                 
#> 6 "$within.partial.inertia" "Within partial inertia"         
 head(ind$coord) # coordinates of individuals
#>        Dim.1       Dim.2       Dim.3       Dim.4      Dim.5
#> 1 -0.8980293 -0.19968268  0.10527090 -0.06375957 -0.2468778
#> 2  1.6550439 -0.41095346 -0.16606815 -0.49335618  1.4414215
#> 3 -0.8673037  0.09906989 -0.27126101 -0.42418672 -0.2250902
#> 4  1.7839172 -0.56856945 -0.04179541 -0.09829156 -0.6203236
#> 5 -0.8673037  0.09906989 -0.27126101 -0.42418672 -0.2250902
#> 6 -1.1229099 -1.07440938 -4.26919514  3.89647532  0.9498171
 head(ind$cos2) # cos2 of individuals
#>        Dim.1       Dim.2        Dim.3       Dim.4      Dim.5
#> 1 0.35650962 0.017626699 0.0048989935 0.001797136 0.02694352
#> 2 0.39631064 0.024434418 0.0039901519 0.035215824 0.30060672
#> 3 0.50651695 0.006608988 0.0495480243 0.121161803 0.03411653
#> 4 0.60082570 0.061033205 0.0003298044 0.001824029 0.07265003
#> 5 0.50651695 0.006608988 0.0495480243 0.121161803 0.03411653
#> 6 0.03403476 0.031158209 0.4919544784 0.409804540 0.02435078
 head(ind$contrib) # contributions of individuals
#>       Dim.1      Dim.2        Dim.3       Dim.4     Dim.5
#> 1 1.0075082 0.08591005  0.028403241  0.01143425 0.1948150
#> 2 3.4220518 0.36387188  0.070684466  0.68460183 6.6411041
#> 3 0.9397448 0.02114689  0.188593192  0.50609384 0.1619465
#> 4 3.9757303 0.69651464  0.004477221  0.02717374 1.2299713
#> 5 0.9397448 0.02114689  0.188593192  0.50609384 0.1619465
#> 6 1.5752786 2.48715469 46.713592970 42.70323449 2.8836218
 
 # You can also use the function get_mfa()
 get_mfa(res.mfa, "ind") # Results for individuals
#> Multiple Factor Analysis results for individuals 
#>  ===================================================
#>   Name                      Description                      
#> 1 "$coord"                  "Coordinates"                    
#> 2 "$cos2"                   "Cos2, quality of representation"
#> 3 "$contrib"                "Contributions"                  
#> 4 "$coord.partiel"          "Partial coordinates"            
#> 5 "$within.inertia"         "Within inertia"                 
#> 6 "$within.partial.inertia" "Within partial inertia"         
 get_mfa(res.mfa, "quali.var") # Results for qualitative variable categories
#> Multiple Factor Analysis results for qualitative variable categories 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 
```
