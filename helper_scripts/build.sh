#! /bin/bash
set -e

get_blobs.sh

cd ${FP_WORKDIR}
source build/envsetup.sh
choosecombo 1 FP2 2

# https://github.com/fkoester/fairphone2-docker-build/issues/1
echo "USE_CUSTOM_AUDIO_POLICY := 0" >> device/fairphone_devices/FP2/BoardConfig.mk
make -j8
