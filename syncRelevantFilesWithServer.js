const process = require('process');

const platformStr = process.platform

const { spawn } = require('child_process');

const fs = require('fs');

console.log(`This platform is: ${platformStr}`)

switch(platformStr)
{

    case 'win32':

        //%SystemRoot%\system32\

        //let destDir = '\\..\\TDAKnights-Server\\Maps' //existsSync did not report correctly

        //Create the destination directory as that is not created for us

        //let destDir = fs.realpathSync('\\..\\TDAKnights-Server\\Maps') //did not work

        let cwd = process.cwd()

        //Sets the directory to check for existance and create if it doesn't exist

        //Assumes that the working directory is TDAKnights - the game directory and that TDAKnights-Server is on the same level
        
        let destDir = cwd + '-Server\\Maps'
        
        console.log('destDir - fs.realpathSync: ' + destDir)

        if (!fs.existsSync(destDir)) {

            fs.mkdirSync(destDir, { recursive: true });

            console.log('destDir: ' + destDir)

        } else
        {

            console.log('Exists: ' + destDir)

        }
        
        console.log('Copying files:\n')

        console.log(`Current directory: ${process.cwd()}`);

        //Copy the map files

        const rc = spawn('robocopy', ['Maps', destDir, '/s', '/purge']);

        //, { shell: true }

        
        rc.stdout.on('data', (data) => {
            console.log(`${data}`);
        });
        
        rc.stderr.on('data', (data) => {
            console.error(`${data}`);
        });
        
        rc.on('close', (code) => {
            console.log(`child process exited with code ${code}`);
        });
        
        //console.log('\nDone')

    break
    case 'linux':

        console.log('not currently supported')

    break
    case 'darwin':

        console.log('not currently supported')

    break

}