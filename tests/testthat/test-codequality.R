library(snapr)

# ---------------------------------------------------------------------------
# map_severity() tests
# ---------------------------------------------------------------------------
describe("map_severity()", {
  it("maps known types correctly", {
    expect_snapshot(list(
      error   = map_severity("error"),
      warning = map_severity("warning"),
      style   = map_severity("style")
    ))
  })

  it("maps unknown types to 'minor'", {
    expect_snapshot(list(
      info       = map_severity("info"),
      convention = map_severity("convention"),
      unknown    = map_severity("unknown"),
      empty      = map_severity("")
    ))
  })

  it("errors on non-scalar input", {
    expect_error(map_severity(c("error", "warning")))
    expect_error(map_severity(character(0)))
  })
})

# ---------------------------------------------------------------------------
# lint_to_codequality() tests
# ---------------------------------------------------------------------------
describe("lint_to_codequality()", {
  mock_lint <- list(
    filename    = "R/foo.R",
    line_number = 10,
    column      = 5,
    type        = "warning",
    linter      = "line_length_linter",
    message     = "Lines should not be more than 80 characters."
  )

  it("produces correct output for a typical lint", {
    expect_snapshot_object(
      lint_to_codequality(mock_lint),
      name = "typical-lint"
    )
  })

  it("produces stable fingerprints", {
    r1 <- lint_to_codequality(mock_lint)
    r2 <- lint_to_codequality(mock_lint)
    expect_equal(r1$fingerprint, r2$fingerprint)
    expect_match(r1$fingerprint, "^[0-9a-f]{32}$")
  })

  it("produces different fingerprints for different inputs", {
    lint2 <- mock_lint
    lint2$line_number <- 20
    expect_true(
      lint_to_codequality(mock_lint)$fingerprint !=
        lint_to_codequality(lint2)$fingerprint
    )
  })

  it("handles all-NULL fields gracefully", {
    expect_snapshot_object(
      lint_to_codequality(list(
        filename = NULL, line_number = NULL, column = NULL,
        type = NULL, linter = NULL, message = NULL
      )),
      name = "null-lint"
    )
  })

  it("handles all-NA fields gracefully", {
    expect_snapshot_object(
      lint_to_codequality(list(
        filename = NA_character_, line_number = NA_integer_,
        column = NA_integer_, type = NA_character_,
        linter = NA_character_, message = NA_character_
      )),
      name = "na-lint"
    )
  })

  it("maps severity correctly across types", {
    expect_equal(
      lint_to_codequality(modifyList(mock_lint, list(type = "error")))$severity,
      "blocker"
    )
    expect_equal(
      lint_to_codequality(modifyList(mock_lint, list(type = "style")))$severity,
      "minor"
    )
  })
})

# ---------------------------------------------------------------------------
# Integration: JSON output matches GitLab Code Quality spec
# ---------------------------------------------------------------------------
describe("JSON output structure", {
  it("produces valid GitLab Code Quality JSON", {
    result <- lint_to_codequality(list(
      filename = "R/bar.R", line_number = 42, column = 1,
      type = "error", linter = "assignment_linter",
      message = "Use <-, not =, for assignment."
    ))
    json_str <- jsonlite::toJSON(list(result), auto_unbox = TRUE, pretty = TRUE)
    expect_snapshot(cat(json_str))
  })

  it("empty lints produce empty JSON array", {
    json <- jsonlite::toJSON(
      lapply(list(), lint_to_codequality),
      auto_unbox = TRUE
    )
    expect_equal(as.character(json), "[]")
  })
})
