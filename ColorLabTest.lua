--==================================================
--          ITACHI HUB | COLOR LAB V2
--             COLOR PICKER TEST
--==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("ColorLabTest")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "ColorLabTest"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local C = {
    Background = Color3.fromRGB(13, 13, 17),
    Panel = Color3.fromRGB(23, 23, 29),
    Card = Color3.fromRGB(34, 34, 42),
    Red = Color3.fromRGB(190, 25, 45),
    White = Color3.fromRGB(245, 245, 250),
    Gray = Color3.fromRGB(155, 155, 165)
}

local hue = 0
local saturation = 1
local brightness = 1
local selectedColor = Color3.fromRGB(255, 0, 0)

local function create(class, props, parent)
    local obj = Instance.new(class)

    for property, value in pairs(props) do
        obj[property] = value
    end

    obj.Parent = parent
    return obj
end

local function round(obj, radius)
    create("UICorner", {
        CornerRadius = UDim.new(0, radius)
    }, obj)
end

local function outline(obj, color, thickness)
    create("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        Transparency = 0.15
    }, obj)
end

local function toHex(color)
    return string.format(
        "#%02X%02X%02X",
        math.floor(color.R * 255),
        math.floor(color.G * 255),
        math.floor(color.B * 255)
    )
end

--==================================================
-- JANELA
--==================================================

local main = create("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(340, 420),
    Position = UDim2.new(0.5, -170, 0.5, -210),
    BackgroundColor3 = C.Background,
    BorderSizePixel = 0
}, gui)

round(main, 12)
outline(main, C.Red, 1.3)

-- CABEÇALHO

local header = create("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = C.Panel,
    BorderSizePixel = 0
}, main)

round(header, 12)

create("TextLabel", {
    Size = UDim2.new(1, -60, 1, 0),
    Position = UDim2.fromOffset(15, 0),
    BackgroundTransparency = 1,
    Text = "ITACHI  |  COLOR LAB",
    TextColor3 = C.White,
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, header)

local close = create("TextButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.new(1, -39, 0, 9),
    BackgroundColor3 = C.Card,
    Text = "×",
    TextColor3 = C.White,
    TextSize = 20,
    Font = Enum.Font.GothamBold
}, header)

round(close, 7)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--==================================================
-- PRÉVIA DA COR
--==================================================

create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 20),
    Position = UDim2.fromOffset(12, 57),
    BackgroundTransparency = 1,
    Text = "COR SELECIONADA",
    TextColor3 = C.Gray,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, main)

local preview = create("Frame", {
    Size = UDim2.new(1, -24, 0, 48),
    Position = UDim2.fromOffset(12, 80),
    BackgroundColor3 = selectedColor,
    BorderSizePixel = 0
}, main)

round(preview, 8)

local hexText = create("TextLabel", {
    Size = UDim2.new(1, -15, 1, 0),
    Position = UDim2.fromOffset(10, 0),
    BackgroundTransparency = 1,
    Text = "#FF0000",
    TextColor3 = C.White,
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, preview)

--==================================================
-- QUADRADO DE CORES
--==================================================

create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 20),
    Position = UDim2.fromOffset(12, 139),
    BackgroundTransparency = 1,
    Text = "ESCOLHA SUA COR",
    TextColor3 = C.Gray,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, main)

local square = create("Frame", {
    Size = UDim2.new(1, -24, 0, 165),
    Position = UDim2.fromOffset(12, 162),
    BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
    BorderSizePixel = 0,
    ClipsDescendants = true
}, main)

round(square, 8)

-- CAMADA BRANCA

local whiteLayer = create("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(1, 1, 1),
    BorderSizePixel = 0,
    ZIndex = 2
}, square)

create("UIGradient", {
    Rotation = 0,
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
}, whiteLayer)

-- CAMADA PRETA

local blackLayer = create("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BorderSizePixel = 0,
    ZIndex = 3
}, square)

