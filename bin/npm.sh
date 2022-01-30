#!/bin/sh

system_node=$(node -v | cut -d '.' -f1 | cut -d 'v' -f2) ;
system_npm=$(npm -v | cut -d '.' -f1 | cut -d 'v' -f2);
are_engines_exist=$(cat package.json | grep 'engines')

echo "**********************************"
echo "* I am checking your NPM version *" 
echo "**********************************"
echo

if [[ "$are_engines_exist" ]]
then
  engine_npm=$(cat package.json | grep '"npm":' | sed 's/^[^0-9]*//' | cut -d '.' -f1);
  engine_npm_second=$(cat package.json | grep '"npm":' | sed 's/.*\(.\{10\}\)\,/\1/' | sed 's/^[^0-9]*//' | cut -d '.' -f1);

if [[ "$system_npm" -ge "$engine_npm" || "$system_npm" -le $engine_npm_second ]]
  then
    echo NPM v$system_npm is up to date with package engines
    exit 0
  else
    echo NPM version: $system_npm
    echo is not compatible with
    echo NPM version defined in package.json
    echo  
fi
else
    echo You do not have engines field in you package.json file.
    echo Here is the link you can about read engines: https://docs.npmjs.com/cli/v8/configuring-npm/package-json#engines
    echo Please define it.
    exit 1
fi