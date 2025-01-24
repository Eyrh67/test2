-- Khai báo ID của Decal và Sound
local decalId = "rbxassetid://76302086268396" -- ID Decal
local soundId = "rbxassetid://3154932420" -- ID Âm thanh

-- Đợi LocalPlayer
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullScreenDecal"
screenGui.Parent = playerGui

-- Tạo ImageLabel để hiển thị decal
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0) -- Kích thước toàn màn hình
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.Image = decalId
imageLabel.BackgroundTransparency = 1 -- Làm nền trong suốt
imageLabel.Parent = screenGui

-- Tạo âm thanh
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Volume = 1 -- Âm lượng (chỉnh từ 0 đến 10)
sound.Looped = true -- Lặp âm thanh mãi mãi
sound.Parent = playerGui

-- Kích hoạt decal và âm thanh
sound:Play()

