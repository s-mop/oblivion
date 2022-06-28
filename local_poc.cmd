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
  key: {"userId": "hashed", "year": 1 }
})
