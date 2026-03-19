local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.1, 0, 0.3, 0)

Button.Parent = Frame
Button.Size = UDim2.new(1, 0, 1, 0)
Button.Text = "Invisible 👻"

local invisible = false

Button.MouseButton1Click:Connect(function()
    invisible = not invisible
    
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.LocalTransparencyModifier = invisible and 1 or 0
        end
    end
end)
