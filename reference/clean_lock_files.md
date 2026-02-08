# Clean up stale package lock files

Removes stale lock directories that can prevent package installation.

Lock files are created during package installation and should be
automatically removed when installation completes. If installation is
interrupted (e.g., by closing R or a crash), these lock files may remain
and block future installations.

## Usage

``` r
clean_lock_files(package = "factoextraplus", lib = .libPaths()[1], ask = TRUE)
```

## Arguments

- package:

  Character string specifying which package lock to remove. Default is
  "factoextraplus". Use "all" to remove all lock files.

- lib:

  Library path to check. Default is the first library in .libPaths().

- ask:

  Logical. If TRUE (default), asks for confirmation before removing.

## Value

Invisibly returns TRUE if files were removed, FALSE otherwise.

## Examples

``` r
if (FALSE) { # \dontrun{
# Remove factoextraplus lock file
clean_lock_files()

# Remove all lock files
clean_lock_files("all")

# Remove without confirmation
clean_lock_files(ask = FALSE)
} # }
```
