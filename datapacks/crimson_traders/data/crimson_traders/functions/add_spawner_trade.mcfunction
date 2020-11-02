# The spawner loot table will produce air (basically the block equivalent of NULL) 75% of the time
# and the other 25% of the time roll once more on the spawner_success table.
loot spawn ~ ~ ~ loot crimson_traders:spawner
execute store success storage crimson_traders:storage tradeItemCreated byte 1 run data get entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}]
# Run our function that copies several bits of NBT data off our loot table 
# spawned item into a new entry in the traders Offers.Recipes array.
execute if data storage crimson_traders:storage {tradeItemCreated:1b} run function crimson_traders:append_tradeoffer_item
# Remove item from world.  Note that all this happens on the main thread in one
# tick so the item really never "leaves" the server to the client.
kill @e[type=item,limit=1,nbt={Item:{tag:{TradeOffer:1b}}}]