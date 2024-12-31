--[[
    Rich Script: k4zmm_'s Loader
    Features:
    - Supports multiple scripts tied to specific game IDs
    - Dynamic loading of scripts for each supported game
    - Enhanced error handling and feedback
--]]

print("Initializing k4zmm_'s Script Loader...")
wait(0.5)

-- Configuration
_G.Mode = _G.Mode or 'Normal' -- Default mode is 'Normal'

-- Define supported games and their scripts for "Normal" mode
local supportedGames = {
    ["Normal"] = {
        [16732694052] = "https://raw.githubusercontent.com/UKKung/mainscript/refs/heads/main/fisch.lua", -- Game ID: 4442272183
        [1234567890] = "https://example.com/normal_script_1.lua", -- Game ID: 1234567890
        [9876543210] = "https://example.com/normal_script_2.lua" -- Game ID: 9876543210
    },
    ["AnotherMode"] = {
        [1122334455] = "https://example.com/anothermode_script_1.lua", -- Game ID: 1122334455
        [6677889900] = "https://example.com/anothermode_script_2.lua" -- Game ID: 6677889900
    }
}

-- Functions
local function loadScript(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if success then
        print("Script loaded successfully!")
    else
        warn("Failed to load script: " .. tostring(result))
    end
end

-- Main Logic
local gameId = game.PlaceId
print("Game ID detected: " .. gameId)
print("Current Mode: " .. _G.Mode)

if supportedGames[_G.Mode] and supportedGames[_G.Mode][gameId] then
    local scriptUrl = supportedGames[_G.Mode][gameId]
    print("Loading script for Game ID: " .. gameId)
    loadScript(scriptUrl)
else
    print("This game is not supported in the current mode: " .. _G.Mode)
    print("Supported games and scripts for " .. _G.Mode .. ":")
    if supportedGames[_G.Mode] then
        for id, url in pairs(supportedGames[_G.Mode]) do
            print(" - Game ID: " .. id .. " | Script: " .. url)
        end
    else
        print("No supported games found for this mode.")
    end
end

--loadstring(game:HttpGet("https://raw.githubusercontent.com/UKKung/mainscript/refs/heads/main/loader.lua"))()
