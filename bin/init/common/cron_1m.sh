#! /bin/bash
#================================
#=== Simple worker example
#================================

export ME=`basename $0`
export LOG=/root/log/${ME}_log.txt
export ERROR=/root/log/${ME}_error.txt
export START_TSS="`date +%Y%m%d-%H%M%S`"

mkdir -p /root/log/

exec 1>> ${LOG}
exec 2>> ${ERROR}

echo "${ME}: Start  ${START_TSS}" >> ${LOG}

export REPOS=`find /root/gitrepo/ -maxdepth 1 -mindepth 1 `
for REPO in ${REPOS}; do
    pushd ${REPO}
        git pull

        source bin/work/common/work.sh
    popd
done


export FINISH_TSS="`date +%Y%m%d-%H%M%S`"
echo "${ME}: Finish ${FINISH_TSS}" >> ${LOG}

