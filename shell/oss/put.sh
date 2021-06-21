#!/bin/bash
yesday=`date -d yesterday +%Y%m%d`
filename="${yesday}.log"
filezip="${filename}.zip"
sudo zip ${filezip} ${filename}
sudo ./oss.sh put ${filezip}
