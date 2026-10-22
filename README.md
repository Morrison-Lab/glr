# hacr

<!-- badges: start -->
<!-- badges: end -->

**H**ealth **A**nalytics **C**ore **R** utilities — shared helper functions for
[HACtions](https://gitlab.example.com/example-group/HACtions)
CI templates.

## Installation

```r
# From the internal GitLab (requires network access):
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
pak::pkg_install("gitlab::example-group/hacr")
```

## What's in the box?

| Function | Purpose |
|----------|---------|
| `safe_char()` | Safely extract a scalar character field (guards NULL/NA/empty) |
| `safe_num()` | Safely extract a scalar numeric field |
| `map_severity()` | Map lintr type → GitLab Code Quality severity |
| `lint_to_codequality()` | Convert a lint object → GitLab Code Quality JSON entry |

These are used by `scripts/lint-codequality.R` in HACtions to produce GitLab
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
