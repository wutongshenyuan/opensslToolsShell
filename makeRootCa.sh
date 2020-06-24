#!/usr/bin/bash
#保存为makeRootCa.sh
# 如果已经创建过根证书，则退出
./checkDir.sh
cd openssl
cafile="./ca.crt"
if [ -f "$cafile" ]
then
echo "根证书已存在,请直接运行makeServerCa.sh创建服务器证书"
exit
fi

openssl genrsa -out ca.key 2048
openssl req -config "./conf/openssl.cnf" -new -x509 -days 10950 -extensions v3_ca -key ca.key -out ca.crt