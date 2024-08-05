-- ID SETTING
provider = 928 -- Provider ID
ItemID = 914 -- dont touch or doesnt drop (These ID is for all chemicals no need change)
ItemID2 = 916 -- dont touch or ruined
ItemID3 = 918 -- dont touch or ruined
ItemID4 = 920 -- dont touch or ruined
ItemID5 = 924 -- dont touch or ruined
MaxItem = 150 --MaxItem in bp for auto drop
backgroundDrop = 436 --id BG DROP
worldDrop = "World" -- Name World Drop
idDoorDrop = "ID" -- ID door Drop
worldName = "World" -- World Name Provider
idDoor = "ID" -- ID door Provider


local function warp2(VwV, door)
    sendPacket("action|join_request\nname|" .. VwV .."|".. door .."\ninvitedWorld|0",3)
    sleep(5200)
    if getTile(math.floor(getBot().x / 32),math.floor(getBot().y / 32)).fg == 6 then
        sendPacket("action|join_request\nname|" .. VwV .."|".. door .."\ninvitedWorld|0",3)
        sleep(5400)
    end
end
local function prov()
    warp2(worldName:lower(), idDoor:lower())
    sleep(250)
    for _,tile in pairs(getTiles()) do
        if tile.fg == provider and tile.ready == true then 
            findPath(tile.x,tile.y)
            sleep(350)
            punch(0,0)
            collectSet(true,3)
            sleep(250)
            if findItem(ItemID) > MaxItem then
                sleep(500)
                break
            end
        end
    end
collectSet(false,0)
end

local function dropS()
    if findItem(ItemID) > MaxItem then
        warp2(worldDrop:lower(), idDoorDrop:lower())
        sleep(250)
        for _, tile in pairs(getTiles()) do
            if tile.fg == backgroundDrop or tile.bg == backgroundDrop then
                sleep(2500)
                findPath(tile.x-1, tile.y)
                sleep(3000)
                drop(ItemID)
                 sleep(3000)
                 drop(ItemID2)
                 sleep(3000)
                 drop(ItemID3)
                 sleep(3000)
                 drop(ItemID4)
                 sleep(3000)
                 drop(ItemID5)
                 sleep(3000)
                if findItem(ItemID) == 0 then
                    break
                end
            end
        end
    end
end

while true do
    if findItem(ItemID) > MaxItem then
        sleep(250)
        dropS()
    else
        sleep(250)
        prov()
    end
end
