#!/bin/sh
# example usage: 
# exec java $(memory-opts 75) -jar real-fat-jar.jar

# JVM uses only 25% of system memory by default, tick to 75%
DEFAULT_MEM_JAVA_PERCENT=75

if [ -n "$1" ]
  then
    MEM_JAVA_PERCENT=$1
  else
    MEM_JAVA_PERCENT=$DEFAULT_MEM_JAVA_PERCENT
fi

# obtain system memory in total, then calc real assigned quota
MEM_TOTAL_KB=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
MEM_JAVA_KB=$(($MEM_TOTAL_KB * $MEM_JAVA_PERCENT / 100))

# write configure back to output
echo "-Xmx${MEM_JAVA_KB}k"
