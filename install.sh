#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install openjdk-8-jdk -y
sudo apt install maven -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
\# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  \# First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  \# Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
rvm install 2.1.0
rvm use 2.1.0
sudo apt install gems -y
gem install packer
gem install bundler
sudo apt install graphviz -y
sudo apt install postgresql-server-dev-9.5 -y
sudo apt install virtualbox -y
sudo apt install vagrant -y
sudo apt install libxslt-dev libxml2-dev -y
mvn clean install
#mvn install -rf :oneops-admin
cd oneops-distribution/target/
tar -zcvf distribution-18.02.22-2-SNAPSHOT-oneops.tar.gz distribution-18.02.22-2-SNAPSHOT-archive/
cd ..
cd ..
mvn install -rf :distribution
cd oneops-packer
sudo apt install golang -y
wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
unzip packer_1.1.3_linux_amd64.zip -d packer
cd packer
directory=`pwd`
export PATH=$PATH:$directory
cd ..
./build.sh
cd vagrant
vagrant up
