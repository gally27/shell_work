###############################
#File Name:auth_bachup.sh
#Author:gally
#mail:
#Create Time:2020年12月30
#Describe:备份mysql数据库上传到指定服务器上
#!/bin/bash
#

#连接数据库用的变量
db_user="gally"
db_password="123456"
db_host="192.168.205.20"

#连接ftp服务器用的变量
ftp_user="vagrant"
ftp_password="vagrant"
ftp_host="192.168.205.11"

src_dir="/home/vagrant/backup"
dst_dir="/home/vagrant"
time_date="`date +%Y%m%d%H%M%S`"
file_name="school_scroe_${time_date}.bak"

#echo ${time_date}
conn_mysql="mysqldump -u"${db_user}" -p"${db_password}" -h"${db_host}""
#echo ${conn_mysql}

function auto_ftp
{
	ftp -niv << EOF
		open $ftp_host
		user ${ftp_user} ${ftp_password}

		cd $dst_dir
		put $1
		bye
EOF
}
${conn_mysql} school score > $src_dir/${file_name} #&& auto_ftp ${src_dir}/${file_name}

if [ $? -eq 0 ];then
	cp $src_dir/${file_name} ./
	auto_ftp ${file_name}
	if [ $? -eq 0 ];then
		rm ${file_name}
	else 
		echo "filed"
		exit
	fi
else
	echo "failed"
	exit
fi
