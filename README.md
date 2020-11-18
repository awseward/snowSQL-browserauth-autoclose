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
./us.sh

# This will output a Tampermonkey userscript with a minified body.
./us_minified.sh
```

## Load Userscript into Tampermonkey

TODO: Provide some more detail on this step.
