# House tasks contingency table

A data frame containing the frequency of execution of 13 house tasks in
the couple. This table is also available in ade4 package.

## Usage

``` r
data("housetasks")
```

## Format

A data frame with 13 observations (house tasks) on the following 4
columns.

- `Wife`:

  a numeric vector

- `Alternating`:

  a numeric vector

- `Husband`:

  a numeric vector

- `Jointly`:

  a numeric vector

## Source

This data is from FactoMineR package.

## Examples

``` r
library(FactoMineR)
data(housetasks)
res.ca <- CA(housetasks, graph=FALSE)
fviz_ca_biplot(res.ca, repel = TRUE)+
theme_minimal()

```
