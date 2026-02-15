#' @keywords internal
#'
#' @details
#'
#' factoextraplus is an extended version of factoextra with modernized code
#' for compatibility with current R ecosystem (ggplot2 4.0.2+, FactoMineR 2.13+,
#' R 4.1.0+). It depends on ggpubrplus for ggplot2 4.x compatibility.
#'
#' General resources:
#'
#'\itemize{
#' \item \href{https://github.com/erdeyl/factoextraplus}{factoextraplus documentation}
#' \item \href{https://rpkgs.datanovia.com/factoextra/}{Original factoextra documentation}
#'}
#'
#' @section Breaking changes:
#'
#' \itemize{
#' \item Requires R >= 4.1.0, ggplot2 >= 4.0.2, FactoMineR >= 2.13, and ggpubrplus >= 0.9.0.1.
#' \item Dependency switched from ggpubr to ggpubrplus (>= 0.9.0.1).
#' \item Hopkins statistic uses the corrected formula (Wright 2022); results differ from legacy factoextra.
#' \item Legacy FactoMineR category labels may no longer match; use
#'   \code{\link{map_factominer_legacy_names}} to translate them.
#' }
#'
#' \preformatted{
#' # Install ggpubrplus first
#' remotes::install_github("erdeyl/ggpubrplus@v0.9.0.1")
#' remotes::install_github("erdeyl/factoextraplus")
#'
#' # Hopkins statistic (corrected formula; warns once per session)
#' get_clust_tendency(iris[, -5], n = 50)
#' # Silence the one-time warning if needed
#' options(factoextraplus.warn_hopkins = FALSE)
#' }
#'
#' @import ggpubrplus FactoMineR
"_PACKAGE"
