#!/usr/bin/bash
#保存为makeServerCa.sh
./checkDir.sh
cd openssl
# 如果已经创建过根证书，则退出
cafile="./ca.crt"
if [ ! -f "$cafile" ]
then
echo "根证书不存在，请先运行makeRootCa.sh创建根证书"
exit
fi

if [ ! $1 ]
then
echo "请传入ip或域名参数，将作为证书的文件名"
exit
fi

ipOrDomain=$1

serverCrt="./${ipOrDomain}.crt"

if [ -f "$serverCrt" ]
then
echo "已经有一个服务器证书存在，请先备份后再执行此命令，避免被覆盖"
exit
fi

openssl genrsa -out ${ipOrDomain}.key 2048
openssl req -config "./conf/openssl.cnf" -reqexts v3_req -new -key ${ipOrDomain}.key -out ${ipOrDomain}.csr

# 如果不加这个 read 命令，下面的openssl ca不会执行
read -p "请按任意键继续:" -s ok
openssl ca -config "./conf/openssl.cnf" -create_serial -extensions v3_req  -days 10950  -cert ca.crt -keyfile ca.key -in ${ipOrDomain}.csr -out ${ipOrDomain}.crt