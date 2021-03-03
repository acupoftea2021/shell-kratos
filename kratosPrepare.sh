#!/bin/bash

if [ ! -d "$GOPATH" ]; then
  echo "Set the GOPATH env,firstly"
  exit 1
fi
# download or update the go packages
echo "\$GOPATH=$GOPATH"
go get -u -v github.com/golang/protobuf/proto
go get -u -v github.com/golang/protobuf/protoc-gen-go
go get -u -v github.com/go-kratos/kratos/cmd/kratos/v2@latest
ls "$GOPATH"/bin

# make dir before downloading the zip file of protoc
protocDir=~/protoc
if [ ! -d "$protocDir" ]; then
  mkdir $protocDir
fi
cd $protocDir
# download the zip file of protoc
# to replace the url using the right
protocDownloadUrl="https://github.com/protocolbuffers/protobuf/releases/download/v3.15.3/protoc-3.15.3-linux-x86_64.zip"
if [ ! -f "./${protocDownloadUrl##*/}" ]; then
  echo "downloading the file from $protocDownloadUrl"
  wget $protocDownloadUrl
  echo "downloading finished"
fi
unzip "${protocDownloadUrl##*/}"
sudo cp -rf ./include/* /usr/local/include/
cp -rf ./bin/protoc "$GOPATH"/bin/

<< 'COMMENTS'
COMMENTS