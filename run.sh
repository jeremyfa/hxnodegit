#!/bin/bash

haxe build.hxml

sed -e 's/window\.jQuery/require\("jquery"\)\(require\("jsdom"\)\.jsdom\(\).defaultView\)/g' index.tmp.js > index.js; rm index.tmp.js

node index.js
