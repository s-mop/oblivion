export ip=$(ifconfig | grep inet | head -n 1 | awk -F" " '{print $2}')

#############mongs conf and start with 3 ip parameters
cat > /data/mongodb/cluster/mongos/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /data/mongodb/cluster/mongos/logs/mongod.log

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /data/mongodb/cluster/mongos/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27017
  bindIp: $ip

sharding:
  configDB: config/$1:27018,$2:27018,$3:27018
#security:
  #KeyFile鉴权文件
  #keyFile: /data/mongodb/cluster/keyfile
EOF

mongos -f /data/mongodb/cluster/mongos/mongod.conf
