#! /bin/bash
title="ab test docker nginx conf, 4G ali yun computer,no php page, dynamic 10 start 2 pm php config, no mysql config with huge config"
time=10   #测试次数；
r=10000  #请求数；
bf=50   #并发数；
link="http://localhost:30002/"   #测试连接；
log="/root/abtest.log"   #log文件；
for s in `seq 1 $time`
   do
        i=`ab -n$r -c $bf $link 2> /dev/null|grep "Requests per" |awk '{print $4}'|awk -F '.' '{print $1}'`
        t=$((t+i))
   done
echo "$title, ab -n$r -c $bf $link, average is $(($t/$time))" >> $log
tail -1 $log

