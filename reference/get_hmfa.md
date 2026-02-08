# Extract the results for individuals/variables/group/partial axes - HMFA

Extract all the results (coordinates, squared cosine and contributions)
for the active individuals/quantitative variables/qualitative variable
categories/groups/partial axes from Hierarchical Multiple Factor
Analysis (HMFA) outputs.  
  

- get_hmfa(): Extract the results for variables and individuals

- get_hmfa_ind(): Extract the results for individuals only

- get_mfa_var(): Extract the results for variables (quantitatives,
  qualitatives and groups)

- get_hmfa_partial(): Extract the results for partial.node.

## Usage

``` r
get_hmfa(
  res.hmfa,
  element = c("ind", "quanti.var", "quali.var", "group", "partial.node")
)

get_hmfa_ind(res.hmfa)

get_hmfa_var(res.hmfa, element = c("quanti.var", "quali.var", "group"))

get_hmfa_partial(res.hmfa)
```

## Arguments

- res.hmfa:

  an object of class HMFA \[FactoMineR\].

- element:

  the element to subset from the output. Possible values are "ind",
  "quanti.var", "quali.var", "group" or "partial.node".

## Value

a list of matrices containing the results for the active individuals,
variables, groups and partial nodes, including :

- coord:

  coordinates

- cos2:

  cos2

- contrib:

  contributions

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
data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)), graph = FALSE)
 
 # Extract the results for qualitative variable categories
 var <- get_hmfa_var(res.hmfa, "quali.var")
 print(var)
#> Hierarchical Multiple Factor Analysis results for qualitative variable categories 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(var$coord) # coordinates of qualitative variables
#>                  Dim.1      Dim.2       Dim.3       Dim.4       Dim.5
#> Saumur      0.28342472  0.4390421 -0.09638752 -0.36769255 -0.14533044
#> Bourgueuil -0.07481551 -0.6213326 -0.41687271  0.64796797 -0.14011318
#> Chinon     -0.66719470 -0.2753669  0.89037475  0.03920255  0.60982847
#> Reference   1.23034230 -0.2804136  0.07449961  0.35097213  0.03705687
#> Env1       -0.60476095 -0.5210792 -0.56556282 -0.22598702  0.16935600
#> Env2       -0.61315234  0.1048772  0.84674562 -0.29209644 -0.32484663
 head(var$cos2) # cos2 of qualitative variables
#> NULL
 head(var$contrib) # contributions of qualitative variables
#>                 Dim.1      Dim.2      Dim.3       Dim.4      Dim.5
#> Saumur     0.28718092 3.25760489  0.6860754 15.41542454  5.7667557
#> Bourgueuil 0.01091496 3.55871242  6.9999633 26.11268188  2.9237144
#> Chinon     0.57869886 0.46599028 21.2884105  0.06372088 36.9233500
#> Reference  3.44379596 0.84564799  0.2608216  8.93792011  0.2385949
#> Env1       0.83205681 2.92010718 15.0313270  3.70559696  4.9833906
#> Env2       0.61093393 0.08449392 24.0665310  4.42196882 13.0964154
 
 # Extract the results for individuals
 ind <- get_hmfa_ind(res.hmfa)
 print(ind)
#> Hierarchical Multiple Factor Analysis results for individuals 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 head(ind$coord) # coordinates of individuals
#>           Dim.1      Dim.2      Dim.3      Dim.4        Dim.5
#> 2EL   0.1155896 -0.3839978 -0.6324715 -0.8971297  0.196409100
#> 1CHA -1.0733840 -0.8748015 -0.7149103 -1.0613744  0.119528809
#> 1FON -0.5149328 -0.8435529 -0.8008935  0.4309004 -0.158675600
#> 1VAU -3.3120825  0.1086326  1.1289693  0.1909031  0.426946486
#> 1DAM  1.8159304  0.2803452  0.1624881  0.1965103  0.006922444
#> 2BOU  0.9007130 -0.3683414 -0.2969980  0.7341058 -0.144255380
 head(ind$cos2) # cos2 of individuals
#>            Dim.1        Dim.2       Dim.3       Dim.4        Dim.5
#> 2EL  0.006483776 0.0715562736 0.194120803 0.390571644 1.872033e-02
#> 1CHA 0.266929879 0.1772988917 0.118410472 0.260990168 3.310031e-03
#> 1FON 0.102635900 0.2754373265 0.248283393 0.071870722 9.745821e-03
#> 1VAU 0.827795354 0.0008905154 0.096180048 0.002750087 1.375522e-02
#> 1DAM 0.724996881 0.0172792123 0.005804713 0.008490015 1.053553e-05
#> 2BOU 0.315268924 0.0527241292 0.034277982 0.209423600 8.086718e-03
 head(ind$contrib) # contributions of individuals
#>            Dim.1      Dim.2      Dim.3      Dim.4       Dim.5
#> 2EL   0.03439077 0.82521019  4.6796252 11.6995051 0.867753728
#> 1CHA  2.96561244 4.28278389  5.9790526 16.3754861 0.321379713
#> 1FON  0.68250419 3.98227962  7.5037568  2.6990497 0.566361307
#> 1VAU 28.23621201 0.06604316 14.9105443  0.5297644 4.100342754
#> 1DAM  8.48794523 0.43983856  0.3088675  0.5613423 0.001077934
#> 2BOU  2.08822376 0.75929094  1.0318966  7.8338335 0.468098570
 
 # You can also use the function get_hmfa()
 get_hmfa(res.hmfa, "ind") # Results for individuals
#> Hierarchical Multiple Factor Analysis results for individuals 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 get_hmfa(res.hmfa, "quali.var") # Results for qualitative variable categories
#> Hierarchical Multiple Factor Analysis results for qualitative variable categories 
#>  ===================================================
#>   Name       Description                      
#> 1 "$coord"   "Coordinates"                    
#> 2 "$cos2"    "Cos2, quality of representation"
#> 3 "$contrib" "Contributions"                  
 
```
