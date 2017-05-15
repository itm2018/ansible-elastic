#!/usr/bin/env bash

if [ $(apt list --installed ansible 2>/dev/null | grep -c "ansible ") -eq 0 ];
then
    echo -n "Installing ansible and support packages"
	sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update -y
    sudo apt-get install ansible -y
    sudo apt-get install git build-essential python libtool autoconf pkg-config curl -y
	sudo apt-get install unzip
    sudo ln -s /usr/bin/libtoolize /usr/bin/libtool
    echo "Done!"
else
    echo "VM already configuration. Moving on..."
fi

ansible-playbook /vagrant/ansible/playbook.yml -e hostname=127.0.0.1 --connection=localhost
