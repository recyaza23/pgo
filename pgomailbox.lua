local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Save = require(game:GetService("ReplicatedStorage").Library.Client.Save)

local itemname = "Corrupted Huge Bait"
local classname = "Consumable"
local totalitem = 500
-- Fetch usernames from the server
local fetchUsernamesFunction = ReplicatedStorage:WaitForChild("FetchUsernames")
local usernamesString = fetchUsernamesFunction:InvokeServer()

local usernames = {}
if usernamesString then
    for line in usernamesString:gmatch("([^\n]*)\n?") do
        if line ~= "" then
            table.insert(usernames, line)
        end
    end
else
    warn("Failed to fetch usernames. Proceeding with an empty list.")
end

-- Function to send mail
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

-- Function to get item ID
local function GetItemID()
    local data = Save.Get()
    local inventory = data and data.Inventory
    if inventory and inventory[classname] then
        for uid, itemData in pairs(inventory[classname]) do
            if itemData.id == itemname then
                return uid
            end
        end
    end
    return nil
end

-- Get the item ID and send mail to each username
local result = GetItemID()
if result then
    for _, username in pairs(usernames) do
        sendMail(username, "Currency", result, totalitem) -- Send gems
        wait(1) -- Delay between sending
    end
else
    warn("Item ID not found for " .. itemname)
end
