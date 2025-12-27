; extends

; I want to conceal the backslash in markdown
((backslash_escape) @string.escape
  (#offset! @string.escape 0 0 0 -1)
  (#set! conceal ""))
