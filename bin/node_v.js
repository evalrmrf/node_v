#! /usr/bin/env node

'use strict'

const { exec } = require('child_process');
const path = require('path');

process.on('unhandledRejection', err => {
    throw err;
});

const arg = process.argv.slice(2);

if (arg[0] !== 'check') {
    console.log(`Unknown command ${arg[0]}. Please try to use "check" command`)
    process.exit(1)
}

const run_command = path.resolve(__dirname, 'cli.sh')

exec(`sh ${run_command}`,
    (error, stdout, stderr) => {
        if (stderr || error){
            console.log('Sorry, I am not able to check your NodeJS and NPM versions')
            process.exit(1)
        }
        console.log(stdout);
});