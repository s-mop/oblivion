# oblivion
https://blog.csdn.net/weixin_49724150/article/details/121748365
https://blog.csdn.net/mameng1988/article/details/107064032

sh mongs_setup.sh 172.17.54.2 172.17.54.3 172.17.54.6


开启Config Server的登录验证和内部验证
使用Keyfiles进行内部认证，在其中一台服务器上创建Keyfiles

openssl rand -base64 756 > /data/mongodb/keyfile
chmod 400  /data/mongodb/keyfile

在/data/mongodb/configServer.conf 配置文件中开启认证：

security:
   keyFile: "/data/mongodb/keyfile"
   clusterAuthMode: "keyFile"
   authorization: "enabled"

重启各台config服务
