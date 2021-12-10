#!/bin/bash
sudo timedatectl set-timezone Asia/Bangkok

merah='\033[0;31m'
hijau='\033[0;32m'
blank='\033[0m'
jam= date +"%T"

encode1=$(cat sqlilist.txt | sed 's/ /%20/g' > sqlilist_encode.txt)
sqli(){
for cek in $(cat sqlilist_encode.txt);
do
curl -s -o /dev/null -w "$domain$cek -> %{http_code}\n" $domain$cek -L >> logs/sqlilog.txt
printf "${merah}SQLI ${blank} -> $domain  $hijau"
date +"%T"
done
}


encode2=$(cat xsslist.txt | sed 's/ /%20/g' > xsslist_encode.txt)
xss(){
for cek in $(cat xsslist_encode.txt);
do
curl -s -o /dev/null -w "$domain$cek -> %{http_code}\n" $domain$cek -L >> logs/xsslog.txt
printf "${merah}XSS ${blank} -> $domain  $hijau"
date +"%T"
done
}

encode3=$(cat lfilist.txt | sed 's/ /%20/g' > lfilist_encode.txt)
lfi(){
for cek in $(cat lfilist_encode.txt);
do
curl -s -o /dev/null -w "$domain$cek -> %{http_code}\n" $domain$cek -L >> logs/lfilog.txt
printf "${merah}LFI ${blank} -> $domain  $hijau"
date +"%T"
done
}

encode4=$(cat rcelist.txt | sed 's/ /%20/g' > rcelist_encode.txt)
rce(){
for cek in $(cat rcelist_encode.txt);
do
curl -s -o /dev/null -w "$domain$cek -> %{http_code}\n" $domain$cek -L >> logs/rcelog.txt
printf "${merah}RCE ${blank} -> $domain  $hijau"
date +"%T"
done
}


for domain in $(cat domainlist.txt);
do
sqli && xss && lfi && rce
done
