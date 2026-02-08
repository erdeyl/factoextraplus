# Print method for an object of class factoextra

Print method for an object of class factoextra

## Usage

``` r
# S3 method for class 'factoextra'
print(x, ...)
```

## Arguments

- x:

  an object of class factoextra

- ...:

  further arguments to be passed to print method

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
 data(iris)
 res.pca <- prcomp(iris[, -5],  scale = TRUE)
 ind <- get_pca_ind(res.pca, data = iris[, -5])
 print(ind)
#> Principal Component Analysis Results for individuals
#>  ===================================================
#>   Name       Description                       
#> 1 "$coord"   "Coordinates for the individuals" 
#> 2 "$cos2"    "Cos2 for the individuals"        
#> 3 "$contrib" "contributions of the individuals"
 
```
