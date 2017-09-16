#! /bin/bash
set -e

get_blobs.sh

cd ${FP_WORKDIR}
source build/envsetup.sh
choosecombo 1 FP2 2
make -j1
