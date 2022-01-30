#!/bin/sh

system_node=$(node -v | cut -d '.' -f1 | cut -d 'v' -f2) ;
are_engines_exist=$(cat package.json | grep 'engines')

echo "*************************************"
echo "* I am checking your NodeJS version *" 
echo "*************************************"
echo

if [[ "$are_engines_exist" ]]
then
  engine_node=$(cat package.json | grep '"node":' | sed 's/^[^0-9]*//' | cut -d '.' -f1);
  engine_node_second=$(cat package.json | grep '"node":' | sed 's/.*\(.\{10\}\)\,/\1/' | sed 's/^[^0-9]*//' | cut -d '.' -f1);


if [[ "$system_node" -ge "$engine_node" || "$system_node" -le $engine_node_second  ]]
  then
    echo NodeJS v$system_node is up to date with package engines
    exit 0
  else
    echo system NodeJS version: $system_node
    echo is not compatible with
    echo NodeJS version defined in package.json
    echo  
fi
else
    echo You do not have engines field in you package.json.
    echo Here is the link you can about read engines: https://docs.npmjs.com/cli/v8/configuring-npm/package-json#engines
    echo Please define it.
    exit 1
fi