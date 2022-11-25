group=docker
if grep -q $group /etc/group
then
        touch .rootless
        echo "group exists"
else
        sudo groupadd group
fi
