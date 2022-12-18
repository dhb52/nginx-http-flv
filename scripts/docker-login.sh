#!/usr/bin/env bash

set -e

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" registry.cn-shenzhen.aliyuncs.com --password-stdin
