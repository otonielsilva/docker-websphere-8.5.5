cd /opt/IBM/WebSphere/AppServer/bin
./startServer.sh server1

#echo "Setting configurations"
#./wsadmin.sh -lang jython -f /local_workspace/ConfigWebSphere7_vagrant.py

while ( true )
    do
    echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
    sleep 1
    /bin/bash
done
