#!/bin/sh
#test sorting

#list file, find csvs sort after first underscore to match naming convention
#ls | find . -name '*_*' | sort -n -t _ -k 2 
#sort and list all the dates 
#ls | find . -name '*_*' | sort -n -t _ -k 2 -u | awk -F"_" '{print $2}'

headerfiles=( $(ls | find . -name '*_*' | awk '!/.DS_Store/ && !/.git/' | awk -F"/" '{print $2}' | sort -n -t _ -k 2 -u) )
#echo "${headerfiles[3]}" 
#list files, find ones with 
datetitle=( $(ls | find . -name '*.csv' | awk '!/.DS_Store/ && !/.git/' | awk -F"_" '{print $2}' | sort -n -t _ -k 1 -u) )
echo "${datetitle[@]}"
#make files with test name order corresponding to date of test
for j in "${datetitle[@]}"; do
	for i in "${headerfiles[@]}"; do
		#echo "${headerfiles}" >> headerfiles.txt
		#a = ${headerfiles[i]}
		awk -F"," '{print $1}' $i| paste -s -d"," - >> $j.csv
		echo "created >"
		echo $j
	done
done
exit 0