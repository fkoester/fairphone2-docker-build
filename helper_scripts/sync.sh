#! /bin/bash

git config --global user.name Fairphone
git config --global user.email fairphone@localhost

mkdir -p ${FP_WORKDIR}
cd ${FP_WORKDIR}

repo &> /dev/null || yes | repo init --depth=1 \
	      -u http://code.fairphone.com/gerrit/fp2-dev/manifest \
	      -b fp2-sibon
time repo sync -c
