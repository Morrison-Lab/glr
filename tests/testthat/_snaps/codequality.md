# map_severity() / maps known types correctly

    Code
      list(error = map_severity("error"), warning = map_severity("warning"), style = map_severity(
        "style"))
    Output
      $error
      [1] "blocker"
      
      $warning
      [1] "major"
      
      $style
      [1] "minor"
      

# map_severity() / maps unknown types to 'minor'

    Code
      list(info = map_severity("info"), convention = map_severity("convention"),
      unknown = map_severity("unknown"), empty = map_severity(""))
    Output
      $info
      [1] "minor"
      
      $convention
      [1] "minor"
      
      $unknown
      [1] "minor"
      
      $empty
      [1] "minor"
      

# JSON output structure / produces valid GitLab Code Quality JSON

    Code
      cat(json_str)
    Output
      [
        {
          "description": "Use <-, not =, for assignment.",
          "check_name": "assignment_linter",
          "fingerprint": "9686f2198fb4ab327142eb031a6cc1b5",
          "severity": "blocker",
          "location": {
            "path": "R/bar.R",
            "lines": {
              "begin": 42
            }
          }
        }
      ]
