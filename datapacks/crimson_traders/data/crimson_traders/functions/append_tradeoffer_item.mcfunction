# This function is used when we have successfully spawned an item with
# {TradeOffer:1b} to add it to the currently executing wandering trader.
data modify entity @s Offers.Recipes append value {buy:{id:"minecraft:emerald",Count:1b},maxUses:1,sell:{id:"minecraft:stone",Count:1b}}
data modify entity @s Offers.Recipes[-1].sell.id set from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}] Item.id
data modify entity @s Offers.Recipes[-1].sell.Count set from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}] Item.Count 
data modify entity @s Offers.Recipes[-1].buy.Count set from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}] Item.tag.buy.Count
data modify entity @s Offers.Recipes[-1].maxUses set from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}] Item.tag.maxUses
data modify entity @s Offers.Recipes[-1].sell.tag merge from entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}] Item.tag.sellTag
