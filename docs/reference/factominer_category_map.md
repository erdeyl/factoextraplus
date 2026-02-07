# Map FactoMineR category labels to legacy naming patterns

Map FactoMineR category labels to legacy naming patterns

## Usage

``` r
factominer_category_map(X, element = c("quali.var", "quali.sup", "var"))
```

## Arguments

- X:

  a FactoMineR object (MCA, MFA, FAMD, HMFA).

- element:

  element to map. Use "var" for MCA categories or "quali.var" for
  MFA/FAMD/HMFA qualitative categories. "quali.sup" maps supplementary
  qualitative categories when available.

## Value

A data.frame with current labels, variable names, levels, and legacy
naming patterns.
