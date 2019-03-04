#!/bin/bash

DIR_CHECK=$1
USER_ID=$2
GROUP_ID=$3
MODE=$4

# Return:
# 0   - ok
# 1   - parameter error
# 100 - failed to fix directroy permission
# 200 - sucessfully fixed directroy permission

echo "Check ${MODE} access in directroy '${DIR_CHECK}' with USER_ID ${USER_ID} and GROUP_ID ${GROUP_ID}"

if [[ "${MODE}" = "rw" ]] ; then
    CHECK_SCRIPT="/check_rw.sh"
    CHMOD_PARAMS="g+rwxs"
    
elif [[ "${MODE}" = "r" ]] ; then
    CHECK_SCRIPT="/check_r.sh"
    CHMOD_PARAMS="g+rx"
else
    echo "Unknown Mode"
    exit 1
fi

gosu ${USER_ID}:${GROUP_ID} ${CHECK_SCRIPT} ${DIR_CHECK}
RC=$?
echo "rc: ${RC}"

if [ ${RC} -eq 1 ]; then
    chgrp -R ${GROUP_ID} ${DIR_CHECK}
    chmod -R ${CHMOD_PARAMS} ${DIR_CHECK}
    
    gosu ${USER_ID}:${GROUP_ID} ${CHECK_SCRIPT} ${DIR_CHECK}
    RC=$?
    echo "rc: ${RC}"
    
    if [ ${RC} -eq 0 ]; then
        exit 200
    fi
    exit 100
fi

echo "Done"



