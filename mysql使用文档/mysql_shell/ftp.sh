#!/bin/bash
#

ftp -inv << EOF
	open 192.168.205.11
	user vagrant vagrant

	cd /home/vagrant/	
	put /home/vagrant/backup/school_scroe_20201230070715.bak
	bye
EOF
