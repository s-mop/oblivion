#######config server init
rs.initiate(
  {
    _id: "config",
    configsvr: true,
    members: [
      { _id : 0, host : "172.31.77.178:27018" },
      { _id : 1, host : "172.31.64.154:27018" },
      { _id : 2, host : "172.31.68.172:27018" }
    ]
  }
)

##########shading initiate; 3 ips as parameters
mongo $0 --port 27019
rs.initiate(
  {
    _id: "shard1",
    members: [
      { _id : 0, host : "172.31.77.178:27019" },
      { _id : 1, host : "172.31.64.154:27019" },
      { _id : 2, host : "172.31.68.172:27019" }
    ]
  }
)
mongo $1 --port 27020
rs.initiate(
  {
    _id: "shard2",
    members: [
      { _id : 0, host : "172.31.77.178:27020" },
      { _id : 1, host : "172.31.64.154:27020" },
      { _id : 2, host : "172.31.68.172:27020" }
    ]
  }
)

mongo $2 --port 27021
rs.initiate(
  {
    _id: "shard3",
    members: [
      { _id : 0, host : "172.31.77.178:27021" },
      { _id : 1, host : "172.31.64.154:27021" },
      { _id : 2, host : "172.31.68.172:27021" }
    ]
  }
)
