import dom, sugar, strutils

proc doNonsense*(body: Element, enabled : bool = true) =
  if enabled:
    body.style.setProperty "background-color", "green"
    body.style.setProperty "color",            "yellow"
