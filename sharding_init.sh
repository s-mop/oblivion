
##########shading initiate; 3 ips as parameters
mongo $0 --port 27019
rs.initiate(
  {
    _id: "shard1",
    members: [
      { _id : 0, host : "$0:27019" },
      { _id : 1, host : "$1:27019" },
      { _id : 2, host : "$2:27019" }
    ]
  }
)
mongo $1 --port 27020
rs.initiate(
  {
    _id: "shard2",
    members: [
      { _id : 0, host : "$0:27020" },
      { _id : 1, host : "$1:27020" },
      { _id : 2, host : "$2:27020" }
    ]
  }
)

mongo $2 --port 27021
rs.initiate(
  {
    _id: "shard3",
    members: [
      { _id : 0, host : "$0:27021" },
      { _id : 1, host : "$1:27021" },
      { _id : 2, host : "$2:27021" }
    ]
  }
)
