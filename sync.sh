#!/bin/bash


hub="registry.cn-hangzhou.aliyuncs.com"
repo="$hub/kainstall"


if [ -f sync.yaml ]; then
   echo "[Start] sync......."
   
   skopeo login -u ${HUB_USERNAME} -p ${HUB_PASSWORD} ${hub} \
   && skopeo --insecure-policy sync --src yaml --dest docker sync.yaml $hub
   
   echo "[End] done."
   
else
    echo "[Error]not found sync.yaml!"
fi