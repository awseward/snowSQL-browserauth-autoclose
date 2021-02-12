import dom

proc renderUrl(url: string): string = "url('" & url & "')"

proc setBgImage(body: Element) =
  let style = body.style
  style.setProperty "background-image", renderUrl "https://media.giphy.com/media/3EiNpweH34XGoQcq9Q/giphy.gif"
  style.setProperty "background-size", "800px 600px"
  style.setProperty "background-attachment", "fixed"
  style.setProperty "background-position", "center"
  style.setProperty "background-repeat", "no-repeat"

proc doNonsense*(document: Document) =
  setBgImage document.body
