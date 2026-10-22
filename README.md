# glr

<!-- badges: start -->
<!-- badges: end -->

**H**ealth **A**nalytics **C**ore **R** utilities — shared helper functions for
[gla](https://gitlab.example.com/example-group/gla)
CI templates.

## Installation

```r
# From your GitLab instance (replace the group with your own):
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
pak::pkg_install("gitlab::example-group/glr")
```

## What's in the box?

| Function | Purpose |
|----------|---------|
| `safe_char()` | Safely extract a scalar character field (guards NULL/NA/empty) |
| `safe_num()` | Safely extract a scalar numeric field |
| `map_severity()` | Map lintr type → GitLab Code Quality severity |
| `lint_to_codequality()` | Convert a lint object → GitLab Code Quality JSON entry |

These are used by `scripts/lint-codequality.R` in gla to produce GitLab
Code Quality artifacts from lintr output.

## Development

```r
# Install dev dependencies
pak::pak(".", dependencies = TRUE)

# Run tests
devtools::test()

# Check package
devtools::check()
```

## License

MIT
