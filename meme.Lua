-- Khai báo ID của Decal và Image cho Skybox
local decalId = "rbxassetid://76302086268396" -- ID Decal
local skyImageId = "rbxassetid://13333189503" -- ID Skybox (Mặt trời, Mặt trăng)

-- Thay đổi Skybox của game
local skybox = game.Lighting:FindFirstChild("Sky")
if not skybox then
    skybox = Instance.new("Sky")
    skybox.Parent = game.Lighting
end

skybox.SkyboxBk = skyImageId
skybox.SkyboxDn = skyImageId
skybox.SkyboxFt = skyImageId
skybox.SkyboxLf = skyImageId
skybox.SkyboxRt = skyImageId
skybox.SkyboxUp = skyImageId

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

-- Cập nhật lại Skybox để luôn sử dụng hình ảnh đã chọn
game.Lighting:GetPropertyChangedSignal("Sky"):Connect(function()
    skybox.SkyboxBk = skyImageId
    skybox.SkyboxDn = skyImageId
    skybox.SkyboxFt = skyImageId
    skybox.SkyboxLf = skyImageId
    skybox.SkyboxRt = skyImageId
    skybox.SkyboxUp = skyImageId
end)
