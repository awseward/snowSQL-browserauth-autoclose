import dom, strutils
import ./nonsense

const DOMContentLoaded = "DOMContentLoaded"
const pendingText = "Redirecting to Snowflake in"
const successText = "Your identity was confirmed and propagated to Snowflake SnowSQL."

proc isSnowflakeAuthCallback(body: Element): bool =
  let text = $ body.getElementsByTagName("pre")[0].innerText
  text.contains pendingText

proc isAuthd(body: Element): bool =
  let text = $ body.getElementsByTagName("pre")[0].innerText
  text.contains successText

proc closeIfAuthd(body: Element): void =
  if isAuthd(body):
    doNonsense body
    # window.close()

proc main(_: Event) {.exportc.} =
  let body = document.getElementsByTagName("body")[0]
  if (isSnowflakeAuthCallback body):
    discard window.setInterval(proc() = closeIfAuthd(body), 100)

document.addEventlistener(DOMContentLoaded, main)
