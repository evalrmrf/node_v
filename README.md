# node_v

A CLI tool to check compatibility of your system NodeJS and (or) NPM versions with your project engines

## Why?

The behaviour of your project may depend on particular versions of NodeJS and NPM.

Engines field in package.json allows you to define specific versions of NodeJS and NPM which are compatible with your project.
The [documentation of engines field](https://docs.npmjs.com/cli/v8/configuring-npm/package-json#engines).

How to check compatibility of user's NodeJS or NPM versions?

One of the receipts is to create `.npmrc` file and put there `engine-strict=true` like in the [example](https://stackoverflow.com/questions/29349684/how-can-i-specify-the-required-node-js-version-in-package-json).
This receipt works perfectly for `npm i` command, but doesn't work with `npm ci` command.

### How to use

`npx node_v check`

### List of available commands

```
node_v [command]
    
Available Commands:

    check       check both nodejs and npm versions  
    node        check nodejs version  
    npm         check npm version  
    help        display help menu
    version     display node_v version
    system      display OS nodejs and npm versions"

```