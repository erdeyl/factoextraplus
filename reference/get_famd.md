# Extract the results for individuals and variables - FAMD

Extract all the results (coordinates, squared cosine and contributions)
for the active individuals and variables from Factor Analysis of Mixed
Date (FAMD) outputs.  
  

- get_famd(): Extract the results for variables and individuals

- get_famd_ind(): Extract the results for individuals only

- get_famd_var(): Extract the results for quantitative and qualitative
  variables only

## Usage

``` r
get_famd(res.famd, element = c("ind", "var", "quanti.var", "quali.var"))

get_famd_ind(res.famd)

get_famd_var(res.famd, element = c("var", "quanti.var", "quali.var"))
```

## Arguments

- res.famd:

  an object of class FAMD \[FactoMineR\].

- element:

  the element to subset from the output. Possible values are "ind",
  "quanti.var" or "quali.var".

## Value

a list of matrices containing the results for the active individuals and
variables, including :

- coord:

  coordinates of indiiduals/variables.

- cos2:

  cos2 values representing the quality of representation on the factor
  map.

- contrib:

  contributions of individuals / variables to the principal components.

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
 # Compute FAMD
 library("FactoMineR")
 data(wine)
 res.famd <- FAMD(wine[,c(1,2, 16, 22, 29, 28, 30,31)], graph = FALSE)
 
 # Extract the results for qualitative variable categories
 quali.var <- get_famd_var(res.famd, "quali.var")
 print(quali.var)
#> FAMD results for qualitative variable categories 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(quali.var$coord) # coordinates of qualitative variables
#>                  Dim.1      Dim.2      Dim.3      Dim.4      Dim.5
#> Saumur      0.08238236  0.2041021  0.9985884 -0.3996689 -0.1453137
#> Bourgueuil  0.72578122 -1.0944657 -0.8193199  1.0187071 -0.4092349
#> Chinon     -1.31522332  1.0804177 -1.5171382 -0.4289712  1.0134650
#> Reference   2.06918009  0.6112128 -0.2525731  0.6853384  0.0157536
#> Env1       -0.30736790 -1.6929988 -0.1158917 -0.3395732  0.3152922
#> Env2       -1.40724432  1.2078471 -0.5667802 -1.0387469 -0.6525117
 
 # Extract the results for quantitative variables
 quanti.var <- get_famd_var(res.famd, "quanti.var")
 print(quanti.var)
#> FAMD results for quantitative variables 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(quanti.var$coord) # coordinates
#>                      Dim.1     Dim.2       Dim.3       Dim.4       Dim.5
#> Plante          -0.8569808 0.2460731  0.32542595 -0.06333481  0.03215674
#> Acidity         -0.4162617 0.7007982 -0.35551938  0.33967158 -0.06772218
#> Harmony          0.9457255 0.1537145  0.20031093 -0.06044678  0.09307236
#> Intensity        0.8361705 0.3669322  0.25569950  0.15236464  0.08045522
#> Overall.quality  0.9547617 0.0724343 -0.09662648 -0.07379211 -0.02821680
#> Typical          0.8836634 0.1646035 -0.03936739 -0.28887130  0.02431654
 
 # Extract the results for individuals
 ind <- get_famd_ind(res.famd)
 print(ind)
#> FAMD results for individuals 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(ind$coord) # coordinates of individuals
#>           Dim.1      Dim.2      Dim.3      Dim.4       Dim.5
#> 2EL  -0.1213241 -1.5797151  0.7615777 -1.1978981  0.28209940
#> 1CHA -0.6536760 -1.6846472  0.7643619 -0.9923990  0.24345633
#> 1FON  0.8701622 -2.2457285 -0.7788402  0.3339757 -0.16854021
#> 1VAU -5.6883455  2.1640314 -2.2984115  0.2968312 -0.13215744
#> 1DAM  2.4441041  1.2242463  0.2751576  0.4694187 -0.06885226
#> 2BOU  2.2703576 -0.0768261 -0.8093529  1.4650543 -0.49582803
 
 
```
