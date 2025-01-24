-- Khai báo ID của Decal và Sound
local decalId = "rbxassetid://76302086268396" -- Thay DECAL_ID_CUA_BAN bằng ID decal
local soundId = "rbxassetid://3154932420" -- Thay SOUND_ID_CUA_BAN bằng ID âm thanh

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullScreenDecal"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

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
sound.Volume = 1 -- Âm lượng (có thể chỉnh từ 0 đến 10)
sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Kích hoạt decal và âm thanh
sound:Play()

-- Tùy chọn: Ẩn decal sau một khoảng thời gian
wait(5) -- Thời gian hiển thị decal (5 giây)
screenGui:Destroy() -- Xóa ScreenGui
