#! /bin/bash
set -e

time sync.sh > >(tee ${FP_LOGDIR}/sync.log) 2> >(tee ${FP_LOGDIR}/sync_err.log >&2)

time build.sh > >(tee ${FP_LOGDIR}/build.log) 2> >(tee ${FP_LOGDIR}/build_err.log >&2)
