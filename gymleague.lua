------- Anti AFK!!!!!!!!!
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("Roblox Tried to kick you but we didn't let them kick you :D")
end)
warn("[Anti Afk] - loaded successfully") 
------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Gym League (0.1)",
    SubTitle = "by k4zmm_",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Misc = Window:AddTab({Title = 'Misc', Icon = "file-text"}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

------var

local autoTrainEnabled = false
local autoTrainPaused = false
local autoCompetitionEnabled = false
local autoSetTreadmillEnabled = false
local autoLoadEnabled = false

-------
-- Function to check stamina and pause auto train if necessary
local function checkStamina()
    local staminaUI = game:GetService("StarterGui").Main.BottomCenter:FindFirstChild("Stamina")
    if staminaUI and tonumber(staminaUI.Text) <= tonumber(Inputsped.Value) then
        autoTrainPaused = true
    else
        autoTrainPaused = false
    end
end

-- Auto Set Treadmill Speed
local function autoSetTreadmillSpeed()
    while autoSetTreadmillEnabled do
        for _, equipment in pairs(workspace.Equipments:GetChildren()) do
            if not autoSetTreadmillEnabled then break end
            if equipment:IsA("Model") and equipment.Name == "treadmill" then
                local args = {
                    [1] = true
                }
                game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EquipmentService"):WaitForChild("RF"):WaitForChild("ChangeSpeed"):InvokeServer(unpack(args))
            end
        end
    end
end

----rest

do  
    local section = Tabs.Main:AddSection("Automatic")
--[[    local Inputsped = Tabs.Main:AddInput("Spawdsawdsawdsawdsawddwad", {
        Title = "Stamina SSDS",
        Default = "0",
        Placeholder = "Placeholder",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
        end
    })

    Inputsped:OnChanged(function()
        print("Input updated:", Inputsped.Value)
    end)]]

    local Auto_Train = Tabs.Main:AddToggle("Auto_Train", {Title = "Auto Train", Default = false })
    Auto_Train:OnChanged(function(state)
        autoTrainEnabled = state
        spawn(function()
            while autoTrainEnabled do
                -- if not autoTrainPaused then
                    local clickButton = game:GetService("Players").LocalPlayer.PlayerGui.Main.RightCenter:FindFirstChild("click")
                    if clickButton and clickButton.Visible then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        local screenPosition = clickButton.AbsolutePosition
                        local clickX = screenPosition.X + clickButton.AbsoluteSize.X / 2
                        local clickY = screenPosition.Y + clickButton.AbsoluteSize.Y / 2
                        VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 0)
                        VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 0)
                    end
                -- end
                wait(0.2)  -- Small delay to allow toggling off
            end
        end)
    end)

    local Auto_Load = Tabs.Main:AddToggle("Auto_Load", {Title = "Auto Load", Default = false })
    Auto_Load:OnChanged(function(state)
        autoLoadEnabled = state
        spawn(function()
            while autoLoadEnabled do
                for _, equipment in pairs(workspace.Equipments:GetChildren()) do
                    if not autoLoadEnabled then break end
                    if equipment.Name ~= "treadmill" then
                        game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EquipmentService"):WaitForChild("RF"):WaitForChild("AutoLoad"):InvokeServer()
                    end
                end
            end
        end)
    end)

    local Auto_Set_Treadmill_Speed = Tabs.Main:AddToggle("Auto_Set_Treadmill_Speed", {Title = "Auto Set Treadmill Speed", Default = false })
    Auto_Set_Treadmill_Speed:OnChanged(function(state)
        autoSetTreadmillEnabled = state
        if state then
            spawn(autoSetTreadmillSpeed)
        end
    end)

    local Auto_Competition = Tabs.Main:AddToggle("Auto_Competition", {Title = "Auto Competition", Default = false })
    Auto_Competition:OnChanged(function(state)
        autoCompetitionEnabled = state
        spawn(function()
            while autoCompetitionEnabled do
                local countdownUI = game:GetService("Players").LocalPlayer.PlayerGui.Podium:FindFirstChild("countdown")
                if countdownUI then
                    game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PodiumService"):WaitForChild("RE"):WaitForChild("Event"):FireServer()
                end
                wait(0.01)  -- Very short delay to prevent crashing
            end
        end)
    end)
    local section = Tabs.Misc:AddSection("Automatic")
    local ToggleWalkspeed = Tabs.Misc:AddToggle("Walk Speed", {Title = "Walk Speed", Default = false })
    local defaultWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
    
    local Input = Tabs.Misc:AddInput("Speed", {
        Title = "Speed",
        Default = "16",
        Placeholder = "Enter walk speed",
        Numeric = true,
        Finished = false,
        Callback = function(Value)
        end
    })
    
    Input.OnChanged = function()
        if ToggleWalkspeed:Get() then
            local speedValue = Input.Value
            if tonumber(speedValue) then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedValue)
            end
        end
    end
    
    ToggleWalkspeed:OnChanged(function(State)
        if State then
            local speedValue = Input.Value
            if speedValue and tonumber(speedValue) then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedValue)
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = defaultWalkSpeed
        end
    end)

    local section = Tabs.Misc:AddSection("Server")
    Tabs.Misc:AddButton({
        Title = "Rejoin",
        Description = "Rejoin the server",
        Callback = function()
            local tpservice= game:GetService("TeleportService")
            local plr = game.Players.LocalPlayer
            
            tpservice:Teleport(game.PlaceId, plr)
            
            local target = game:GetService("Players").LocalPlayer
            local message = "Rejoin.."
            local gives_message = true
            if gives_message then
                target:Kick(message)
            else
                target:Kick()
            
                end
        end
    })
end

----------

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("k4zmm")
SaveManager:SetFolder("k4zmm/gymleague")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "k4zmm_'s Script",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
