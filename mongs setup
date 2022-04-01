export ip1=
export ip2=
export ip3=

#############mongs
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
  configDB: config/$ip1:27018,$ip2:27018,$ip3:27018
EOF

mongos -f /data/mongodb/cluster/mongos/mongod.conf
