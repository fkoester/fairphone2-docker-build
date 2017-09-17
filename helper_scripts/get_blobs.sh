#! /bin/bash
set -e

BLOBS_VERSION="17.09.3"

BLOBS_ARCHIVE="fp2-sibon-${BLOBS_VERSION}-blobs.tgz"

TARGET_DIR="/var/fairphone_os/blobs"

mkdir -p ${TARGET_DIR}

cd ${TARGET_DIR}
if [ ! -f ${BLOBS_ARCHIVE} ]; then
	curl -O https://code.fairphone.com/downloads/FP2/blobs/${BLOBS_ARCHIVE}
fi

echo e157b4d0f2e60e095ffec3ca9057847ce3a178220cc5611f8a6410aa6a9f736b ${BLOBS_ARCHIVE} | sha256sum -c
BLOBS_SCRIPT=$(tar ztf ${BLOBS_ARCHIVE})
tar zxvf ${BLOBS_ARCHIVE}

cd ${FP_WORKDIR}
yes | sh ${TARGET_DIR}/${BLOBS_SCRIPT}

