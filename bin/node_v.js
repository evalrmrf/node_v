#! /usr/bin/env node

const { exec } = require('child_process');

exec('sh node_modules/@rerm/node_v/bin/cli.sh',
    (error, stdout, stderr) => {
        if (stderr){
            console.log(stderr)
            console.log('Sorry, I am not able to check your NodeJS and NPM versions')
            return true
        }
        console.log(stdout);
});