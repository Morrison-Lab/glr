#' Safely extract a scalar character field
#'
#' Guards against NULL, zero-length, NA, and empty-string values that can
#' occur in malformed lint objects.
#'
#' @param x A value to extract (typically a field from a lint object).
#' @param default Default value if x is NULL, empty, NA, or zero-length.
#' @return A single character string.
#' @export
#' @examples
#' safe_char("hello")
#' safe_char(NULL)
#' safe_char(NA_character_)
safe_char <- function(x, default = "") {
  if (!is.null(x) && length(x) > 0 && !is.na(x[[1]]) && nzchar(x[[1]])) {
    x[[1]]
  } else {
    default
  }
}

#' Safely extract a scalar numeric field
#'
#' Guards against NULL, zero-length, and NA — all of which can occur in
#' malformed lint objects and would produce invalid JSON for GitLab.
#'
#' @param x A value to extract (typically a field from a lint object).
#' @param default Default value if x is NULL, empty, NA, or zero-length.
#' @return A single numeric/integer value.
#' @export
#' @examples
#' safe_num(42)
#' safe_num(NULL)
#' safe_num(NA_integer_)
safe_num <- function(x, default = 0L) {
  if (!is.null(x) && length(x) > 0 && !is.na(x[[1]])) x[[1]] else default
}
