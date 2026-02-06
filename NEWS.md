# factoextraplus 1.1.1

## Compatibility

- Require ggpubrplus >= 0.8.4.1 for ggplot2 4.0.x compatibility fixes.
- Document explicit ggpubrplus GitHub install to avoid older dependency resolution.
- Bump minimum versions for cluster, dendextend, rlang, and ggrepel.

# factoextraplus 1.1.0

## Package Rename

This package is a modernized fork of `factoextra` renamed to `factoextraplus` to avoid
conflicts while the upstream pull request (kassambara/factoextra#194) is pending.
Once the PR is merged and the original `factoextra` is updated on CRAN, users can
switch back to the original package.

**Note:** This package depends on `ggpubrplus` (the modernized fork of `ggpubr`).

## Issues Addressed

This version addresses the following **31 issues** from the original factoextra repository:

| Issue | Description |
|-------|-------------|
| #192 | aes_string() deprecation warnings |
| #191 | aes_string() and size aesthetic deprecation |
| #190 | aes_string() deprecation warnings |
| #189 | tidyr::gather_() deprecation |
| #188 | aes_string() deprecation warnings |
| #183 | guides(FALSE) deprecation in fviz_dend |
| #180 | fviz_dend condition has length > 1 error |
| #179 | guides(FALSE) deprecation warning |
| #178 | linewidth for ellipses (size deprecation) |
| #174 | guides(FALSE) warning in factoextra |
| #173 | guides(FALSE) warning in ggplot_dend |
| #171 | fviz_nbclust condition has length > 1 error |
| #167 | PR: facto_summarize dimension selection fix |
| #166 | fviz_mca_var axes parameter ignored |
| #163 | fviz_dend rect_border error |
| #162 | tidyr::gather_() replacement |
| #160 | Hopkins statistic formula correction (Wright 2022) |
| #159 | PR: guides(FALSE) deprecation fix |
| #156 | guides(FALSE) deprecation warning |
| #151 | fviz_dend condition has length > 1 error |
| #149 | fviz_nbclust class() comparison error |
| #148 | PR: class() == comparison fix |
| #143 | PR: facto_summarize axes parameter fix |
| #141 | fviz_dend guides(FALSE) deprecation |
| #133 | Hopkins statistic biased sampling |
| #131 | fviz_nbclust cluster ordering with k > 9 |
| #129 | PR: fviz_pca_biplot rescaling fix |
| #150 | fviz_ca_col() typo colcol.sup -> col.col.sup |
| #147 | fviz_nbclust silhouette NA with fewer rows than columns |
| #120 | fviz_mca_var mca.cor axes ignored |
| #113 | fviz_nbclust silhouette error with k.max > 15 |

## Major Changes

### Package Metadata Updates

* **Raised minimum R version** to R >= 4.1.0 (from R >= 3.1.2)
* **Added ggplot2 version requirement** (>= 3.5.2)
* **Changed dependency** from ggpubr to ggpubrplus (>= 0.7.0)

### ggplot2 3.4.0+ Compatibility

* Replaced all `aes_string()` calls with `aes()` + `.data` pronoun pattern
* Changed `guides(... = FALSE)` to `guides(... = "none")` throughout
* Converted `size` aesthetic to `linewidth` for line-based geoms

### Dependency Reduction

* Eliminated tidyr dependency by replacing `gather_()` with base R `reshape()`

### R 4.1.0+ Fixes

* Corrected "condition has length > 1" errors via proper `inherits()` checks

### Bug Fixes

* `fviz_dend()` rect_border error resolution
* `fviz_nbclust()` cluster ordering for k > 9
* `fviz_nbclust()` silhouette calculation with k >= n
* `fviz_ca_col()` parameter typo correction
* Hopkins statistic formula and sampling corrections
* `facto_summarize()` axes parameter handling
* `fviz_pca_biplot()` rescaling corrections
