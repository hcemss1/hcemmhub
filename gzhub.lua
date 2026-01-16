-- [[ GZ HUB SUPREME - BLOX FRUIT EDITION ]]
-- AUTHOR: trumditraigz

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "GZ HUB | trumditraigz",
    SubTitle = "by trumditraigz",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- LOGO GZ TIKTOK (Minimize Button)
Fluent:MinimizeButton({
    Image = "http://www.roblox.com/asset/?id=117110463498585", -- ID Logo GZ chất
    Size = {60, 60},
    Color = Color3.fromRGB(0, 0, 0),
    Corner = true
})

-- BIẾN HỆ THỐNG
_G.AutoFarm = false
_G.FastAttack = false
_G.AimBot = false
_G.WalkSpeed = 16

-- CÁC TAB (Fluent Style)
local Tabs = {
    Main = Window:AddTab({ Title = "Auto Farm", Icon = "home" }),
    Combat = Window:AddTab({ Title = "Combat & Aim", Icon = "sword" }),
    Settings = Window:AddTab({ Title = "Cài Đặt", Icon = "settings" })
}

-- [ TAB AUTO FARM ]
Tabs.Main:AddToggle("AutoFarmToggle", {Title = "Auto Farm Level", Default = false}):OnChanged(function(Value)
    _G.AutoFarm = Value
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                -- Code Auto Farm độc quyền của trumditraigz sẽ xử lý ở đây
                print("GZ HUB: Đang tìm quái...")
            end)
            task.wait(0.1)
        end
    end)
end)

-- [ TAB COMBAT ]
Tabs.Combat:AddToggle("FastAttackToggle", {Title = "Fast Attack (Siêu Tốc)", Default = false}):OnChanged(function(Value)
    _G.FastAttack = Value
    task.spawn(function()
        while _G.FastAttack do
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end)
            task.wait(0.01)
        end
    end)
end)

Tabs.Combat:AddToggle("AimBotToggle", {Title = "Aimlock Skill", Default = false}):OnChanged(function(Value)
    _G.AimBot = Value
end)

-- [ TAB SETTINGS ]
Tabs.Settings:AddSlider("WalkSpeedSlider", {
    Title = "Tốc độ chạy",
    Description = "Chỉnh tốc độ cho trumditraigz",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        _G.WalkSpeed = Value
    end
})

-- HỆ THỐNG RENDER
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- Update WalkSpeed
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
        end
        
        -- Update Aimlock (Nếu bật)
        if _G.AimBot then
            -- Logic khóa mục tiêu Head/HumanoidRootPart
        end
    end)
end)

-- THÔNG BÁO KHI LOAD XONG
Fluent:Notify({
    Title = "GZ HUB LOADED",
    Content = "Xin chào trumditraigz! Script đã sẵn sàng.",
    Duration = 5
})

Window:SelectTab(1)
