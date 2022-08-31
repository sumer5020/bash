#!/bin/bash
if [ $UID != 0 ]
then
	echo "Your are not root"
	exit
fi
echo "stop mysql service..." 
sudo service mysql stop
sleep 1
mkdir database
mkdir /home/database/var
mkdir /home/database/var/lib
mkdir /home/database/var/log
mkdir /home/database/var/tmp
sudo service mysql stop
echo "Will only take copy: (recommended)..." 
sleep 1
cp -rap /var/lib/mysql /home/database/var/lib
cp -rap /var/lib/mysql-files /home/database/var/lib
cp -rap /var/log/mysql /home/database/var/log
cp -rap /var/lib/mysql/mysql /home/database/var/tmp

echo "-----------------------------------------------------------------" 
echo "finally update /etc/mysql/conf.d manually as follows:"
echo "-----------------------------------------------------------------" 
sleep 1
echo "[mysqld]"
echo "datadir = /home/database/var/lib/mysql"
echo "log-error	= /home/database/var/log/mysql/error.log"
echo "local-infile=1"
echo "sql_mode=NO_ENGINE_SUBSTITUTION"
echo "slow_query_log=1"
echo "log_queries_not_using_indexes=0"
echo "slow_query_log_file=/home/database/var/log/mysql/slow-query.log"
echo "general_log=0"
echo "general_log_file=/home/database/var/log/mysql/generallog.log"
echo "tmpdir = /home/database/var/tmp/mysql"
echo "-----------------------------------------------------------------" 
echo "Next restart mysql service"
echo "-----------------------------------------------------------------" 


