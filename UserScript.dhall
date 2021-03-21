let Metadata =
      { name : Text
      , namespace : Text
      , version : Text
      , description : Text
      , author : Text
      , match : Text
      , grant : Text
      }

let render =
      λ(m : Metadata) →
      λ(script : Text) →
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

in  render
      { name = "Snowflake Browser Oauth Tab Autoclose"
      , namespace = "…"
      , version = "${env:USERSCRIPT_VERSION as Text}"
      , description =
          "Cleans up after Snowflake's browser Oauth flow so you don't have a junk tab lying around"
      , author = "…"
      , match = "http://localhost/*"
      , grant = "window.close"
      }
      ./dist/main.js as Text
