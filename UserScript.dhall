let Metadata =
      { name : Text
      , namespace : Text
      , version : Text
      , description : Text
      , author : Text
      , match : Text
      , grant : Text
      }

let script = ./dist/main.js as Text

let render =
      λ(m : Metadata) →
        ''
        // ==UserScript==
        // @name        ${m.name}
        // @namespace   ${m.namespace}
        // @version     ${m.version}
        // @description ${m.description}
        // @author      ${m.author}
        // @match       ${m.match}
        // @grant       ${m.grant}
        // ==/UserScript==

        ${script}
        ''

let m
    : Metadata
    = { name = "Autoclose snowflake auth window"
      , namespace = "http://example.com"
      , version = "0.1"
      , description = "Does what it says on the tin."
      , author = "Andrew Seward"
      , match = "http://localhost/*"
      , grant = "window.close"
      }

in  render m
