# snowSQL-browserauth-autoclose

A super overwrought thing which generates a https://www.tampermonkey.net/
userscript to close tabs left behind by SnowSQL's OAuth redirect.

## Setup
```
brew bundle install
asdf install
```

## Generate Userscript

```sh
./build.sh
# This should output to dist/main.js
```

## Load Userscript into Tampermonkey

TODO: Provide some more detail on this step.

There may be some boilerplate finagling needed.

#### Dhall templating?

I don't remember exactly what my goal was with `UserScript.dhall`, but I think
it was supposed to take care of some of the more boilerplate-ish parts of this.

Right now I have this in my shell history, though so it may be something to go
off of if I ever decide to come back and pick this up one day:

```sh
dhall text <<< ./UserScript.dhall | cat - .test/main.js
```
