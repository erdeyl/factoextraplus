# Athletes' performance in decathlon

Athletes' performance during two sporting meetings

## Usage

``` r
data("decathlon2")
```

## Format

A data frame with 27 observations on the following 13 variables.

- `X100m`:

  a numeric vector

- `Long.jump`:

  a numeric vector

- `Shot.put`:

  a numeric vector

- `High.jump`:

  a numeric vector

- `X400m`:

  a numeric vector

- `X110m.hurdle`:

  a numeric vector

- `Discus`:

  a numeric vector

- `Pole.vault`:

  a numeric vector

- `Javeline`:

  a numeric vector

- `X1500m`:

  a numeric vector

- `Rank`:

  a numeric vector corresponding to the rank

- `Points`:

  a numeric vector specifying the point obtained

- `Competition`:

  a factor with levels `Decastar` `OlympicG`

## Source

This data is a subset of decathlon data in FactoMineR package.

## Examples

``` r
# \donttest{
data(decathlon2)
decathlon.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon.active, scale = TRUE)
fviz_pca_biplot(res.pca)

# }
```
