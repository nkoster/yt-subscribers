#!/bin/bash

scp w3b:yt-subscribers/database.yt .

start_time=$(head -1 database.yt|awk -F '"' '{print$4}')
now=$(date +"%s")
total=$(echo $(($now-$start_time)))

echo "---- $total"

rrdtool create bald.rrd --step=1 --start=1548879240 \
    DS:ds1:GAUGE:5m:U:U RRA:AVERAGE:0:1:${total}s
rrdtool create karl.rrd --step=1 --start=1548879240 \
    DS:ds1:GAUGE:5m:U:U RRA:AVERAGE:0:1:${total}s

cat database.yt | grep bald | \
    awk -v "rrdfile=bald.rrd" -F '"' \
    '{printf("rrdtool update %s %s:%s\n",rrdfile,$4,$8)}' >/tmp/rrdbald
cat database.yt | grep Karl | \
    awk -v "rrdfile=karl.rrd" -F '"' \
    '{printf("rrdtool update %s %s:%s\n",rrdfile,$4,$8)}' >/tmp/rrdkarl

sh /tmp/rrdbald
sh /tmp/rrdkarl

rrdtool graph bald-karl.png --start 1548879240 --end now \
    -w 600 -h 300 \
    DEF:ds1a=bald.rrd:ds1:AVERAGE \
    DEF:ds2a=karl.rrd:ds1:AVERAGE \
    LINE2:ds1a#00a000:"Mr Bald" \
    LINE2:ds2a#0000a0:"Karl Rock"
