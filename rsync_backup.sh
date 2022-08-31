#!/bin/bash
if [ $UID != 0 ]
then
	echo "Your are not root"
	exit
fi
echo "installing rsync..."
sudo apt update
apt-get install rsync

echo "take system backup (sys_backup)"
#rsync -a --delete --backup --backup-dir=/path/to/backup /path/to/SRC [DEST]
mkdir /sys_backup
sudo rsync -avzAX / --exclude={"/sys_backup/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /sys_backup
tar -zcvf backup1.tar.gz /sys_backup
rm -R /sys_backup/*