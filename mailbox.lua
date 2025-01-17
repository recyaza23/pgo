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
LunarQuartz4854
LyricViper4101
HarmonyXenon6936
AstroFlux9565
SereneDynamo1804
BlizzardSpecter5091
LyricObsidian1735
NovaCobra7675
OnyxIon9241
NebulaYonder1572
StellarAstra4927
NovaGuardian160
MirageFlux908
LunarBlade9372
FluxRift7962
EclipseGlitch4189
AuroraEmber8821
PrimalKarma5652
StellarQuiver1052
CelestialHorizon9776
SapphireIon4758
CobaltCascade7880
SereneRider4860
FluxKnight962
FluxHaze3980
NovaOmega4775
OrionThrash4458
FrostHunter5024
CobaltNova9697
CelestialBlade4664
SolsticeQuartz1687
SolarNight8176
EchoRogue6865
AstroVoid6475
BlizzardRider5348
FrostThrash9801
PrimalFrost6599
NimbusBlaze5518
RadiantFang3312
BlazeWhisper3053
AzureKrypton1986
QuantumWolf7498
MirageFrost3544
SpectralViper3270
NebulaBlaze1643
GalacticDragon970
SapphireBlade8553
CelestialBerserk1458
FrostDynamo5817
QuantumLancer2406
EclipseDynamo1848
SolsticeIvory8551
PhoenixRevolt945
LunarYonder8036
SolsticeDynamo7722
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
