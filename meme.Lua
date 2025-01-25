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

-- Tạo ImageLabel để hiển thị decal
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
textLabel.Text = "J97 kiếm bạn 😀😁😂🤣😃😄😅😆😉😊😋😎😍😘🥰😗😙😚🙂🤗🤩🤔🤨😐😑😶🙄😏😣😥😮🤐😯😪😫🥱😴😌😛😜🤪😝🤤😒😓😔😕🙃🤑😲☹️🙁😖😞😟😤😢😭😦😧😨😩🤯😬😰😱🥵🥶😳🤪😵😡😠🤬😷🤒🤕🤢🤮🤧😇🥳🥸🙈🙉🙊💀☠️👽👾🤖🎃😺😸😹😻😼😽🙀😿😾👐🙌👏🙏💪🦵🦶👋👌👍👎✊✌️🤞" -- Nội dung chữ
textLabel.TextColor3 = Color3.new(1, 1, 1) -- Màu chữ (trắng)
textLabel.TextScaled = true -- Tự động chỉnh kích thước chữ
textLabel.Font = Enum.Font.SourceSansBold -- Font chữ
textLabel.Parent = screenGui

-- Tạo âm thanh
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Volume = 1 -- Âm lượng
sound.Looped = false -- Không lặp tự động
sound.Parent = playerGui

-- Hàm phát âm thanh và lặp lại sau 1 giây khi kết thúc
local function playSoundWithDelay()
    sound:Play()
    sound.Ended:Wait() -- Đợi âm thanh kết thúc
    wait(1) -- Chờ 1 giây trước khi phát lại
    playSoundWithDelay() -- Gọi lại chính nó để lặp
end

-- Kích hoạt âm thanh lần đầu tiên
playSoundWithDelay()

-- Tạo một hàm để thêm Decal vào tất cả các mặt của mỗi Part
local function addDecalToPart(part)
    -- Kiểm tra xem Part có phải là BasePart không
    if part:IsA("BasePart") then
        -- Lặp qua tất cả 6 mặt của Part
        for _, face in pairs(Enum.NormalId:GetEnumItems()) do
            -- Tạo Decal cho mỗi mặt của Part
            local decal = Instance.new("Decal")
            decal.Texture = decalId
            decal.Face = face
            decal.Parent = part
        end
    end
end

-- Tìm tất cả các Part và Model trong Workspace và thêm Decal
local function addDecalToAllParts()
    -- Duyệt qua tất cả các đối tượng trong Workspace
    for _, obj in pairs(workspace:GetDescendants()) do
        -- Kiểm tra nếu đối tượng là một Model hoặc Part
        if obj:IsA("Model") then
            -- Duyệt qua tất cả các Part trong Model
            for _, part in pairs(obj:GetDescendants()) do
                addDecalToPart(part) -- Thêm Decal vào từng Part
            end
        elseif obj:IsA("BasePart") then
            addDecalToPart(obj) -- Thêm Decal vào Part nếu không phải trong Model
        end
    end
end

-- Gọi hàm để áp dụng Decal lên tất cả các Part trong Workspace
addDecalToAllParts()

-- Thêm Decal cho các đối tượng mới được tạo trong game
workspace.DescendantAdded:Connect(function(newObject)
    if newObject:IsA("BasePart") then
        addDecalToPart(newObject)
    elseif newObject:IsA("Model") then
        -- Nếu là Model, duyệt tất cả các Part trong Model
        for _, part in pairs(newObject:GetDescendants()) do
            if part:IsA("BasePart") then
                addDecalToPart(part)
            end
        end
    end
end)
