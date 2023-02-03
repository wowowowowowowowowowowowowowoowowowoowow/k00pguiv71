local players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = events:WaitForChild("OnMessageDoneFiltering")

if not isfile("chatlogger.lua") then
    writefile("chatlogger.lua", "🛈 This file was created at " ..  tostring(os.date("%B"))  .. " " ..  tostring(os.date("%d"))  .. " " ..  tostring(os.date("%Y"))  .. " " ..  "at " ..  tostring(os.date("%X")) .. tostring(os.date("%p")) ..  " in the " ..  tostring(os.date("%Z"))  .. ". This is for the Chat Logger script. \n\n")
end

messageDoneFiltering.OnClientEvent:Connect(
    function(message)
		local speaker = players:FindFirstChild(message.FromSpeaker)
		local message = message.Message
		appendfile("chatlogger.lua", tostring(os.date("%p")) .. "[".. speaker.Name .."]: " .. message .. "\n")
    
	end
)
