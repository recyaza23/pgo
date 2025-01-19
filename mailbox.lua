local usernamesString = [[
PrimalKnight9474
ShadowStryker7490
GravityWarden356
OnyxZephyr7831
CobaltQuiver7222
OrionKnight5476
CelestialBerserk4734
GalacticReaper5640
TempestSpectra2779
HarmonyZephyr4395
AzureViper8953
ZenInferno6708
SpectralQuartz3871
MirageUltron7845
EclipseCipher8696
BlizzardVoid6939
AuroraFlux7676
InfernoLyric6479
OnyxIon6723
HarmonyYuki4752
SolsticeGlitch5401
MirageFrost5026
EchoKrypton9169
TempestThrash9616
MirageJinx2487
MagnetKarma3725
SolarLyric9254
PulseEmber5130
CypherObsidian9856
RavenWolf8050
RadiantWolf1059
EclipseEmber1341
AuroraUltron9211
FluxNebula4542
GravityViper1337
SpectralUmbra5213
SolsticeBerserk1206
VortexUmbra9902
QuantumQuake1283
CelestialNova4310
PrimalMyst1152
TempestAstral1154
PrimalRider2183
SpectralStryker6393
BlizzardZephyr7161
ElectricXenon4071
ElectricEclipse1208
GravityValor4259
RadiantTalon3279
MysticBolt1995
SpectralVoid3946
ZenithJavelin1727
NovaNexus9999
ValorTempest1352
ShadowJade2097
SolarAstra7484
GravityQuartz7926
BlizzardNova6808
MagnetQuartz1452
VortexYonder3385
EclipseOmega164
OrionArcane6052
BlizzardDynamo8838
PrimalFlux643
SolsticeVoid2022
AstroAstral856
BlazeViper4666
PulseBlaze5130
LyricVenom322
GravityDynamo6275
OrionRider3731
CobaltLyric5288
CobaltWild1559
EclipseMaverick1043
RadiantInferno9214
CobaltIvory7666
FusionXara6896
SereneNexus7469
InfernoEmber793
StellarRogue5462
AstroAstral9480
ZenithCobra1658
AuroraKarma6697
StellarPheonix1355
AuroraRider2308
CelestialQuiver9606
SolsticeLumina3942
TempestFrost9067
OnyxMyst6309
SpectralTalon6775
StellarAstral4565
GravityDusk8810
QuantumArcane5891
OrionObsidian1186
VortexKrypton652
LunarAstra8076
BlizzardNight666
SapphirePyro2954
SolarJavelin5762
HarmonyBlitz8212
StellarFable9945
GalacticCascade321
RuneBlaze3699
SereneRogue4499
RadiantGriffin787
RavenNexus3618
ShadowXara9361
EclipseUltron8701
PrimalTitan6708
NovaBlade2143
MysticGriffin7800
HarmonyOrbit9588
VortexEcho2846
CelestialViper2462
RuneCascade2590
SapphirePulse6480
InfernoWhisper8040
RavenKarma1452
TempestWraith2450
FrostStryker5012
SolarRift8183
VortexGriffin4312
HarmonyNexus7690
BlizzardWolf8138
ZenDynamo2069
ShadowBlaze6896
NovaVenom5527
LyricXenon943
CrimsonSpectra5518
ZenJade8896
SolarIon3391
ValorCipher1266
SapphireZephyr9001
EclipseBerserk6542
NovaTempest6201
FrostZenith6097
EchoIon2819
PhoenixPyro8756
AzureStryker8951
SolarVenom3384
OrionVoid342
BlazeHavoc5735
CrimsonWolf9356
FrostEcho9760
SereneDrift7192
LyricHavoc3639
CypherQuartz1540
SolarVortex6911
FusionSable1098
CobaltLyric7652
HarmonyThrash7233
ValorObsidian551
GravityIvory5347
InfernoPulse4682
MagnetHaze2539
StellarEcho8075
NebulaNebula8589
InfernoArcane5920
ValorKnight4607
EclipseIgnite1486
MysticVortex7993
RavenSpectra6156
InfernoPyro4622
LyricEclipse6130
LunarIvory1338
RadiantBolt1703
AstroBerserk5422
SpectralZenith9666
GravityGriffin4367
FrostFlux6507
AstroCobra2206
QuantumStryker9627
RavenUltron9589
RadiantYonder1497
FluxGale7517
LunarLyric3239
SolsticeRift3929
LyricGlitch544
CelestialFlux6859
ElectricFable2124
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
