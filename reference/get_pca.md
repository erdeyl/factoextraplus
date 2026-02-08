# Extract the results for individuals/variables - PCA

Extract all the results (coordinates, squared cosine, contributions) for
the active individuals/variables from Principal Component Analysis (PCA)
outputs.  
  

- get_pca(): Extract the results for variables and individuals

- get_pca_ind(): Extract the results for individuals only

- get_pca_var(): Extract the results for variables only

## Usage

``` r
get_pca(res.pca, element = c("var", "ind"))

get_pca_ind(res.pca, ...)

get_pca_var(res.pca)
```

## Arguments

- res.pca:

  an object of class PCA \[FactoMineR\]; prcomp and princomp \[stats\];
  pca, dudi \[adea4\]; epPCA \[ExPosition\].

- element:

  the element to subset from the output. Allowed values are "var" (for
  active variables) or "ind" (for active individuals).

- ...:

  not used

## Value

a list of matrices containing all the results for the active
individuals/variables including:

- coord:

  coordinates for the individuals/variables

- cos2:

  cos2 for the individuals/variables

- contrib:

  contributions of the individuals/variables

## References

http://www.sthda.com/english/

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
# \donttest{
# Principal Component Analysis
# +++++++++++++++++++++++++++++
 data(iris)
 res.pca <- prcomp(iris[, -5],  scale = TRUE)
 # Extract the results for individuals
 ind <- get_pca_ind(res.pca)
 print(ind)
#> Principal Component Analysis Results for individuals
#>  ===================================================
#>   Name       Description                       
#> 1 "$coord"   "Coordinates for the individuals" 
#> 2 "$cos2"    "Cos2 for the individuals"        
#> 3 "$contrib" "contributions of the individuals"
 head(ind$coord) # coordinates of individuals
#>       Dim.1      Dim.2       Dim.3        Dim.4
#> 1 -2.257141 -0.4784238  0.12727962  0.024087508
#> 2 -2.074013  0.6718827  0.23382552  0.102662845
#> 3 -2.356335  0.3407664 -0.04405390  0.028282305
#> 4 -2.291707  0.5953999 -0.09098530 -0.065735340
#> 5 -2.381863 -0.6446757 -0.01568565 -0.035802870
#> 6 -2.068701 -1.4842053 -0.02687825  0.006586116
 head(ind$cos2) # cos2 of individuals
#>       Dim.1      Dim.2        Dim.3        Dim.4
#> 1 0.9539975 0.04286032 0.0030335249 1.086460e-04
#> 2 0.8927725 0.09369248 0.0113475382 2.187482e-03
#> 3 0.9790410 0.02047578 0.0003422122 1.410446e-04
#> 4 0.9346682 0.06308947 0.0014732682 7.690193e-04
#> 5 0.9315095 0.06823959 0.0000403979 2.104697e-04
#> 6 0.6600989 0.33978301 0.0001114335 6.690714e-06
 head(ind$contrib) # contributions of individuals
#>       Dim.1      Dim.2       Dim.3       Dim.4
#> 1 1.1637691 0.16694510 0.073591567 0.018672867
#> 2 0.9825900 0.32925696 0.248367113 0.339198420
#> 3 1.2683043 0.08469576 0.008816151 0.025742863
#> 4 1.1996857 0.25856249 0.037605617 0.139067312
#> 5 1.2959338 0.30313118 0.001117674 0.041253702
#> 6 0.9775628 1.60670454 0.003281801 0.001396002
 
 # Extract the results for variables
 var <- get_pca_var(res.pca)
 print(var)
#> Principal Component Analysis Results for variables
#>  ===================================================
#>   Name       Description                                    
#> 1 "$coord"   "Coordinates for the variables"                
#> 2 "$cor"     "Correlations between variables and dimensions"
#> 3 "$cos2"    "Cos2 for the variables"                       
#> 4 "$contrib" "contributions of the variables"               
 head(var$coord) # coordinates of variables
#>                   Dim.1       Dim.2       Dim.3       Dim.4
#> Sepal.Length  0.8901688 -0.36082989  0.27565767  0.03760602
#> Sepal.Width  -0.4601427 -0.88271627 -0.09361987 -0.01777631
#> Petal.Length  0.9915552 -0.02341519 -0.05444699 -0.11534978
#> Petal.Width   0.9649790 -0.06399985 -0.24298265  0.07535950
 head(var$cos2) # cos2 of variables
#>                  Dim.1       Dim.2       Dim.3        Dim.4
#> Sepal.Length 0.7924004 0.130198208 0.075987149 0.0014142127
#> Sepal.Width  0.2117313 0.779188012 0.008764681 0.0003159971
#> Petal.Length 0.9831817 0.000548271 0.002964475 0.0133055723
#> Petal.Width  0.9311844 0.004095980 0.059040571 0.0056790544
 head(var$contrib) # contributions of variables
#>                  Dim.1       Dim.2     Dim.3     Dim.4
#> Sepal.Length 27.150969 14.24440565 51.777574  6.827052
#> Sepal.Width   7.254804 85.24748749  5.972245  1.525463
#> Petal.Length 33.687936  0.05998389  2.019990 64.232089
#> Petal.Width  31.906291  0.44812296 40.230191 27.415396
 
 # You can also use the function get_pca()
 get_pca(res.pca, "ind") # Results for individuals
#> Principal Component Analysis Results for individuals
#>  ===================================================
#>   Name       Description                       
#> 1 "$coord"   "Coordinates for the individuals" 
#> 2 "$cos2"    "Cos2 for the individuals"        
#> 3 "$contrib" "contributions of the individuals"
 get_pca(res.pca, "var") # Results for variable categories
#> Principal Component Analysis Results for variables
#>  ===================================================
#>   Name       Description                                    
#> 1 "$coord"   "Coordinates for the variables"                
#> 2 "$cor"     "Correlations between variables and dimensions"
#> 3 "$cos2"    "Cos2 for the variables"                       
#> 4 "$contrib" "contributions of the variables"               
 # }
```
