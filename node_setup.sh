sudo export ip=$(ifconfig | grep inet | head -n 1 | awk -F" " '{print $2}')
sudo mkdir -p /data/mongodb/cluster/{config,mongos,shard1,shard2,shard3}/{data,logs}


########################config server conf file
sudo cat > /data/mongodb/cluster/config/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /data/mongodb/cluster/config/logs/mongod.log

# Where and how to store data.
storage:
  dbPath: /data/mongodb/cluster/config/data
  journal:
    enabled: true

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /data/mongodb/cluster/config/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27018
  bindIp: $ip

sharding:
  clusterRole: configsvr

replication:
  replSetName: config

#security:
  #KeyFile鉴权文件
  #keyFile: /data/mongodb/cluster/keyfile
  #开启认证方式运行
  #authorization: enabled
EOF

sudo mongod -f /data/mongodb/cluster/config/mongod.conf

#######shard1 conf file
sudo cat > /data/mongodb/cluster/shard1/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /data/mongodb/cluster/shard1/logs/mongod.log

# Where and how to store data.
storage:
  dbPath: /data/mongodb/cluster/shard1/data
  journal:
    enabled: true

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /data/mongodb/cluster/shard1/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27019
  bindIp: $ip

sharding:
    clusterRole: shardsvr
    
replication:
    replSetName: shard1
    
#security:
  #KeyFile鉴权文件
  #keyFile: /data/mongodb/cluster/keyfile
  #开启认证方式运行
  #authorization: enabled
EOF

sudo mongod -f /data/mongodb/cluster/shard1/mongod.conf

########shard2 conf file
sudo cat > /data/mongodb/cluster/shard2/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /data/mongodb/cluster/shard2/logs/mongod.log

# Where and how to store data.
storage:
  dbPath: /data/mongodb/cluster/shard2/data
  journal:
    enabled: true

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /data/mongodb/cluster/shard2/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27020
  bindIp: $ip
 
sharding:
    clusterRole: shardsvr
    
replication:
    replSetName: shard2
#security:
  #KeyFile鉴权文件
  #keyFile: /data/mongodb/cluster/keyfile
  #开启认证方式运行
  #authorization: enabled
EOF

sudo mongod -f /data/mongodb/cluster/shard2/mongod.conf

#########shard 3
sudo cat > /data/mongodb/cluster/shard3/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /data/mongodb/cluster/shard3/logs/mongod.log

# Where and how to store data.
storage:
  dbPath: /data/mongodb/cluster/shard3/data
  journal:
    enabled: true

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /data/mongodb/cluster/shard3/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27021
  bindIp: $ip

sharding:
    clusterRole: shardsvr
    
replication:
    replSetName: shard3
#security:
  #KeyFile鉴权文件
  #keyFile: /data/mongodb/cluster/keyfile
  #开启认证方式运行
  #authorization: enabled
EOF

sudo mongod -f /data/mongodb/cluster/shard3/mongod.conf


