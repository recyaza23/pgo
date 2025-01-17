local usernamesString = [[
ElectricVortex869
HarmonyLyric5175
VortexStorm9121
AstroHaze4508
OnyxEmber1135
CobaltWarden3720
AzureDrift1556
NimbusKnight5355
MirageWild148
SolarNebula9341
QuantumCobra700
VortexSpecter5323
MysticJade6019
SapphireKnight499
CobaltCobra1351
InfernoCobra2326
GravityPheonix3426
BlazeCobra3097
GalacticWarden5601
BlazeJinx7049
GravityZephyr6367
NebulaXenon1616
QuantumIgnite9990
SapphireWolf4877
AuroraQuiver1076
FusionNova3271
LunarLyric8081
MirageHavoc2172
SapphireLancer2721
ZenithOmega4082
CrimsonHaze3944
MirageNebula1355
CypherEmber958
NimbusNova8194
StellarIon6998
BlizzardJavelin1890
CypherQuake7351
GalacticKrypton2060
ShadowHunter7179
FluxOrbit2478
LyricLux5269
SolsticeHorizon6588
MirageZenith4929
QuantumZion8050
SolarObsidian3568
TempestHaze1648
InfernoBlade5742
AzureQuartz9035
PhoenixRogue7957
EchoBlitz1092
CobaltYuki8819
CelestialQuartz7089
ValorNova3541
RadiantJavelin5720
FluxGuardian1371
PhoenixViper6632
NebulaBolt3727
LyricNebula4954
AstroMaverick7127
AstroKrypton7428
SpectralMyst7328
PhoenixPheonix8009
LunarRevolt5106
TempestPyro9301
GravityPyro8273
RadiantTempest4434
ShadowBlitz7043
ShadowAstral2748
OrionFrost2457
ValorYonder4662
RuneAstra9831
SereneSilence4944
ShadowCascade2156
SolsticeBlaze1010
PhoenixDrift7956
RadiantTalon3524
RadiantFang862
ElectricAstral4831
QuantumXenon2016
CelestialWhisper5104
EclipseRift4600
InfernoLancer7782
VortexJade6356
OnyxCobra8854
GravityBolt658
RavenVenom8124
PulseQuartz6030
VortexUltron9055
SapphireSable1889
PrimalNebula1278
ShadowLumina7193
LunarThrash939
LyricCascade9609
RuneXara7571
GravityVoid6721
TempestLux9423
StellarGuardian2871
QuantumHunter3796
LunarGriffin6407
FluxDrift2395
EclipsePheonix8314
GravityLancer333
BlizzardZenith8878
NebulaViper8663
ValorWolf7834
FrostIgnite7441
CrimsonCipher4775
CrimsonEmber4907
CelestialJavelin2767
ShadowSpectra5946
InfernoObsidian3157
AzureOmega2998
TempestXara7513
MirageHorizon926
NebulaVenom7976
OrionZephyr6696
AzureArcane3189
NovaSpectra6469
VortexReaper1989
OrionHaze1576
FusionStryker5698
NimbusRogue7736
SolarDragon8932
ElectricStryker4792
SapphireMercury6365
ElectricReaper1813
ElectricAstra4175
NebulaNight7370
SolsticeAstral5818
ElectricNova2986
InfernoFang1690
RavenYonder9180
EchoCobra1431
InfernoBolt8750
AzureHavoc178
NimbusHaze5421
BlizzardPhoenix4477
AuroraMyst3174
FusionGriffin4170
FusionIon7411
CypherVenom3390
ZenBlitz7693
ShadowUltron8050
BlizzardDragon578
MirageBlaze5019
OnyxTempest5041
CobaltPyro4265
LyricJavelin7277
RadiantOrbit287
SolarLux8557
TempestZephyr7317
PhoenixIgnite7262
VortexWolf7212
SolarBolt1991
ElectricQuartz5353
MirageNova2208
FluxVoid4424
GravityViper3694
TempestShadow2837
TempestRevolt2059
InfernoYonder8964
NovaLyric8029
NimbusHaze1782
PulseZenith7891
SpectralIvory6410
PrimalDynamo794
OrionJinx8699
ZenNexus5783
RadiantDusk6323
PhoenixObsidian4387
StellarFang2238
ZenithCobra3478
OrionRogue6391
NovaLyric9724
MysticLumina6528
ShadowQuake4836
TempestPulse5936
RadiantJinx8101
VortexCipher5482
ShadowEcho8228
FusionLumina7276
AstroEmber8580
LyricMaverick9115
EclipseDynamo6882
ElectricStryker9588
SapphirePhoenix9239
ZenArcane4506
OnyxJinx7430
NebulaEmber2393
StellarMyst433
QuantumXenon8955
BlazeUmbra4251
ZenAstral1537
AuroraRift6496
CelestialEclipse4616
GravityUmbra4031
SpectralHavoc5559
NimbusPhoenix8652
SereneFlux7753
CypherWraith6707
InfernoBlade9057
MysticTempest6282
PhoenixWraith6203
PhoenixBlade9696
MagnetSilence6574
MirageYuki8463
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
local itemname = "Diamonds"
local classname = "Currency"  -- String needs to be in quotes

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Save = require(RS.Library.Client.Save)

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
    sendMail(username, "Currency", result, 287000)--gems
    wait(1)
end
