HELM_VERSION=helm-v2.0.1-linux-amd64
SOURCE_URL=http://storage.googleapis.com/kubernetes-helm
wget ${SOURCE_URL}/${HELM_VERSION}.tar.gz
tar -zxvf ${HELM_VERSION}.tar.gz 
mv linux-amd64/helm /usr/local/bin/helm