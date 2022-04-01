sh.shardCollection("poc.order", {"_id": "hashed" })
for (i = 1; i <= 20000; i=i+1){
    db.order.insert({'orderType': 2})
}
