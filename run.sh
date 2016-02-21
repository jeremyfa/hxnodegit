#!/bin/bash

haxe build.hxml

sed -e 's/window\.jQuery/require\("jquery"\)\(require\("jsdom"\)\.jsdom\(\).defaultView\)/g' index.js > index.tmp.js
rm index.js
mv index.tmp.js index.js

node index.js
