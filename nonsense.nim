import dom
import sugar
import tables

proc renderUrl(url: string): string = "url('" & url & "')"

const properties = {
  "background-attachment": "fixed",
  "background-image": renderUrl("https://media.giphy.com/media/3EiNpweH34XGoQcq9Q/giphy.gif"),
  "background-position": "center",
  "background-repeat": "no-repeat",
  "background-size": "800px 600px"
}.toTable()

proc setBgImage(body: Element) =
  let style = body.style
  for key, val in properties.pairs:
    style.setProperty(key, val)

proc closeNonsense*(document: Document, lengthMs: int) =
  setBgImage document.body
  # Would be nice to be able to just pass `window.close`, but it doesn't like
  # that ¯\_(ツ)_/¯
  discard setTimeout(() => window.close(), lengthMs)
