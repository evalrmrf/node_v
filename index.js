#! /usr/bin/env node

'use strict'

const cli = require('./bin/node_v.js')

process.on('unhandledRejection', err => {
    throw err;
});

const arg = process.argv.slice(2);

if (arg[0] !== 'check') {
    process.exit(1)
}

return cli
