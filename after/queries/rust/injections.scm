; extends

((string_content) 
 @injection.content
 (#lua-match? @injection.content "^[Ss][Ee][Ll][Ee][Cc][Tt].*[Ff][Rr][Oo][Mm]")
 (#set! injection.language "sql"))

((string_content) 
 @injection.content
 (#lua-match? @injection.content "[Uu][Pp][Dd][Aa][Tt][Ee].*[Ss][Ee][Tt]")
 (#set! injection.language "sql"))

((string_content) 
 @injection.content
 (#lua-match? @injection.content "[Dd][Ee][Ll][Ee][Tt][Ee].*[Ff][Rr][Oo][Mm]")
 (#set! injection.language "sql"))

((string_content) 
 @injection.content
 (#lua-match? @injection.content "[Ii][Nn][Ss][Ee][Rr][Tt].*[Ii][Nn][Tt][Oo]")
 (#set! injection.language "sql"))
