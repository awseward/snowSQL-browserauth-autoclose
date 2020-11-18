import
  dom
, strutils
, sugar
import ./nonsense

const
  DOMContentLoaded = "DOMContentLoaded"
  pendingText      = "Redirecting to Snowflake client in"
  successText      = "Your identity was confirmed and propagated to Snowflake SnowSQL."
  enableNonsense   = true

var checkAuthdIntvl : ref Interval

proc getText(body: Element): string =
  # $ body.getElementsByTagName("pre")[0].innerText
  $ body.getElementsByTagName("pre")[0].textContent

proc isSnowflakeAuthCallback(body: Element): bool =
  getText(body).contains pendingText

proc isAuthd(body: Element): bool =
  getText(body).contains successText

proc close() = window.close

proc closeIfAuthd(body: Element): void =
  if isAuthd(body):
    window.clearInterval checkAuthdIntvl
    if enableNonsense:
      doNonsense body, enabled = enableNonsense
      discard setTimeout(close, 2000)
    else: close()

proc main(_: Event) {.exportc.} =
  let body = document.getElementsByTagName("body")[0]
  if (isSnowflakeAuthCallback body):
    checkAuthdIntvl = window.setInterval(() => closeIfAuthd(body), 100)

document.addEventlistener(DOMContentLoaded, main)
