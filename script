#!/bin/bash

USERNAME=""
PASSWORD=""
ACCESS_TOKEN="?"
TYPE="ALL"

partition=$((8))
partitionn=$(((29) + ${#USERNAME}))
 

curl 'https://api.github.com/user/repos?access_token=${ACCESS_TOKEN}&type=${TYPE}' 
	| grep -e 'clone_url*' 
	| cut -d \" -f 4 
	|  while read -r line; do command 
		curl "https://api.github.com/repos/${USERNAME}/${line:30:-4}/branches?access_token=${ACCESS_TOKEN}"
			| grep -e 'name*' 
			| cut -d \" -f 4 
			| while read -r branch; do command
				 git clone -b $branch ${line:0:${partition}}${USERNAME}:${PASSWORD}@github.com/${USERNAME}${line:${partitionn}} $branch$line; 
			done;
	done;


BASE_DIR=eval pwd

for d in */ ; do
	echo "Processing $d"	
	cp script2 $d
	cd $d

	var=$(eval git rev-parse --is-inside-work-tree)
	sleep 0.1

	while [[ $var != "true" ]]
	do
		for d2 in */ ; do
			cd $d2
		done
		sleep 0.1
		var=$(eval git rev-parse --is-inside-work-tree)
	done
	
	cp $BASE_DIR/script2 .
	eval ./script2
	CUR_DIR=eval pwd
	sleep 0.2
	cd ..	
	rm $CUR_DIR
	cd $BASE_DIR
done


