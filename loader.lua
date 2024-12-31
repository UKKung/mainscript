--[[
    Rich Script: k4zmm_'s Loader
    Features: 
    - Enhanced error handling
    - Support for multiple modes
    - User-friendly feedback
    - Clearer code structure
--]]

print("Initializing k4zmm_'s Script Loader...")
wait(0.5)

-- Configuration
_G.Mode = _G.Mode or 'Normal' -- Default mode is 'Normal'
local supportedGames = {
    ["Normal"] = {16732694052}, -- List of game IDs for 'Normal' mode
    ["AnotherMode"] = {1234567890}, -- Add more modes and IDs here
}
local scripts = {
    ["Normal"] = "https://raw.githubusercontent.com/UKKung/mainscript/refs/heads/main/fisch.lua",
    ["AnotherMode"] = "https://example.com/anothermode.lua" -- Replace with actual URL
}

-- Functions
local function isGameSupported(gameId, mode)
    if supportedGames[mode] then
        for _, id in ipairs(supportedGames[mode]) do
            if id == gameId then
                return true
            end
        end
    end
    return false
end

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

if isGameSupported(gameId, _G.Mode) then
    print("Loading script for mode: " .. _G.Mode)
    local scriptUrl = scripts[_G.Mode]
    if scriptUrl then
        loadScript(scriptUrl)
    else
        warn("No script URL found for mode: " .. _G.Mode)
    end
else
    print("This game is not supported in the current mode: " .. _G.Mode)
    print("Supported games for " .. _G.Mode .. ":")
    if supportedGames[_G.Mode] then
        for _, id in ipairs(supportedGames[_G.Mode]) do
            print(" - Game ID: " .. id)
        end
    else
        print("No supported games found for this mode.")
    end
end
