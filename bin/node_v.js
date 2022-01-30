#! /usr/bin/env node

'use strict'

const { exec } = require('child_process');
const path = require('path');

process.on('unhandledRejection', err => {
    throw err;
});

const arg = process.argv.slice(2);

const commands = ['check', 'node', 'npm', 'help', 'version', 'system'];

const scriptIndex = arg.findIndex(
    x => x === 'check' || x === 'node' || x === 'npm' || x === 'help' || x === 'version' || x === 'system'
  );
 
const script = scriptIndex === -1 ? arg[0] : arg[scriptIndex];

if(commands.includes(script)) {
    const run_command = path.resolve(__dirname, `${script}.sh`)
    exec(`sh ${run_command}`,
    (error, stdout, stderr) => {
        if (stderr){
            console.log(stderr)
            console.log('Sorry, I am not able to check your nodejs and npm versions')
            process.exit(1)
        }
        console.log(stdout);
    });
} else if (typeof script === 'undefined') {
    const run_command = path.resolve(__dirname, `help.sh`)
    exec(`sh ${run_command}`,
    (error, stdout, stderr) => {
        if (stderr){
            console.log(stderr)
            console.log('Sorry, I am not able to check your nodejs and npm versions')
            process.exit(1)
        }
        console.log(stdout);
    });
} else {
    console.log(`Unknown command ${script}, try to run node_v help`)
}