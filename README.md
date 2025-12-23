# factoextra-modern

[![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)](https://github.com/erdeyl/factoextra-modern)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/gpl-2.0)

**A modernized fork of factoextra with full compatibility for ggplot2 3.4.0+, tidyr 1.3.0+, and R 4.0+**

## About This Fork

This repository is a **temporary distribution** of the factoextra package with critical compatibility fixes for modern R environments. It is intended to be used until the upstream pull request ([kassambara/factoextra#194](https://github.com/kassambara/factoextra/pull/194)) is merged.

### Why This Fork Exists

The original factoextra package generates numerous deprecation warnings with:
- ggplot2 3.4.0+ (released 2022)
- tidyr 1.3.0+
- R 4.0+ (released 2020)

This fork resolves all deprecation warnings while maintaining full backward compatibility.

## Installation

```r
# Install from GitHub
# install.packages("remotes")
remotes::install_github("erdeyl/factoextra-modern")
```

## Key Fixes in This Fork

### ggplot2 3.4.0+ Compatibility
- Replaced all `aes_string()` with `aes()` + `.data` pronoun
- Fixed `size` → `linewidth` for line-based geoms
- Fixed `guides(... = FALSE)` → `guides(... = "none")`

### R 4.0+ Compatibility
- Fixed `class() == ` comparisons with proper `inherits()` checks

### Dependency Reduction
- Removed tidyr dependency (replaced with base R)
- Removed reshape2 dependency

### Bug Fixes
- Fixed `fviz_dend()` rect_border errors
- Fixed `fviz_nbclust()` cluster ordering with k > 9
- Fixed Hopkins statistic formula and biased sampling
- Fixed `facto_summarize()` axes parameter
- Fixed `fviz_pca_biplot()` rescaling bug

### New Features
- `fviz_eig()` parallel analysis (Horn's method)
- `fviz_pca_biplot()` scaling types (auto, form, covariance)

### Performance Optimizations
- Vectorized computations using `sweep()` and `rowSums()`

## Original Package

This package is a derivative work of **factoextra** by Alboukadel Kassambara and Fabian Mundt.

- **Original Repository:** https://github.com/kassambara/factoextra
- **CRAN:** https://CRAN.R-project.org/package=factoextra
- **Documentation:** https://rpkgs.datanovia.com/factoextra/

## License

This package is distributed under the **GNU General Public License v2 (GPL-2)**, the same license as the original factoextra package.

## Citation

When using this package, please cite **both** the original authors and this fork:

### Primary Citation (Original Authors)

```
Kassambara A, Mundt F (2020). factoextra: Extract and Visualize the Results
of Multivariate Data Analyses. R package version 1.0.7.
https://CRAN.R-project.org/package=factoextra
```

### BibTeX (Original)

```bibtex
@Manual{factoextra,
  title = {factoextra: Extract and Visualize the Results of Multivariate Data Analyses},
  author = {Alboukadel Kassambara and Fabian Mundt},
  year = {2020},
  note = {R package version 1.0.7},
  url = {https://CRAN.R-project.org/package=factoextra},
}
```

### Secondary Citation (This Fork)

If you specifically used this modernized fork, please also acknowledge:

```
Erdey L (2025). factoextra-modern: Modernized fork of factoextra with
ggplot2 3.4.0+, tidyr, and R 4.0+ compatibility fixes.
R package version 1.0.8. https://github.com/erdeyl/factoextra-modern
```

### BibTeX (This Fork)

```bibtex
@Manual{factoextra-modern,
  title = {factoextra-modern: Modernized Fork of factoextra},
  author = {Laszlo Erdey},
  year = {2025},
  note = {R package version 1.0.8. Based on factoextra by Kassambara and Mundt.},
  url = {https://github.com/erdeyl/factoextra-modern},
}
```

## Acknowledgments

- **Alboukadel Kassambara** - Original author and maintainer of factoextra
- **Fabian Mundt** - Original co-author of factoextra
- **Claude Code** - AI assistance in developing compatibility fixes

## Upstream Pull Request

The fixes in this fork have been submitted as a pull request to the original repository:
- **PR #194:** https://github.com/kassambara/factoextra/pull/194

Once the PR is merged and released on CRAN, users should switch back to the official package:

```r
install.packages("factoextra")
```

## Contact

- **Fork Maintainer:** László Erdey (erdey.laszlo@econ.unideb.hu)
- **Affiliation:** Faculty of Economics and Business, University of Debrecen, Hungary
- **ORCID:** [0000-0002-6781-4303](https://orcid.org/0000-0002-6781-4303)
