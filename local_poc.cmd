sh.shardCollection("poc.order", {"_id": "hashed" })
for (i = 1; i <= 20000; i=i+1){
    db.order.insert({'orderType': 2})
}

db.getCollection("order").createIndex({
    userId: "hashed",
    year: NumberInt("1")
}, {
    name: "cidx_order"
}) 
#need root auth and index
sh.shardCollection("poc.order", {"userId": "hashed", "year": 1 })

db.adminCommand({
  reshardCollection: "poc.order",
  key: {"userId": "hashed"}
})

PID=$(ps -ef | grep odspoc | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    echo kill $PID
    kill -9 $PID
fi

cluster角色admin：在cluser local user
