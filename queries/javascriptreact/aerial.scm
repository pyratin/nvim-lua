;; extends

; Match React hooks (e.g. useEffect, useState, useExtend)
(call_expression
  function: (identifier) @name
  (#match? @name "^use[A-Z]")
  (#set! "kind" "Function")) @symbol

; Match React hooks called as properties (e.g. React.useEffect)
(call_expression
  function: (member_expression
    property: (property_identifier) @name
    (#match? @name "^use[A-Z]"))
  (#set! "kind" "Function")) @symbol

; Match JSX self-closing elements
(jsx_self_closing_element
  name: (_) @name
  (#set! "kind" "Object")) @symbol

; Match JSX elements with open and close tags
(jsx_element
  open_tag: (jsx_opening_element
    name: (_) @name)
  (#set! "kind" "Object")) @symbol
