# Docker Dev Environment Setup
- Run your dev environment from a docker container
- Your container points to your root project directory on your host machine, regardless of the OS
- Browse your web app from the container's IP address



## Files
.vscode/launch.json
- the debugger config file
- Use the 'attach' config section
- set the "address" key to your docker container ip address
- set the "remoteRoot" to the value of APPROOT environment variable in the Dockerfile
- notice the debugger's "port" value, '5858' is used in the 'docker run' command

jsconfig.json
- just an autocreated VSC config file

Dockerfile
- creates a base image
- install into the base image all npm modules listed in the package.json
- from this Dockerfile you create a docker image with the 'docker build' command
- see below

index.js
- your project's webserver entrypoint file


## steps to get running

### open the Docker Terminal 

### cd into dev root folder
``` cd /c/_devapps/reactapps/vscode-debug-es6-node-docker-sample ```

``` ls ```
- should see a Dockerfile

``` docker build -t mydev . ```
- wait a couple minutes

``` docker images ```
- should see the hellovscode2 listed

``` docker run -d -v //c/Users/Public/mydocker/mydevproj:/app9 -p 3000:3000 -p 5858:5858 mydev ```
2be51602c45cc23b580a36e2e5fd147488a7cdf30e94a1038e69eb060e430513


``` docker ps ```
- should see the container in the list

open ./index.js and set a breakpoint on the res.status line

start the Attach Debug configuration in VS Code
vsc -> ctrl-shift-d -> select Attach from dropdown list -> click the green arrow (F5)

``` docker-machine ip ```
192.168.99.100
- get this ip address of your docker vm

open a browser to....
192.168.99.100:3000
- the page will spin because your breakpoint got hit

in vsc, hit F10 to move the debugger to the next line



## Prereq:

### on your host machine
- install Docker Toolbox
- install NodeJS






## Terms:

VSC:
- Visual Studio Code