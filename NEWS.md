# factoextra 1.0.8

## Major Changes

### Package Metadata Updates

* **Raised minimum R version** to R >= 4.0.0 (from R >= 3.1.2) to align with
  current dependency requirements (ggplot2, rlang) and modern CRAN policies.

* **Added ggplot2 version requirement** (>= 3.4.0) to ensure compatibility
  with the modernized code that uses `linewidth` and other 3.4.0+ features.

* **Added LazyDataCompression: xz** to comply with modern CRAN policies for
  efficient data storage.

### Deprecated Function Improvements

* **Fixed `get_mfa_quali_var()` warning message**: Corrected copy-paste error

  where the warning incorrectly suggested using `'quanti.var'` instead of
  `'quali.var'`.

* **Refactored deprecated MFA/HMFA helpers**: Replaced string-based `warning()`
  calls with proper `.Deprecated()` function for R-standard deprecation handling.
  Added internal `.deprecate_warn()` helper to consolidate duplicated
  warning+dispatch patterns and reduce maintenance overhead.

### ggplot2 3.4.0+ Compatibility Fixes

* **`aes_string()` deprecation** (Issues #179, #183, #188, #190, #191, #192):
  Replaced all uses of the deprecated `aes_string()` function with `aes()` +
  `.data` pronoun from rlang package.
  This affects: `fviz.R`, `fviz_add.R`, `fviz_cluster.R`, `fviz_dend.R`,
  `fviz_nbclust.R`, `fviz_silhouette.R`, `dist.R`, `utilities.R`

* **`guides(... = FALSE)` deprecation** (Issues #141, #156, #179):
  Replaced `FALSE` with `"none"` in all `guides()` calls as required by
  ggplot2 3.3.4+.
  This affects: `fviz_dend.R`, `fviz_mclust.R`

* **`size` aesthetic deprecation for lines** (Issue #191): Replaced `size`
  with `linewidth` for line-based geoms (geom_path, geom_segment, geom_rect) as required
  by ggplot2 3.4.0+.
  This affects: `fviz.R`, `fviz_dend.R`, `fviz_mfa.R`, `fviz_hmfa.R`

### Dependency Reduction

* **Removed tidyr dependency** (Issue #162, #189): Replaced deprecated
  `tidyr::gather_()` / `tidyr::pivot_longer()` with base R `stats::reshape()`
  for wide-to-long data transformation.
  This affects: `fviz_mclust.R`, `utilities.R`

* **Removed reshape2 dependency**: Replaced `reshape2::melt()` with base R
  data.frame construction for distance matrix conversion.
  This affects: `dist.R`, `get_clust_tendency.R`

### R 4.0+ Compatibility Fixes

* **`class() == ` comparison bug** (Issues #148, #151, #163, #171, #180):
  Fixed "condition has length > 1" warnings by replacing `class(x) == "type"`
  comparisons with proper `inherits()` checks as recommended since R 4.0.0.
  This affects: `fviz_nbclust.R`, `fviz_dend.R`

## Bug Fixes

* Fixed `fviz_dend()` rect_border "condition has length > 1" error when using
  multiple colors for rectangles (Issues #151, #163, #180)

* Fixed `fviz_nbclust()` "condition has length > 1" error with NbClust results
  (Issues #148, #171)

* Fixed `fviz_contrib()` and `fviz_cos2()` returning NULL names when using
  single axis (axes = 1)

* Fixed biased row sampling in `get_clust_tendency()` Hopkins statistic
  calculation. The original `round(runif(n, 1, nrow(data)))` favored middle
  rows; replaced with `sample()` for uniform selection (Issue #133)

* Fixed `facto_summarize()` ignoring the `axes` parameter for `mca.cor` and
  `quanti.sup` elements, now correctly subsets to specified axes (PR #143)

* Fixed `fviz_pca_biplot()` incorrect variable rescaling due to operator
  precedence error in parenthesis placement. The ratio calculation now
  correctly computes `(max - min) / (max - min)` instead of
  `max - (min / (max - min))` (PR #129)

* Replaced internal `ggpubr:::` function calls with exported
  `ggpubr::get_palette()` to improve package stability and CRAN compliance

* Fixed `fviz_nbclust()` incorrect ordering of clusters when using NbClust
  with more than 9 clusters. Cluster labels now sort numerically (1, 2, ..., 10)
  instead of alphabetically (1, 10, 2, ...) (Issue #131)

* **Fixed `get_clust_tendency()` Hopkins statistic formula**: The previous
  implementation incorrectly used exponent d=1 in the Hopkins formula. The
  correct formula from Cross & Jain (1982) uses d=D where D is the
  dimensionality (number of columns) of the data. This fix ensures the
  statistic follows its theoretical Beta(n, n) distribution under the null
  hypothesis. Reference: Wright (2022) "Will the Real Hopkins Statistic
  Please Stand Up?" The R Journal, 14(3), 282-292.

## New Features

* **`fviz_eig()` parallel analysis (Horn's method)**: Added `parallel = TRUE`
  option to overlay parallel analysis threshold on scree plots. Components with
  eigenvalues above the threshold line are considered significant. Uses 95th
  percentile of simulated random data eigenvalues for conservative estimation.
  Reference: Horn (1965) "A rationale and test for the number of factors in
  factor analysis." Psychometrika, 30, 179-185.

* **`fviz_pca_biplot()` scaling types**: Added `biplot.type` parameter with
  three options based on Gabriel (1971):
  - `"auto"` (default): Range-based rescaling for visualization
  - `"form"`: Form biplot preserving distances between individuals
  - `"covariance"`: Covariance biplot preserving variable correlations
  Reference: Gabriel, K.R. (1971) "The biplot graphic display of matrices
  with application to principal component analysis." Biometrika, 58, 453-467.

## Documentation Fixes

* Fixed documentation typos: "whih" → "which", "arround" → "around",
  "Therfore" → "Therefore", "set o points" → "set of points" (Issue #64)

* Added clarification in `get_clust_tendency()` documentation about Hopkins
  statistic interpretation differences between packages (H vs 1-H)

* Added documentation in `fviz_gap_stat()` explaining why "firstSEmax"
  (Maechler, 2012) is the recommended default over "Tibs2001SEmax"

## Performance Optimizations

All optimizations maintain full numerical precision - results are identical
to the original implementation.

### PCA/CA/MCA Result Extraction (`get_pca.R`, `utilities.R`)

* **Vectorized individual results computation**: Replaced row-wise `apply()`
  loops with vectorized `sweep()` and `rowSums()` operations for computing
  squared distances, cos2, and contributions.

* **Vectorized variable correlation**: Replaced `t(apply())` with `sweep()`
  for computing variable correlations with principal components.

* **Optimized CA supplementary point extraction**: Replaced `t(apply())` with
  `sweep()` for principal coordinate computation in `.get_ca_col_sup()` and
  `.get_ca_row_sup()`.

### Cluster Analysis (`fviz_nbclust.R`)

* **Optimized within-cluster sum of squares**: Replaced explicit `for` loop
  with `vapply()` and pre-computed cluster indices using `split()`.

### Factor Summarization (`facto_summarize.R`)

* **Vectorized coordinate extraction**: Replaced `apply(dd^2, 1, sum)` with
  `rowSums(dd^2)` for computing coordinate magnitudes.

* **Vectorized contribution adjustment**: Replaced `t(apply())` with `sweep()`
  and `rowSums()` for eigenvalue-weighted contribution calculations.

## Contributors

* Laszlo Erdey (Faculty of Economics and Business, University of Debrecen, Hungary; erdey.laszlo@econ.unideb.hu) - ggplot2 3.4.0+, tidyr, and R 4.0+ compatibility fixes, dependency reduction, performance optimizations, and bug fixes

---

# factoextra 1.0.7

See previous NEWS entries at https://github.com/kassambara/factoextra
