local usernamesString = [[

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
totalitem = 1000000

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
