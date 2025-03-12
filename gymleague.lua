--[[
  Automation Script for Roblox Gym League
  Author: k4zmm_
  Description: This script includes anti-AFK measures, automatic training, treadmill speed control,
               competition automation, walk speed adjustments, and a server rejoin feature.
--]]

-- Anti-AFK Prevention
warn("Laoding Anti-AFK ...")
local VirtualUser = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("[Anti-AFK] Prevented kick.")
end)
warn("[Anti-AFK] - Loaded successfully")

-- Load Dependencies
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Window Setup
local Window = Fluent:CreateWindow({
    Title = "Gym League (0.1)",
    SubTitle = "by k4zmm_",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "file-text" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Variables
local autoTrainEnabled = false
local autoCompetitionEnabled = false
local autoSetTreadmillEnabled = false
local defaultWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed

-- Functions
warn("Loading Functions...")
local function checkStamina()
    local staminaUI = game:GetService("StarterGui").Main.BottomCenter:FindFirstChild("Stamina")
    if staminaUI and tonumber(staminaUI.Text) <= 10 then
        autoTrainEnabled = false
    else
        autoTrainEnabled = true
    end
end

local function autoSetTreadmillSpeed()
    while autoSetTreadmillEnabled do
        for _, equipment in pairs(workspace.Equipments:GetChildren()) do
            if not autoSetTreadmillEnabled then break end
            if equipment:IsA("Model") and equipment.Name == "treadmill" then
                local args = { true }
                game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index")
                    :WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services")
                    :WaitForChild("EquipmentService"):WaitForChild("RF"):WaitForChild("ChangeSpeed"):InvokeServer(unpack(args))
            end
        end
        wait(0.5) -- Prevent overloading
    end
end

local function autoCompetition()
    while autoCompetitionEnabled do
        local countdownUI = game:GetService("Players").LocalPlayer.PlayerGui.Podium:FindFirstChild("countdown")
        if countdownUI then
            game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index")
                :WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services")
                :WaitForChild("PodiumService"):WaitForChild("RE"):WaitForChild("Event"):FireServer()
        end
        wait(0.01)
    end
end

warn("Load Functions Successfully!")
-- UI Setup
warn("Loading UI")
Tabs.Main:AddToggle("Auto_Train", { Title = "Auto Train", Default = false }):OnChanged(function(state)
    autoTrainEnabled = state
    spawn(function()
        while autoTrainEnabled do
            local clickButton = game:GetService("Players").LocalPlayer.PlayerGui.Main.RightCenter:FindFirstChild("click")
            if clickButton and clickButton.Visible then
                local VirtualInputManager = game:GetService("VirtualInputManager")
                local position = clickButton.AbsolutePosition
                local clickX = position.X + clickButton.AbsoluteSize.X / 2
                local clickY = position.Y + clickButton.AbsoluteSize.Y / 2
                VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 0)
                VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 0)
            end
            wait(0.2)
        end
    end)
end)

Tabs.Main:AddToggle("Auto_Set_Treadmill_Speed", { Title = "Auto Set Treadmill Speed", Default = false }):OnChanged(function(state)
    autoSetTreadmillEnabled = state
    if state then spawn(autoSetTreadmillSpeed) end
end)

Tabs.Main:AddToggle("Auto_Competition", { Title = "Auto Competition", Default = false }):OnChanged(function(state)
    autoCompetitionEnabled = state
    if state then spawn(autoCompetition) end
end)

local speedInput = Tabs.Misc:AddInput("Speed", {
    Title = "Walk Speed",
    Default = tostring(defaultWalkSpeed),
    Placeholder = "Enter walk speed",
    Numeric = true,
    Callback = function(value)
        if tonumber(value) then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
        end
    end
})

Tabs.Misc:AddButton({
    Title = "Rejoin Server",
    Description = "Reconnect to the server",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

-- Finalize
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("k4zmm")
SaveManager:SetFolder("k4zmm/gymleague")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "k4zmm_'s Script",
    Content = "The script has been loaded successfully.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
warn("Load UI Successfully!")
print("Load Successfully!")
