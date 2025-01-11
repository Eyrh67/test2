-- Biến để bật/tắt tự động dịch chuyển
local autoTeleport = false

-- Lấy các thành phần GUI
local teleportFrame = script.Parent
local toggleButton = teleportFrame:WaitForChild("ToggleButton")

-- Lấy vị trí Chest3
local chest3 = game.Workspace:WaitForChild("Chest3")

-- Lấy nhân vật người chơi
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Hàm dịch chuyển đến Chest3
local function teleportToChest()
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = chest3.CFrame + Vector3.new(0, 3, 0) -- Dịch chuyển lên trên Chest3 một chút
    end
end

-- Vòng lặp tự động dịch chuyển
game:GetService("RunService").RenderStepped:Connect(function()
    if autoTeleport then
        teleportToChest()
    end
end)

-- Xử lý nút bật/tắt
toggleButton.MouseButton1Click:Connect(function()
    autoTeleport = not autoTeleport -- Chuyển trạng thái bật/tắt
    if autoTeleport then
        toggleButton.Text = "Tắt tự động dịch chuyển"
    else
        toggleButton.Text = "Bật tự động dịch chuyển"
    end
end)

-- Ẩn/Hiện Frame
teleportFrame.Visible = true -- Đặt true để hiển thị GUI ban đầu
local userInput = game:GetService("UserInputService")

userInput.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then -- Nhấn phím F để ẩn/hiện GUI
        teleportFrame.Visible = not teleportFrame.Visible
    end
end)
