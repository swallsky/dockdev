#!/bin/bash

host="oss-cn-beijing.aliyuncs.com"
# bucket名称
bucket=""
# id
Id=""
# 密钥
Key=""
# 参数1，PUT：上传，GET：下载
method=$1
# 参数2，上传时为本地源文件路径，下载时为oss源文件路径
source=$2
# 参数3，上传时为OSS目标文件路径，下载时为本地目标文件路径
dest=$3

osshost=$bucket.$host

# 校验method
if test -z "$method"
then
    method=GET
fi

if [ "${method}"x = "get"x ] || [ "${method}"x = "GET"x ]
then
    method=GET
elif [ "${method}"x = "put"x ] || [ "${method}"x = "PUT"x ]
then
    method=PUT
else
    method=GET
fi

#校验上传目标路径
if test -z "$dest"
then
    dest=$source
fi

echo "method:"$method
echo "source:"$source
echo "dest:"$dest

#校验参数是否为空
if test -z "$method" || test -z "$source" || test -z "$dest"
then
    echo $0 put localfile objectname
    echo $0 get objectname localfile
    exit -1
fi

if [ "${method}"x = "PUT"x ]
then
    resource="/${bucket}/${dest}"
    contentType=`file -ib ${source} |awk -F ";" '{print $1}'`
    # dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"
    dateValue="`TZ=GMT env LANG=en_US.UTF-8 date +'%a, %d %b %Y %H:%M:%S GMT'`"
    stringToSign="${method}\n\n${contentType}\n${dateValue}\n${resource}"
    signature=`echo -en $stringToSign | openssl sha1 -hmac ${Key} -binary | base64`
    echo $stringToSign
    echo $signature
    url=http://${osshost}/${dest}
    echo "upload ${source} to ${url}"
    curl -i -q -X PUT -T "${source}" \
      -H "Host: ${osshost}" \
      -H "Date: ${dateValue}" \
      -H "Content-Type: ${contentType}" \
      -H "Authorization: OSS ${Id}:${signature}" \
      ${url}
else
    resource="/${bucket}/${source}"
    contentType=""
    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"
    stringToSign="${method}\n\n${contentType}\n${dateValue}\n${resource}"
    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`
    url=http://${osshost}/${source}
    echo "download ${url} to ${dest}"
    curl --create-dirs \
      -H "Host: ${osshost}" \
      -H "Date: ${dateValue}" \
      -H "Content-Type: ${contentType}" \
      -H "Authorization: OSS ${Id}:${signature}" \
      ${url} -o ${dest}
fi