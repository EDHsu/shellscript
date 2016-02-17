#!/bin/sh

echo "==> install oracle java 8"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

echo "==> setup java env variables"
sudo apt-get install -y oracle-java8-set-default
sudo apt-get update

echo "==> check java version"
java -version

echo "==> get elasticsearch 2.2.0"
curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.0/elasticsearch-2.2.0.tar.gz

echo "==> unzip package"
tar -xvf elasticsearch-2.2.0.tar.gz


echo "==> create a bunch of files and folders in your current directory. We then go into the bin directory as follows"
echo "$ cd elasticsearch-2.2.0/bin"

echo "==> ready to start our es node and single cluster"
echo "$ ./elasticsearch"

echo "==> check installation"
echo "curl 'http://localhost:9200/?pretty'"
