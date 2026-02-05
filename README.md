# factoextraplus

[![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)](https://github.com/erdeyl/factoextraplus)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/gpl-2.0)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18131494.svg)](https://doi.org/10.5281/zenodo.18131494)

**A modernized fork of factoextra with full compatibility for ggplot2 3.5.2+ and R 4.1.0+**

## About This Package

This package is a **fork of factoextra** renamed to `factoextraplus` to avoid package name conflicts while the upstream pull request ([kassambara/factoextra#194](https://github.com/kassambara/factoextra/pull/194)) is pending review.

Once the PR is merged and the original `factoextra` is updated on CRAN, users can switch back to the original package.

**Note:** This package depends on `ggpubrplus` (the modernized fork of `ggpubr`, version >= 0.8.4.1). [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18131490.svg)](https://doi.org/10.5281/zenodo.18131490)

## Installation

```r
# Install from GitHub (install ggpubrplus first)
# install.packages("remotes")
remotes::install_github("erdeyl/ggpubrplus@v0.8.4.1")
remotes::install_github("erdeyl/factoextraplus")
```

## Key Fixes

### ggplot2 3.4.0+ Compatibility
- Replaced all `aes_string()` calls with `aes()` + `.data` pronoun
- Changed `guides(... = FALSE)` to `guides(... = "none")`
- Converted `size` to `linewidth` for line-based geoms

### R 4.1.0+ Fixes
- Fixed "condition has length > 1" errors with proper `inherits()` checks

### Bug Fixes
- `fviz_dend()` rect_border error
- `fviz_nbclust()` cluster ordering for k > 9
- `fviz_nbclust()` silhouette calculation issues
- Hopkins statistic formula corrections (Wright 2022)
- `facto_summarize()` axes parameter handling

## Citation

Please cite both the original package and this fork:

**Original package:**
> Kassambara A, Mundt F (2020). factoextra: Extract and Visualize the Results of Multivariate Data Analyses. R package version 1.0.7. https://CRAN.R-project.org/package=factoextra

**This fork:**
> Erdey L (2026). Supplementary compatibility updates for factoextra (Kassambara & Mundt, 2020): Modern R ecosystem support (ggplot2 ≥3.5.2, R ≥4.1.0) — to be cited with the original package. R package version 1.1.1. https://doi.org/10.5281/zenodo.18131494

## Original Package

This is based on the [factoextra](https://github.com/kassambara/factoextra) package by Dr. Alboukadel Kassambara.

For documentation of the original package, see: https://rpkgs.datanovia.com/factoextra/

## License

GPL-2

## Credits

- **Original Authors**: Dr. Alboukadel Kassambara, Fabian Mundt
- **Maintainer**: Laszlo Erdey (Faculty of Economics and Business, University of Debrecen, Hungary)
