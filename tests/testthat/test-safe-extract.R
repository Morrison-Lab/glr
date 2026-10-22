# ---------------------------------------------------------------------------
# safe_char() tests
# ---------------------------------------------------------------------------
describe("safe_char()", {
  it("returns value for non-empty strings", {
    expect_equal(safe_char("hello"), "hello")
    expect_equal(safe_char(c("first", "second")), "first")
  })

  it("returns default for NULL / empty / NA", {
    expect_snapshot(list(
      null         = safe_char(NULL),
      null_fb      = safe_char(NULL, "fallback"),
      empty_vec    = safe_char(character(0)),
      empty_vec_fb = safe_char(character(0), "fallback"),
      empty_str    = safe_char(""),
      empty_str_fb = safe_char("", "fallback"),
      na           = safe_char(NA_character_),
      na_fb        = safe_char(NA_character_, "fallback")
    ))
  })
})

# ---------------------------------------------------------------------------
# safe_num() tests
# ---------------------------------------------------------------------------
describe("safe_num()", {
  it("returns value for valid numbers", {
    expect_equal(safe_num(42), 42)
    expect_equal(safe_num(3.14), 3.14)
    expect_equal(safe_num(c(10, 20, 30)), 10)
    expect_equal(safe_num(7L), 7L)
  })

  it("returns default for NULL / empty / NA", {
    expect_snapshot(list(
      null         = safe_num(NULL),
      null_fb      = safe_num(NULL, 99L),
      empty_num    = safe_num(numeric(0)),
      empty_int_fb = safe_num(integer(0), 5L),
      na           = safe_num(NA),
      na_int       = safe_num(NA_integer_, 1L),
      na_real      = safe_num(NA_real_, 2L)
    ))
  })
})
