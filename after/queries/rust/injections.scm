;; extends

;; SQL string_literal
((string_literal) @sql
    (#lua-match? @sql "^\"[Ss][Ee][Ll][Ee][Cc][Tt].*[Ff][Rr][Oo][Mm]")
    (#offset! @sql 0 1 0 -1))

((string_literal) @sql
    (#lua-match? @sql "^\"[Uu][Pp][Dd][Aa][Tt][Ee].*[Ss][Ee][Tt]")
    (#offset! @sql 0 1 0 -1))

((string_literal) @sql
    (#lua-match? @sql "^\"[Dd][Ee][Ll][Ee][Tt][Ee]%s*[Ff][Rr][Oo][Mm]")
    (#offset! @sql 0 1 0 -1))

((string_literal) @sql
    (#lua-match? @sql "^\"[Ii][Nn][Ss][Ee][Rr][Tt]%s*[Ii][Nn][Tt][Oo]")
    (#offset! @sql 0 1 0 -1))

;; SQL raw_string_literal
((raw_string_literal) @sql
    (#lua-match? @sql "^r#\"[Ss][Ee][Ll][Ee][Cc][Tt].*[Ff][Rr][Oo][Mm]")
    (#offset! @sql 0 3 0 -2))

((raw_string_literal) @sql
    (#lua-match? @sql "^r#\"[Uu][Pp][Dd][Aa][Tt][Ee].*[Ss][Ee][Tt]")
    (#offset! @sql 0 3 0 -2))

((raw_string_literal) @sql
    (#lua-match? @sql "^r#\"[Dd][Ee][Ll][Ee][Tt][Ee]%s*[Ff][Rr][Oo][Mm]")
    (#offset! @sql 0 3 0 -2))

((raw_string_literal) @sql
    (#lua-match? @sql "^r#\"[Ii][Nn][Ss][Ee][Rr][Tt]%s*[Ii][Nn][Tt][Oo]")
    (#offset! @sql 0 3 0 -2))
