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
# This will output a Tampermonkey userscript
make

# This will output a Tampermonkey userscript without minifying the body.
make print
```

## Load Userscript into Tampermonkey

TODO: Provide some more detail on this step.
