-- Delta Speed Script (Velocidad 100+)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "SpeedFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 50)
MainFrame.Active = true
MainFrame.Draggable = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = MainFrame

ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 35, 35)
ToggleBtn.Size = UDim2.new(1, -10, 1, -10)
ToggleBtn.Position = UDim2.new(0, 5, 0, 5)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "Velocidad: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 16.000

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = ToggleBtn

-- Configuración de Velocidad
local speedActive = false
local desiredSpeed = 120 -- Puedes cambiar este valor a más de 100

ToggleBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    if speedActive then
        ToggleBtn.Text = "Velocidad: ON ("..tostring(desiredSpeed)..")"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 200, 35)
    else
        ToggleBtn.Text = "Velocidad: OFF"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 35, 35)
    end
end)

-- Bucle de movimiento
game:GetService("RunService").RenderStepped:Connect(function()
    if speedActive then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character.Humanoid
            local hrp = player.Character.HumanoidRootPart
            
            -- Aplica la velocidad en la dirección hacia donde se mueve el jugador
            if humanoid.MoveDirection.Magnitude > 0 then
                hrp.Velocity = Vector3.new(
                    humanoid.MoveDirection.X * desiredSpeed, 
                    hrp.Velocity.Y, 
                    humanoid.MoveDirection.Z * desiredSpeed
                )
            end
        end
    end
end)
