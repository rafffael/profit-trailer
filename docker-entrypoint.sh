#!/bin/bash

BASE=/opt
APP=/app
PT="ProfitTrailer"

PT_DIR=$APP/$PT
PT_ZIP=$BASE/${PT}.zip
PT_JAR=$PT_DIR/${PT}.jar
PT_START="java -jar $PT_JAR -XX:+UseConcMarkSweepGC -Xmx256m -Xms256m"

[ -d "$PT_DIR" ] || mkdir "$PT_DIR" || {
   echo "Error: no $PT_DIR found and could not make it. Exiting."; exit -1;
}
unzip -oqd $APP $PT_ZIP $PT/${PT}.jar || {
  echo "Error: no $PT jar found. Exiting."; exit -1;
}
cd $PT_DIR || {
  echo "Error: problem with $PT_DIR. Exiting."; exit -1;
}

pcnt=$(/bin/ls -1 $PT_DIR/*.properties 2>/dev/null|/usr/bin/wc -l)
[[ $pcnt -gt 0 ]] || {
  echo "No properties found, extracting..."; unzip -o $PT_ZIP -d $APP;
  echo "Done! Now, edit your configuration files and reload the container."
  exit -1;
} || {
  echo "Error: no properties found and could not properly unzip $PT_ZIP. Exiting.";
  exit -1;
}

# start it
$PT_START
