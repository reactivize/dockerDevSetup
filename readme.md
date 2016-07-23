# Docker Dev Environment Setup
- Run your dev environment from a docker container
- Your container points to your root project directory on your host machine, regardless of the OS
- Browse your web app from the container's IP address



## Files
> .vscode/launch.json
- the debugger config file
- Use the 'attach' config section
- set the "address" key to your docker container ip address
- set the "remoteRoot" to the value of APPROOT environment variable in the Dockerfile
- notice the debugger's "port" value, '5858' must match the EXPOSE value in the Dockerfile

> jsconfig.json
- just an autocreated VSC config file

> Dockerfile
- creates a base image
- install into the base image all npm modules listed in the package.json
- from this Dockerfile you create a docker image with the 'docker build' command
- see below

> server.js
- your project's webserver entrypoint file
- note that the port 3000 in this file must match the EXPOSE value in the Dockerfile


## Steps to get running

```bash
# open the Docker Terminal

# cd into dev root folder

# do a git clone of this repo

# eg path...
# cd /c/Users/mydocker/mydevproj




ls
# should see a Dockerfile



docker build -t mydev .
# the -t switch tags the image with a tagname
# wait a couple minutes



docker images
# should see the mydev image listed under the 'REPOSITORY' column



docker run -d -v "$PWD":/devsrc -p 3000:3000 -p 5858:5858 mydev
# puts a snapshot of the docker image into memory as a docker container



docker ps
# should see the container in the list
# ie... the 'IMAGE' column should say mydev

```




in the VSC IDE, open ./server.js
- then set a breakpoint on the res.status line (line number 5)

` docker-machine ip `
- get the ip address of your docker vm
- eg... 192.168.99.100



in the debug config file called, 'launch.json', confirm these settings are correct...

`
"port": 5858,
"address": "192.168.99.100",
"remoteRoot": "/devsrc/"
`


start the Attach Debug configuration in VS Code
- vsc -> ctrl-shift-d -> select Attach from dropdown list -> click the green arrow (F5)




open a browser to....
192.168.99.100:3000
- the page will stop and spin because your breakpoint got hit
- note: do not browse to localhost; rather, use the container's IP address

in vsc, hit F10 to move the debugger to the next line



## Prereq:

### on your host machine
- install Docker Toolbox
- install NodeJS



## Troubleshoot
 `docker ps `
 - to get your containerID

 ` docker rm -f 099 `
 - stop container, by typing the first three characters of your containerID

` docker run -it -v "$PWD":/devsrc -p 3000:3000 -p 5858:5858 mydev /bin/bash `
- run the container and log into it's terminal

` pwd `
- verify you're in your container's working directory
- which is mounted to the project's root folder

` ls -halt `
- list your project's files in the project root directory

` cat server.js `
- if you change the contents of the server.js file in your IDE, 
- you should see the changes reflected from your container 

` npm run startdebug ` 
- run the server from the container
- then browse to the url (see details above)


## Terms:

VSC:
- Visual Studio Code IDE
- though any IDE can be set up to debug your app in a docker container


## Constraints
For a Win10 host OS, 
- either place your dev project under //c/Users/
- or set read permissions to your project root folder
- so the docker container has permission to read the volume mount on the host OS




## Extra
To map a shared folder from your Host OS to VirtualBox
- from the terminal

` VBoxManage sharedfolder add "default" --name "mydevproj" --hostpath "C:\devApps\mydevproj" `

- This will put an entry in VirtualBox -> default -> settings -> Shared Folders



## Docker Compose
coming soon


## TASK:
add babel so we can write node in es6
- added
