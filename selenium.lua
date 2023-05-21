repeat wait() until game:IsLoaded()
local Options = ({...})[1] or { QueueOnTeleport = false };

local players = game:GetService("Players")
local player = players.LocalPlayer
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request


local executor = identifyexecutor()
local supportedexecutors = {"Synapse X", "ScriptWare", "Krnl", "Electron"}


if not table.find(supportedexecutors, executor) then
	player.Kick(player, "")
    game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.Text = "You have a executor which cannot run Selenium. Please switch to Eletron, Krnl, ScriptWare or Synapse."
    game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").TitleFrame.ErrorTitle.Text = "Unsupported Executor" 
end


local succ, err = pcall(function()


    if Options.QueueOnTeleport == true then
        local queueteleport = (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or queue_on_teleport 
        queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/main/selenium.lua", true))({ QueueOnTeleport = true})')
    end

    local Supported = {

        ["6708206173"] = {
            Game = "Rate My Avatar",
            Path = "ratemyavatar"
        },
        ["6735572261"] = {
            Game = "Pilgrammed",
            Path = "pilgrammed"
        },
        ["12604352060"] = {
            Game = "Arcane Odyssey - The Bronze Sea",
            Path = "arcaneodyssey"
        },
        ["4490140733"] = {
            Game = "My Restaurant",
            Path = "myrestaurant"
        },
        ["9447079542"] = {
            Game = "PM",
            Path = "PM/mainmenu"
        },
        ["13107615642"] = {
            Game = "AFK World",
            Path = "PM/afk"
        },
        ["9474703390"] = {
            Game = "Karakua Town",
            Path = "PM/main"
        },
        ["10202329527"] = {
            Game = "Hueco Mundo",
            Path = "PM/main"
        }
    }

    local function detectgame()
        local gamePath = Supported[tostring(game.PlaceId)]
        return gamePath and gamePath.Path
    end

    local function loadscript()
        assert(detectgame(), "Game path not found")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/backend/hub/" .. detectgame(), true))()
    end

    if detectgame() then
        loadscript() 
    else
        player.Kick(player, "")
        game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.Text = "This game is not supported on Selenium. Please refer to discord.gg/evon."
        game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").TitleFrame.ErrorTitle.Text = "Session Terminated"
    end

end)

if err then
    player.Kick(player, "")
    game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.Text = "An error has occurred while trying to connect to the loader. Error: " .. err .. ". You should try to contact the developer of this product or try again."
    game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt").TitleFrame.ErrorTitle.Text = "Session Terminated"
end



