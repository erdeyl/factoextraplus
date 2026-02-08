# Extract the results for rows/columns - CA

Extract all the results (coordinates, squared cosine, contributions and
inertia) for the active row/column variables from Correspondence
Analysis (CA) outputs.  
  

- get_ca(): Extract the results for rows and columns

- get_ca_row(): Extract the results for rows only

- get_ca_col(): Extract the results for columns only

## Usage

``` r
get_ca(res.ca, element = c("row", "col"))

get_ca_col(res.ca)

get_ca_row(res.ca)
```

## Arguments

- res.ca:

  an object of class CA \[FactoMineR\], ca \[ca\], coa \[ade4\];
  correspondence \[MASS\].

- element:

  the element to subset from the output. Possible values are "row" or
  "col".

## Value

a list of matrices containing the results for the active rows/columns
including :

- coord:

  coordinates for the rows/columns

- cos2:

  cos2 for the rows/columns

- contrib:

  contributions of the rows/columns

- inertia:

  inertia of the rows/columns

## References

http://www.sthda.com

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
# \donttest{
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")
 library("FactoMineR")
 data("housetasks")
 res.ca <- CA(housetasks, graph = FALSE)
 
# Result for column variables
 col <- get_ca_col(res.ca)
 col # print
#> Correspondence Analysis - Results for columns
#>  ===================================================
#>   Name       Description                   
#> 1 "$coord"   "Coordinates for the columns" 
#> 2 "$cos2"    "Cos2 for the columns"        
#> 3 "$contrib" "contributions of the columns"
#> 4 "$inertia" "Inertia of the columns"      
 head(col$coord) # column coordinates
#>                   Dim 1      Dim 2       Dim 3
#> Wife        -0.83762154  0.3652207 -0.19991139
#> Alternating -0.06218462  0.2915938  0.84858939
#> Husband      1.16091847  0.6019199 -0.18885924
#> Jointly      0.14942609 -1.0265791 -0.04644302
 head(col$cos2) # column cos2
#>                   Dim 1     Dim 2       Dim 3
#> Wife        0.801875947 0.1524482 0.045675847
#> Alternating 0.004779897 0.1051016 0.890118521
#> Husband     0.772026244 0.2075420 0.020431728
#> Jointly     0.020705858 0.9772939 0.002000236
 head(col$contrib) # column contributions
#>                 Dim 1     Dim 2      Dim 3
#> Wife        44.462018 10.312237 10.8220753
#> Alternating  0.103739  2.782794 82.5492464
#> Husband     54.233879 17.786612  6.1331792
#> Jointly      1.200364 69.118357  0.4954991
 
# Result for row variables
 row <- get_ca_row(res.ca)
 row # print
#> Correspondence Analysis - Results for rows
#>  ===================================================
#>   Name       Description                
#> 1 "$coord"   "Coordinates for the rows" 
#> 2 "$cos2"    "Cos2 for the rows"        
#> 3 "$contrib" "contributions of the rows"
#> 4 "$inertia" "Inertia of the rows"      
 head(row$coord) # row coordinates
#>                 Dim 1      Dim 2       Dim 3
#> Laundry    -0.9918368  0.4953220 -0.31672897
#> Main_meal  -0.8755855  0.4901092 -0.16406487
#> Dinner     -0.6925740  0.3081043 -0.20741377
#> Breakfeast -0.5086002  0.4528038  0.22040453
#> Tidying    -0.3938084 -0.4343444 -0.09421375
#> Dishes     -0.1889641 -0.4419662  0.26694926
 head(row$cos2) # row cos2
#>                Dim 1     Dim 2      Dim 3
#> Laundry    0.7399874 0.1845521 0.07546047
#> Main_meal  0.7416028 0.2323593 0.02603787
#> Dinner     0.7766401 0.1537032 0.06965666
#> Breakfeast 0.5049433 0.4002300 0.09482670
#> Tidying    0.4398124 0.5350151 0.02517249
#> Dishes     0.1181178 0.6461525 0.23572969
 head(row$contrib) # row contributions
#>                 Dim 1    Dim 2    Dim 3
#> Laundry    18.2867003 5.563891 7.968424
#> Main_meal  12.3888433 4.735523 1.858689
#> Dinner      5.4713982 1.321022 2.096926
#> Breakfeast  3.8249284 3.698613 3.069399
#> Tidying     1.9983518 2.965644 0.488734
#> Dishes      0.4261663 2.844117 3.634294
 
 # You can also use the function get_ca()
 get_ca(res.ca, "row") # Results for rows
#> Correspondence Analysis - Results for rows
#>  ===================================================
#>   Name       Description                
#> 1 "$coord"   "Coordinates for the rows" 
#> 2 "$cos2"    "Cos2 for the rows"        
#> 3 "$contrib" "contributions of the rows"
#> 4 "$inertia" "Inertia of the rows"      
 get_ca(res.ca, "col") # Results for columns
#> Correspondence Analysis - Results for columns
#>  ===================================================
#>   Name       Description                   
#> 1 "$coord"   "Coordinates for the columns" 
#> 2 "$cos2"    "Cos2 for the columns"        
#> 3 "$contrib" "contributions of the columns"
#> 4 "$inertia" "Inertia of the columns"      
 # }
```
