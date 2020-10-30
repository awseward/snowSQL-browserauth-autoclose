import dom

proc setBgImage(body: Element) =
  body.style.setProperty "background-image",      "url('https://media.giphy.com/media/3EiNpweH34XGoQcq9Q/giphy.gif')";
  body.style.setProperty "background-size",       "800px 600px";
  body.style.setProperty "background-attachment", "fixed";
  body.style.setProperty "background-position",   "center";
  body.style.setProperty "background-repeat",     "no-repeat";

proc doNonsense*(body: Element, enabled : bool = true) =
  if enabled:
    setBgImage body
