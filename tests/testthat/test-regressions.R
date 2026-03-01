test_that("get_clust_tendency restores RNG state when seed is provided", {
  old_opt <- getOption("factoextraplus.warn_hopkins", TRUE)
  on.exit(options(factoextraplus.warn_hopkins = old_opt), add = TRUE)
  options(factoextraplus.warn_hopkins = FALSE)

  set.seed(2026)
  seed_before <- get(".Random.seed", envir = .GlobalEnv)
  get_clust_tendency(iris[, 1:4], n = 10, graph = FALSE, seed = 123)
  seed_after <- get(".Random.seed", envir = .GlobalEnv)
  expect_identical(seed_after, seed_before)
})

test_that("fviz_nbclust gap_stat handles maxSE in dots and forwards clusGap args", {
  set.seed(123)
  x <- scale(iris[, 1:4])
  p <- fviz_nbclust(
    x, FUNcluster = stats::kmeans, method = "gap_stat",
    k.max = 3, nboot = 3, verbose = FALSE,
    nstart = 5,
    maxSE = list(method = "firstmax", SE.factor = 1)
  )
  expect_s3_class(p, "ggplot")
})

test_that(".is_color returns a logical vector type-stably", {
  res_empty <- factoextraplus:::.is_color(character(0))
  expect_type(res_empty, "logical")
  expect_length(res_empty, 0)

  res <- factoextraplus:::.is_color(c("red", "not-a-color"))
  expect_type(res, "logical")
  expect_identical(unname(res), c(TRUE, FALSE))
})