create("UIGradient", {
    Rotation = 90,
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0)
    })
}, blackLayer)

-- MARCADOR

local marker = create("Frame", {
    Size = UDim2.fromOffset(17, 17),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(1, 0, 0, 0),
    BackgroundColor3 = Color3.new(1, 1, 1),
    BorderSizePixel = 0,
    ZIndex = 6
}, square)

round(marker, 20)
outline(marker, Color3.new(0, 0, 0), 2)

-- ÁREA DE TOQUE DO QUADRADO

local squareTouch = create("TextButton", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "",
    AutoButtonColor = false,
    ZIndex = 5
}, square)

--==================================================
-- BARRA DE MATIZ
--==================================================

create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 18),
    Position = UDim2.fromOffset(12, 335),
    BackgroundTransparency = 1,
    Text = "MATIZ",
    TextColor3 = C.Gray,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, main)

local hueBar = create("Frame", {
    Size = UDim2.new(1, -24, 0, 17),
    Position = UDim2.fromOffset(12, 355),
    BackgroundColor3 = Color3.new(1, 1, 1),
    BorderSizePixel = 0
}, main)

round(hueBar, 8)

create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    })
}, hueBar)

local hueMarker = create("Frame", {
    Size = UDim2.fromOffset(6, 23),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0, 0, 0.5, 0),
    BackgroundColor3 = C.White,
    BorderSizePixel = 0,
    ZIndex = 3
}, hueBar)

round(hueMarker, 3)
outline(hueMarker, Color3.new(0, 0, 0), 1)

local hueTouch = create("TextButton", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "",
    AutoButtonColor = false,
    ZIndex = 5
}, hueBar)

--==================================================
-- VALORES RGB
--==================================================

local rgbText = create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 18),
    Position = UDim2.fromOffset(12, 383),
    BackgroundTransparency = 1,
    Text = "RGB: 255, 0, 0",
    TextColor3 = C.Gray,
    TextSize = 10,
    Font = Enum.Font.GothamMedium,
    TextXAlignment = Enum.TextXAlignment.Left
}, main)

--==================================================
-- ATUALIZAÇÃO
--==================================================

local function updateColor()
    selectedColor = Color3.fromHSV(
        hue,
        saturation,
        brightness
    )

    square.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)

    preview.BackgroundColor3 = selectedColor
    hexText.Text = toHex(selectedColor)

    rgbText.Text = string.format(
        "RGB: %d, %d, %d",
        math.floor(selectedColor.R * 255),
        math.floor(selectedColor.G * 255),
        math.floor(selectedColor.B * 255)
    )

    marker.Position = UDim2.new(
        saturation, 0,
        1 - brightness, 0
    )

    hueMarker.Position = UDim2.new(
        hue, 0, 0.5, 0
    )
end

local function updateSquare(position)
    local pos = square.AbsolutePosition
    local size = square.AbsoluteSize

    saturation = math.clamp(
        (position.X - pos.X) / size.X, 0, 1
    )

    brightness = 1 - math.clamp(
        (position.Y - pos.Y) / size.Y, 0, 1
    )

    updateColor()
end

local function updateHue(position)
    local pos = hueBar.AbsolutePosition
    local size = hueBar.AbsoluteSize

    hue = math.clamp(
        (position.X - pos.X) / size.X, 0, 1
    )

    updateColor()
end

--==================================================
-- CONTROLE POR TOQUE E MOUSE
--==================================================

local activePicker = nil

squareTouch.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        activePicker = "Square"
        updateSquare(input.Position)
    end
end)

hueTouch.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        activePicker = "Hue"
        updateHue(input.Position)
    end
end)

UIS.InputChanged:Connect(function(input)
    if not activePicker then return end

    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseMovement then

        if activePicker == "Square" then
            updateSquare(input.Position)

        elseif activePicker == "Hue" then
            updateHue(input.Position)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        activePicker = nil
    end
end)

updateColor()

print("ITACHI COLOR LAB V2 carregado!")
