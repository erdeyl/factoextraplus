# Map legacy FactoMineR category names to current labels

Map legacy FactoMineR category names to current labels

## Usage

``` r
map_factominer_legacy_names(
  X,
  names,
  element = c("quali.var", "quali.sup", "var"),
  quiet = FALSE
)
```

## Arguments

- X:

  a FactoMineR object (MCA, MFA, FAMD, HMFA).

- names:

  character vector of category labels.

- element:

  element to map. Use "var" for MCA categories or "quali.var" for
  MFA/FAMD/HMFA qualitative categories. "quali.sup" maps supplementary
  qualitative categories when available.

- quiet:

  if TRUE, suppress warnings.

## Value

Character vector of mapped labels.
