local HttpService = game:GetService("HttpService")
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Save = require(RS.Library.Client.Save)

local itemname = "Corrupted Huge Bait"
local classname = "Consumable" -- String needs to be in quotes
local usernamesStringURL = "https://raw.githubusercontent.com/recyaza23/pgo/refs/heads/main/username.txt" -- Replace with your actual URL
local totalitem = 500
-- Fetch usernamesString from URL
local usernamesString
local success, response = pcall(function()
    return HttpService:GetAsync(usernamesStringURL)
end)

if success then
    usernamesString = response
else
    warn("Failed to fetch usernamesString: " .. tostring(response))
    usernamesString = "" -- Fallback to an empty string if the fetch fails
end

-- Parse usernames from the fetched string
local usernames = {}
for line in usernamesString:gmatch("([^\n]*)\n?") do
    if line ~= "" then -- Exclude empty lines
        table.insert(usernames, line)
    end
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
    if inventory and inventory[classname] then -- Use classname variable
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
