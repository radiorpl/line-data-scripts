#script to parse and compile raw line data from chicony
#!/bin/sh

tmp=(*.csv)
awk -F"," '{print $1}' ${tmp[0]} | paste -s -d"," - > test.csv

filename=test.csv
for i in $(ls *.csv | grep --invert-match "${filename}"); do
	awk -F","  '{print $3}' $i | paste -s -d"," - >> test.csv
done