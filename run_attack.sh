#!/bin/bash

encode1=$(cat sqlilist.txt | sed 's/ /%20/g' > sqlilist_encode.txt)
sqli(){
for cek in $(cat sqlilist_encode.txt);
do
curl -s $domain$cek
echo "$domain$cek"
done
}


encode2=$(cat xsslist.txt | sed 's/ /%20/g' > xsslist_encode.txt)
xss(){
for cek in $(cat xsslist_encode.txt);
do
curl -s $domain$cek
echo "$domain$cek"
done
}

encode3=$(cat lfilist.txt | sed 's/ /%20/g' > lfilist_encode.txt)
lfi(){
for cek in $(cat lfilist_encode.txt);
do
curl -s $domain$cek
echo "$domain$cek"
done
}


for domain in $(cat domainlist.txt);
do
sqli && xss && lfi
done
