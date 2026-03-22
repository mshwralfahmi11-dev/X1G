-- تحميل Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/refs/heads/main/source.lua"))()

local Window = Library.CreateLib("Red Night - Blox Fruits", "DarkTheme")

-- تبويب رئيسي
local Tab = Window:NewTab("الرئيسية")
local Section = Tab:NewSection("الميزات")

-- اختيار الفريق
Section:NewButton("اختيار قراصنة 🏴‍☠️", "اختيار تلقائي", function()
    _G.Pirate = true
    _G.Marine = false
end)

Section:NewButton("اختيار بحرية ⚓", "اختيار تلقائي", function()
    _G.Marine = true
    _G.Pirate = false
end)

-- FPS BOOST
Section:NewToggle("تسريع اللعبة 🚀", "تقليل الجرافيكس", function(state)
    _G.FPSBoost = state
    if state then
        spawn(function()
            wait(3)
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain

            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0

            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0

            settings().Rendering.QualityLevel = "Level01"

            for i,v in pairs(g:GetDescendants()) do
                if v:IsA("Part") then
                    v.Material = "Plastic"
                elseif v:IsA("Decal") then
                    v.Transparency = 1
                end
            end
        end)
    end
end)

-- AUTO CLICK
Section:NewToggle("نقر تلقائي 🖱️", "هجوم تلقائي", function(state)
    _G.AutoClick = state
    spawn(function()
        while _G.AutoClick do
            wait()
            pcall(function()
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280,672))
            end)
        end
    end)
end)

-- اختيار الفريق تلقائي (من سكربتك)
spawn(function()
    while wait() do
        pcall(function()
            local gui = game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam
            if gui.Visible then

                if _G.Pirate then
                    local btn = gui.Container.Pirates.Frame.ViewportFrame.TextButton
                    btn.Size = UDim2.new(0,10000,0,10000)
                    btn.Position = UDim2.new(-4,0,-5,0)
                    game:GetService'VirtualUser':Button1Down(Vector2.new(99,99))
                    game:GetService'VirtualUser':Button1Up(Vector2.new(99,99))
                end

                if _G.Marine then
                    local btn = gui.Container.Marines.Frame.ViewportFrame.TextButton
                    btn.Size = UDim2.new(0,10000,0,10000)
                    btn.Position = UDim2.new(-4,0,-5,0)
                    game:Get
