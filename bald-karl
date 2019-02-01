#!/bin/bash

db="database.yt"

echo "-- downloading $db"
curl -sLO https://w3b.net/$db

start_time=$(head -1 $db | awk -F '"' '{print$4}')
now=$(date +"%s")
total=$(echo $(($now-$start_time)))
png="bald-karl.png"

echo "-- $db contains $(($total/3600)) hours data."

rrdtool create bald.rrd --step=1 --start=1548879240 \
    DS:ds1:GAUGE:5m:U:U RRA:AVERAGE:0:1:${total}s
rrdtool create karl.rrd --step=1 --start=1548879240 \
    DS:ds1:GAUGE:5m:U:U RRA:AVERAGE:0:1:${total}s

cat $db | grep bald | \
    awk -v "rrdfile=bald.rrd" -F '"' \
    '{printf("rrdtool update %s %s:%s\n",rrdfile,$4,$8)}' >/tmp/rrdbald
cat $db | grep Karl | \
    awk -v "rrdfile=karl.rrd" -F '"' \
    '{printf("rrdtool update %s %s:%s\n",rrdfile,$4,$8)}' >/tmp/rrdkarl

sh /tmp/rrdbald
sh /tmp/rrdkarl

1>/dev/null rrdtool graph bald-karl.png --start 1548879240 --end now \
    -w 600 -h 300 \
    DEF:ds1a=bald.rrd:ds1:AVERAGE \
    DEF:ds2a=karl.rrd:ds1:AVERAGE \
    LINE2:ds1a#40a040:"Mr Bald" \
    LINE2:ds2a#4040ff:"Karl Rock"

echo "-- $png has been created."