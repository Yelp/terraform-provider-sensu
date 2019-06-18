#!/bin/bash

project=$1
version=$2
iteration=$3
tf_version=$4

cd /go/src/github.com/jtopjian/terraform-provider-sensu
make build

mkdir /dist && cd /dist

fpm -s dir -t deb --deb-no-default-config-files --name ${project}-${tf_version} \
    --iteration ${iteration} --version ${version} \
    /go/bin/${project}=/nail/opt/terraform-${tf_version}/bin/
