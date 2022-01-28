#! /usr/local/bin/node

const { exec } = require('child_process');

exec('sh cli.sh',
    (error, stdout, stderr) => {
        console.log(stdout);
});