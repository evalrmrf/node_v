# node_v

A CLI tool to check a compatibility of your system NodeJS and NPM versions with your project engines

## Why?

Engines field in package.json allows you to define specific versions of NodeJS and NPM which are compatible with your project.
This is a shame, but you can't really fix your versions.

One of the receipt is to create `.npmrc` file and put there `engine-strict=true` like in the [example](https://stackoverflow.com/questions/29349684/how-can-i-specify-the-required-node-js-version-in-package-json).

This doesn't work with `npm ci` command.

## How to use

`npx node_v check`

### Help menu

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