#!/bin/sh

system_node=$(node -v | cut -d '.' -f1 | cut -d 'v' -f2) ;
system_npm=$(npm -v | cut -d '.' -f1 | cut -d 'v' -f2);
are_engines_exist=$(cat package.json | grep 'engines')

echo "**********************************"
echo I am checking your NodeJS and NPM versions
echo "**********************************"
echo

if [[ "$are_engines_exist" ]]
then
  engine_node=$(cat package.json | grep '"node":' | cut -d '=' -f2 | cut -d '.' -f1);
  engine_npm=$(cat package.json | grep '"npm":' | cut -d '=' -f2 | cut -d '.' -f1);

  if [[ "$system_node" = "$engine_node" ]] && [[ "$system_npm" = "$engine_npm" ]]
    then
      echo NodeJS and npm versions are up to date
      echo
      exit 0
  else
      echo I am sorry. Your NodeJS or npm versions are not compatible with our config
      echo Please check package.json engines field
      echo
      exit 1
  fi
else
    echo I am sorry, but you cannot proceed.
    echo You do not have engines field in you package.json file.
    echo Please define it.
    exit 1
fi
