#! /bin/bash
for s in `seq 1 10`
   do
	i=`ab -n1000 -c 10 http://localhost:8088/ 2> /dev/null|grep "Requests per" |awk '{print $4}'|awk -F '.' '{print $1}'`
	t=$((t+i))
   done
echo "average is $(($t/10))"
