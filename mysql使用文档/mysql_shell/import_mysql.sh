#/bin/bash
#

user='gally'
password='123456'
host='192.168.205.20'

mysql_conn="sudo mysql -u"$user" -p"$password" -h "$host""

cat data.txt | while read id name birth sex
do
	$mysql_conn -e "insert into school.student values('$id','$name','$birth','$sex')"
done
