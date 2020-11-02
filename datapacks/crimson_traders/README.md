# Crimson Traders Data Pack

Minecraft data pack for lightly modifying wandering traders on CrimsonCraft.

## Mechanism

Every tick the game checks for new traders using a selector that looks for
traders without the `CrimsonTraderModifiedTrade` tag.  Those traders run 
(via `execute run as @e[stuff]`) a customizing function which steps through
the customizations.  The function ends by adding the tag to the trader so
they are not touched in future ticks.

Each customization attempts to spawn items from a loot table, if an item is
spawned, several NBT tags from the item are copied into a new entry on the
trader's `Offers.Recipes` list.  The item is then killed.

## Current Modifications

### Spawner Trades

There is a 3/4 chance that the loot table `crimson_traders:spawner` will spawn
`minecraft:air` which is essentially the game's idea of NULL. The other 1/4 
of the time it will roll from the `crimson_traders:spawner_success`.

The weights should work out to the following chances:

| Mob         | Chance |
|-------------|--------|
| Zombie      | 50%    |
| Skeleton    | 22%    |
| Cave Spider | 11%    |
| Creeper     | 5%     |
| Pig         | 0.1%   |