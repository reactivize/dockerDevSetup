vsc docker:

steps...

### open docker cli

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




