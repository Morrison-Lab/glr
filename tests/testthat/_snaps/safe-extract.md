# safe_char() / returns default for NULL / empty / NA

    Code
      list(null = safe_char(NULL), null_fb = safe_char(NULL, "fallback"), empty_vec = safe_char(
        character(0)), empty_vec_fb = safe_char(character(0), "fallback"), empty_str = safe_char(
        ""), empty_str_fb = safe_char("", "fallback"), na = safe_char(NA_character_),
      na_fb = safe_char(NA_character_, "fallback"))
    Output
      $null
      [1] ""
      
      $null_fb
      [1] "fallback"
      
      $empty_vec
      [1] ""
      
      $empty_vec_fb
      [1] "fallback"
      
      $empty_str
      [1] ""
      
      $empty_str_fb
      [1] "fallback"
      
      $na
      [1] ""
      
      $na_fb
      [1] "fallback"
      

# safe_num() / returns default for NULL / empty / NA

    Code
      list(null = safe_num(NULL), null_fb = safe_num(NULL, 99L), empty_num = safe_num(
        numeric(0)), empty_int_fb = safe_num(integer(0), 5L), na = safe_num(NA),
      na_int = safe_num(NA_integer_, 1L), na_real = safe_num(NA_real_, 2L))
    Output
      $null
      [1] 0
      
      $null_fb
      [1] 99
      
      $empty_num
      [1] 0
      
      $empty_int_fb
      [1] 5
      
      $na
      [1] 0
      
      $na_int
      [1] 1
      
      $na_real
      [1] 2
      
