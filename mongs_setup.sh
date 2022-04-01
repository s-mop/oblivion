
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
  configDB: config/172.31.77.178:27018,172.31.64.154:27018,172.31.68.172:27018
EOF

mongos -f /data/mongodb/cluster/mongos/mongod.conf
