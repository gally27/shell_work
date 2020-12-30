#bin/bahs
#

user="gally"
password="123456"
host="192.168.205.20"

SQL="$1"

mysql -u"$user" -p"$password" -h"$host" -B -D school -e "$SQL"
