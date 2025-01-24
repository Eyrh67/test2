-- Khai báo ID của Decal và Sound
local decalId = "rbxassetid://76302086268396" -- ID Decal
local soundId = "rbxassetid://3154932420" -- ID Âm thanh

-- Đợi LocalPlayer
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullScreenDisplay"
screenGui.Parent = playerGui

-- Tạo ImageLabel để hiển thị hình ảnh
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0) -- Kích thước toàn màn hình
imageLabel.Position = UDim2.new(0, 0, 0, 0) -- Gắn vào góc trên bên trái màn hình
imageLabel.Image = decalId
imageLabel.BackgroundTransparency = 1 -- Làm nền trong suốt
imageLabel.ScaleType = Enum.ScaleType.Stretch -- Kéo hình để phủ kín màn hình
imageLabel.Parent = screenGui

-- Tạo TextLabel để hiển thị chữ
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.3, 0, 0.1, 0) -- Kích thước của TextLabel
textLabel.Position = UDim2.new(0.35, 0, 0.85, 0) -- Vị trí ở gần cuối màn hình
textLabel.BackgroundTransparency = 1 -- Làm nền trong suốt
textLabel.Text = "J97 kiếm bạn +" -- Nội dung chữ
textLabel.TextColor3 = Color3.new(1, 1, 1) -- Màu chữ (trắng)
textLabel.TextScaled = true -- Tự động chỉnh kích thước chữ
textLabel.Font = Enum.Font.SourceSansBold -- Font chữ
textLabel.Parent = screenGui

-- Tạo âm thanh
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Volume = 1 -- Âm lượng
sound.Looped = false -- Không lặp
sound.Parent = playerGui

-- Hàm phát âm thanh và chờ 5 giây sau khi kết thúc
local function playSoundWithDelay()
    sound:Play()
    sound.Ended:Wait() -- Đợi âm thanh kết thúc
    wait(5) -- Chờ 5 giây trước khi lặp lại
    playSoundWithDelay() -- Gọi lại chính nó để lặp
end

-- Kích hoạt âm thanh lần đầu tiên
playSoundWithDelay()
