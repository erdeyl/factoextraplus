# A dataset containing clusters of multiple shapes

Data containing clusters of any shapes. Useful for comparing
density-based clustering (DBSCAN) and standard partitioning methods such
as k-means clustering.

## Usage

``` r
data("multishapes")
```

## Format

A data frame with 1100 observations on the following 3 variables.

- `x`:

  a numeric vector containing the x coordinates of observations

- `y`:

  a numeric vector containing the y coordinates of observations

- `shape`:

  a numeric vector corresponding to the cluster number of each
  observations.

## Details

The dataset contains 5 clusters and some outliers/noises.

## Examples

``` r
# \donttest{
data(multishapes)
plot(multishapes[,1], multishapes[, 2],
    col = multishapes[, 3], pch = 19, cex = 0.8)

# }
```
