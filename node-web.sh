#!/bin/bash

## automate the process of node based web server application

#!/bin/bash

# starting a server; execute files

if ! [ node ]; then
echo "nodejs doesn't exist"
exit 1
fi

if ! [ -e package.json]; then
echo "invalid node.js application"
exit 1
fi

start(){
serverstart=$(cat package.json | grep -E "start")
if [-z $serverstart ]; then
echo "Need start script active"
exit 1
fi

npm start
}

stop(){
serverstop=$(cat package.json | grep -E "stop")
if [-z $serverstop ]; then
echo "Need stop script active"
exit 1
fi

npm stop
}

exit 0