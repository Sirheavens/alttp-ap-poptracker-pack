-- toh_entrance = alttp_location.new("")
local toh_basement_cage = alttp_location.new("toh_basement_cage")
local toh_main_room = alttp_location.new("toh_main_room")
local toh_big_key_chest = alttp_location.new("toh_big_key_chest")
local toh_big_chest_room = alttp_location.new("toh_big_chest_room")
local toh_boss_room = alttp_location.new("toh_boss_room")
local toh_above_big_chest = alttp_location.new("toh_above_big_chest")


toh_entrance_inside:connect_two_ways(toh_main_room, function() 
    return all(
        can_interact("light", 1),
        any(
            dealDamage(),
            has("redboomerang"),
            has("blueboomerang"),
            has("icerod")
        )
    )
end)
toh_main_room:connect_two_ways(toh_basement_cage)
toh_main_room:connect_two_ways(toh_big_key_chest, function(keys) return has("toh_smallkey", keys + 1, 1, keys + 1, 1), KDSreturn(keys + 1, keys + 1) end)
toh_main_room:connect_two_ways(toh_big_chest_room, function() 
    return any(
        has("toh_bigkey"),
        all(
            checkGlitches(2),
            has("hookshot")
        )
    )
end)
toh_main_room:connect_one_way("ToH - Map Chest")

toh_basement_cage:connect_one_way("ToH - Basement Cage")
toh_big_key_chest:connect_one_way("ToH - Big Key Chest", function() return has("firesource") end)

toh_big_chest_room:connect_two_ways(toh_above_big_chest)
toh_big_chest_room:connect_one_way("ToH - Compass Chest")

toh_above_big_chest:connect_two_ways(toh_boss_room)
toh_above_big_chest:connect_one_way("ToH - Big Chest", function() return has("toh_bigkey") end)

toh_boss_room:connect_one_way("ToH - Boss", function() return getBossRef("toh_boss") end)