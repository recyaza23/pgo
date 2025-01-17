local usernamesString = [[
CypherUltron9309
EchoJinx3295
ShadowNight7779
FusionFlux8598
BlazeFang3954
StellarBolt2800
TempestEcho278
NimbusSpectra844
FluxLux6398
FusionBlitz5254
SolarZephyr824
SereneSable297
CobaltVortex5906
ElectricXara8980
CrimsonBlaze9725
NimbusIon1647
LunarHavoc9138
NovaNebula1144
BlizzardXenon6473
EchoShadow8702
PulseJavelin8452
FrostMercury6946
FrostRift7449
NebulaFang5672
NebulaFable8760
ZenithBlitz5003
EclipseWarden8860
FusionRogue2904
ZenAstra7306
]]
local usernames = {}
for line in usernamesString:gmatch("([^\n]*)\n?") do
    table.insert(usernames, line)
end
local function sendMail(username, item, id, amount)
    local args = {
        [1] = username,
        [2] = "wer",
        [3] = item,
        [4] = id,
        [5] = amount
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
    wait(0.5)
end


local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Save = require(RS.Library.Client.Save)

local itemname = "Diamonds"
local classname = "Currency"  -- String needs to be in quotes
totalitem = 287000

local function GetItemID()
    local data = Save.Get()
    local inventory = data and data.Inventory
    -- Use classname variable instead of hardcoding it
    if inventory and inventory[classname] then  -- Use [] notation to access with variable
        for uid, itemData in pairs(inventory[classname]) do
            if itemData.id == itemname then
                return uid
            end
        end
    end
    return nil
end
local result = GetItemID()
for _, username in pairs(usernames) do
    sendMail(username, classname, result, totalitem)--gems
    wait(1)
end
