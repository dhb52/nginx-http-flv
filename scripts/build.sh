#!/usr/bin/env bash
set -e

use_tag="registry.cn-shenzhen.aliyuncs.com/dhb52/nginx-http-flv:$NAME"

docker build -t "$use_tag" .
