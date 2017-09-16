#! /bin/sh

docker build -t maestroalubia/fairphone2-build-env --build-arg FAIRPHONE_UID=${UID} .
