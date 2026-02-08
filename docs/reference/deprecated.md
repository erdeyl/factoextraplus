# Deprecated Functions

Deprecated functions. Will be removed in a future version.

- get_mfa_quanti_var(). Deprecated. Use get_mfa_var(res.mfa,
  "quanti.var") instead.

- get_mfa_quali_var(). Deprecated. Use get_mfa_var(res.mfa, "quali.var")
  instead.

- get_mfa_group(). Deprecated. Use get_mfa_var(res.mfa, "group")
  instead.

- fviz_mfa_ind_starplot(): Star graph of individuals (draws partial
  points). Deprecated. Use fviz_mfa_ind(res.mfa, partial = "all")
  instead.

- fviz_mfa_quanti_var(): Graph of quantitative variables. Deprecated.
  Use fviz_mfa(X, "quanti.var") instead.

- fviz_mfa_quali_var(): Graph of qualitative variables. Deprecated. Use
  fviz_mfa(X, "quali.var") instead.

- get_hmfa_quanti_var(). Deprecated. Use get_hmfa_var(res.hmfa,
  "quanti.var") instead.

- get_hmfa_quali_var(). Deprecated. Use get_hmfa_var(res.hmfa,
  "quali.var") instead.

- get_hmfa_group(). Deprecated. Use get_hmfa_var(res.hmfa, "group")
  instead.

- fviz_hmfa_ind_starplot(): Graph of partial individuals. Deprecated.
  Use fviz_hmfa_ind(X, partial = "all") instead.

- fviz_hmfa_quanti_var(): Graph of quantitative variables. Deprecated.
  Use fviz_hmfa_var(X, "quanti.var") instead.

- fviz_hmfa_quali_var(): Graph of qualitative variables. Deprecated. Use
  fviz_hmfa_var(X, "quali.var") instead.

- fviz_hmfa_group(): Graph of the groups representation. Deprecated. Use
  fviz_hmfa_var(X, "group") instead.

## Usage

``` r
get_mfa_quanti_var(res.mfa)

get_mfa_quali_var(res.mfa)

get_mfa_group(res.mfa)

fviz_mfa_ind_starplot(X, ...)

fviz_mfa_group(X, ...)

fviz_mfa_quanti_var(X, ...)

fviz_mfa_quali_var(X, ...)

get_hmfa_quanti_var(res.hmfa)

get_hmfa_quali_var(res.hmfa)

get_hmfa_group(res.hmfa)

fviz_hmfa_quanti_var(X, ...)

fviz_hmfa_quali_var(X, ...)

fviz_hmfa_ind_starplot(X, ...)

fviz_hmfa_group(X, ...)
```

## Arguments

- res.mfa:

  an object of class MFA \[FactoMineR\].

- X:

  an object of class MFA or HMFA \[FactoMineR\].

- ...:

  Other arguments.

- res.hmfa:

  an object of class HMFA \[FactoMineR\].

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>
