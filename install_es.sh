#!/bin/sh

echo "==> install oracle java 8"
#sudo add-apt-repository ppa:webupd8team/java -y
#sudo apt-get update
#sudo apt-get install -y oracle-java8-installer

echo "==> setup java env variables"
#sudo apt-get install -y oracle-java8-set-default
#sudo apt-get update

echo "==> check java version"
#java -version

echo "==> get elasticsearch 2.2.0 and unzip package"
#cd
#curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.0/elasticsearch-2.2.0.tar.gz
#tar -xvf elasticsearch-2.2.0.tar.gz

echo "==> get kibana 4.4.1 and unzip package"
#cd
#curl -L -O https://download.elastic.co/kibana/kibana/kibana-4.4.1-linux-x64.tar.gz
#tar -xvf kibana-4.4.1-linux-x64.tar.gz

echo "==> install sense kibana plugin"
#cd kibana-4.4.1-linux-x64/
#./bin/kibana plugin --install elastic/sense
#cd


echo "======== about elasticsearch ========"
echo "==> create a bunch of files and folders in your current directory. We then go into the bin directory as follows"
echo "$ cd elasticsearch-2.2.0/bin"

echo "==> ready to start our es node and single cluster"
echo "$ ./elasticsearch"

echo "==> check installation"
echo "$ curl 'http://localhost:9200/?pretty'"

echo "==> check the cluster health"
echo "$ curl 'localhost:9200/_cat/health?v'"

echo "==> get a list of nodes in our cluster"
echo "$ curl 'localhost:9200/_cat/nodes?v'"

echo "======== about kibana and sense ========"
echo "$ cd kibana-4.4.1-linux-x64"

echo "==> ready to start kibana"
echo "$ ./bin/kibana"
