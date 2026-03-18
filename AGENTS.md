# Codex Repo Guidance

This CRAN-style R package repo can invoke the global skill library in `/Users/erdeylaszlo/.codex/skills`.

## Prefer these global skills

- `$stat-dev` for R package code, roxygen comments, tests, examples, vignettes, dependency issues, and compatibility work with `ggplot2`, `FactoMineR`, and related packages.
- `$audit` / `$update` for whole-repo review and fixes.
- `$audit-pr` / `$update-pr` for pull request review and remediation.
- `$gh-fix-ci`, `$gh-address-comments`, and `$tidy-up` for GitHub workflow tasks.
- `$long-document-context` for large `README.Rmd`, NEWS files, and long package sources.
- `$doc` and `$pdf` only when the task is specifically about rendered documentation artifacts.

## Repo notes

- Preserve CRAN-style package structure and keep the fork-specific compatibility goals explicit in docs and tests.
- Prefer editing source files such as `README.Rmd` and roxygen comments rather than generated outputs.
