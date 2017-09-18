#! /bin/bash
set -e

mkdir -p ${FP_LOGDIR}

sync.sh > >(tee ${FP_LOGDIR}/sync.log) 2> >(tee ${FP_LOGDIR}/sync_err.log >&2)

build.sh > >(tee ${FP_LOGDIR}/build.log) 2> >(tee ${FP_LOGDIR}/build_err.log >&2)
