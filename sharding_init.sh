
mongo $ip1 --port 27019
rs.initiate(
  {
    _id: "shard1",
    members: [
      { _id : 0, host : "$ip1:27019" },
      { _id : 1, host : "$ip2:27019" },
      { _id : 2, host : "$ip3:27019" }
    ]
  }
)
mongo $ip2 --port 27020
rs.initiate(
  {
    _id: "shard2",
    members: [
      { _id : 0, host : "$ip1:27020" },
      { _id : 1, host : "$ip2:27020" },
      { _id : 2, host : "$ip3:27020" }
    ]
  }
)

mongo $ip3 --port 27021
rs.initiate(
  {
    _id: "shard3",
    members: [
      { _id : 0, host : "$ip1:27021" },
      { _id : 1, host : "$ip2:27021" },
      { _id : 2, host : "$ip3:27021" }
    ]
  }
)
