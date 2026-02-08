# factoextraplus: Extract and Visualize the Results of Multivariate Data Analyses (Extended)

Supplementary compatibility updates for factoextra (Kassambara & Mundt,
2020). Modern R ecosystem support (ggplot2 \>= 4.0.0, ggpubrplus \>=
0.9.0, FactoMineR \>= 2.13, R \>= 4.1.0) - to be cited with the original
package. Provides easy-to-use functions to extract and visualize the
output of multivariate data analyses, including 'PCA' (Principal
Component Analysis), 'CA' (Correspondence Analysis), 'MCA' (Multiple
Correspondence Analysis), 'FAMD' (Factor Analysis of Mixed Data), 'MFA'
(Multiple Factor Analysis) and 'HMFA' (Hierarchical Multiple Factor
Analysis) functions from different R packages. It contains also
functions for simplifying some clustering analysis steps and provides
'ggplot2'-based elegant data visualization.

## Details

factoextraplus is an extended version of factoextra with modernized code
for compatibility with current R ecosystem (ggplot2 4.0.0+, FactoMineR
2.13+, R 4.1.0+). It depends on ggpubrplus for ggplot2 4.x
compatibility.

General resources:

- [factoextraplus
  documentation](https://github.com/erdeyl/factoextraplus)

- [Original factoextra
  documentation](https://rpkgs.datanovia.com/factoextra/)

## Breaking changes

- Requires R \>= 4.1.0, ggplot2 \>= 4.0.0, FactoMineR \>= 2.13, and
  ggpubrplus \>= 0.9.0.

- Dependency switched from ggpubr to ggpubrplus (\>= 0.9.0).

- Hopkins statistic uses the corrected formula (Wright 2022); results
  differ from legacy factoextra.

- Legacy FactoMineR category labels may no longer match; use
  [`map_factominer_legacy_names`](https://erdeyl.github.io/factoextraplus/reference/map_factominer_legacy_names.md)
  to translate them.


    # Install ggpubrplus first
    remotes::install_github("erdeyl/ggpubrplus@v0.9.0")
    remotes::install_github("erdeyl/factoextraplus")

    # Hopkins statistic (corrected formula; warns once per session)
    get_clust_tendency(iris[, -5], n = 50)
    # Silence the one-time warning if needed
    options(factoextraplus.warn_hopkins = FALSE)

## See also

Useful links:

- <https://github.com/erdeyl/factoextraplus>

- [doi:10.5281/zenodo.18131494](https://doi.org/10.5281/zenodo.18131494)

- Report bugs at <https://github.com/erdeyl/factoextraplus/issues>

## Author

**Maintainer**: Laszlo Erdey <erdey.laszlo@econ.unideb.hu> (Faculty of
Economics and Business, University of Debrecen, Hungary)

Authors:

- Alboukadel Kassambara <alboukadel.kassambara@gmail.com> (Original
  factoextra package author)

- Fabian Mundt <f.mundt@inventionate.de> (Original factoextra package
  author)
