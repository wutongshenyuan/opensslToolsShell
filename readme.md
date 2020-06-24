# opensslToolsShell
## linux
linux系统需要安装openssl，然后可在当前目录下直接 运行 makeRootCa.sh 与 makeServerCa.sh
## windows
windows需要安装git客户端，然后可在当前目录打开git-bash 运行 makeRootCa.sh 与 makeServerCa.sh
## 顺序
如果没有创建过根证书，请先运行makeRootCa.sh创建根证书，根证书只创建一次即可

如果已经有根证书，可直接运行makeServerCa.sh创建服务器证书

注意服务器证书填写的信息要和根证书一致，除了common name信息

根证书common name信息填写签发单位名称，你可以自定义

服务器证书common name信息填写服务器的域名或ip

示例：
```
# 生成根证书
./makeRootCa.sh
# 生成服务器证书
./makeServerCa.sh 127.0.0.1
```
注意
生成服务器证书的时候，如果需要改alt_names，直接修改openssl/conf/openssl.cnf



