import dom, strutils
import ./nonsense

const
  DOMContentLoaded = "DOMContentLoaded"
  pendingText = "Redirecting to Snowflake"
  successText = "identity was confirmed and propagated"
  nonsenseEnable = true
  nonsenseLengthMs = 2000

var checkAuthdIntvl: ref Interval

proc getText(): string = $ document.body.textContent

proc isSnowflakeAuthCallback(): bool = getText().contains pendingText

proc isAuthd(): bool = getText().contains successText

proc closeIfAuthd() =
  if isAuthd():
    window.clearInterval checkAuthdIntvl
    if nonsenseEnable:
      closeNonsense document, nonsenseLengthMs
    else:
      window.close()

proc main(_: Event) {.exportc.} =
  if isSnowflakeAuthCallback() or isAuthd():
    checkAuthdIntvl = window.setInterval(closeIfAuthd, 100)

document.addEventlistener(DOMContentLoaded, main)
