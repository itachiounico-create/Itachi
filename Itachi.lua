--==================================================
--             I T A C H I  H U B
--       VISUAL V1.6.2 | PERSONAGEM
--==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local VERSION = "1.0.0"

local old = playerGui:FindFirstChild("ItachiHub")
if old then old:Destroy() end

local C = {
    Background = Color3.fromRGB(10, 10, 13),
    Panel = Color3.fromRGB(15, 15, 19),
    Card = Color3.fromRGB(25, 25, 30),
    Red = Color3.fromRGB(125, 20, 38),
    BrightRed = Color3.fromRGB(255, 10, 30),
    White = Color3.fromRGB(255, 255, 255),
    Gray = Color3.fromRGB(170, 170, 180),
    Green = Color3.fromRGB(70, 220, 120),
    Border = Color3.fromRGB(120, 45, 55)
}

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "ItachiHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 50
gui.Parent = playerGui

--==================================================
-- FUNÇÕES
--==================================================

local function Round(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

local function Border(obj, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = C.Border
    stroke.Thickness = 1
    stroke.Transparency = transparency or 0.75
    stroke.Parent = obj
    return stroke
end

local function Label(parent, text, size, pos, font, color)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = size
    label.Position = pos
    label.Text = text
    label.Font = font or Enum.Font.Gotham
    label.TextColor3 = color or C.White
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    return label
end

local function Button(parent, text, size, pos)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = pos
    button.BackgroundColor3 = C.Card
    button.BackgroundTransparency = 0.82
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = C.White
    button.TextSize = 12
    button.Font = Enum.Font.GothamMedium
    button.AutoButtonColor = false
    button.Parent = parent

    Round(button, 7)
    Border(button, 0.8)

    return button
end

--==================================================
-- SHARINGAN
--==================================================

local openButton = Instance.new("ImageButton")
openButton.Name = "SharinganButton"
openButton.Size = UDim2.fromOffset(42, 42)
openButton.Position = UDim2.new(0, 18, 0.5, -21)
openButton.BackgroundColor3 = C.Background
openButton.BackgroundTransparency = 0.08
openButton.BorderSizePixel = 0
openButton.Image = "rbxassetid://6842461300"
openButton.ScaleType = Enum.ScaleType.Fit
openButton.AutoButtonColor = false
openButton.Active = true
openButton.Parent = gui

Round(openButton, 50)

local buttonStroke = Border(openButton, 0.2)
buttonStroke.Color = C.BrightRed
buttonStroke.Thickness = 1.2

--==================================================
-- MENU PRINCIPAL
--==================================================

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(520, 340)
main.Position = UDim2.new(0.5, -260, 0.5, -170)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Visible = false
main.Active = true
main.Parent = gui

Round(main, 14)

-- IMAGEM DE FUNDO

local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Name = "ItachiBackground"
backgroundImage.Size = UDim2.fromScale(1, 1)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = "rbxassetid://8705389469"
backgroundImage.ScaleType = Enum.ScaleType.Crop
backgroundImage.ZIndex = 0
backgroundImage.Parent = main

Round(backgroundImage, 14)

-- SOBREPOSIÇÃO ESCURA

local overlay = Instance.new("Frame")
overlay.Name = "DarkOverlay"
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = C.Background
overlay.BackgroundTransparency = 0.58
overlay.BorderSizePixel = 0
overlay.ZIndex = 1
overlay.Parent = main

Round(overlay, 14)

--==================================================
-- BORDA VERMELHA GIRATÓRIA
--==================================================

local glowStroke = Instance.new("UIStroke")
glowStroke.Name = "RedGlow"
glowStroke.Thickness = 4
glowStroke.Transparency = 0.05
glowStroke.Color = C.BrightRed
glowStroke.Parent = main

local glowGradient = Instance.new("UIGradient")
glowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 0, 10)),
    ColorSequenceKeypoint.new(0.25, C.BrightRed),
    ColorSequenceKeypoint.new(0.42, Color3.fromRGB(255, 130, 140)),
    ColorSequenceKeypoint.new(0.55, C.BrightRed),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 0, 10))
})
glowGradient.Parent = glowStroke

TweenService:Create(
    glowGradient,
    TweenInfo.new(2.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
):Play()

local innerStroke = Instance.new("UIStroke")
innerStroke.Thickness = 1
innerStroke.Color = C.Border
innerStroke.Transparency = 0.55
innerStroke.Parent = main

--==================================================
-- NOME BRILHANTE
--==================================================

local titleText = "Ｉ Ｔ Ａ Ｃ Ｈ Ｉ  Ｈ Ｕ Ｂ"

local titleGlow = Label(
    main,
    titleText,
    UDim2.new(1, -75, 0, 30),
    UDim2.fromOffset(15, 8),
    Enum.Font.GothamBold,
    C.White
)
titleGlow.ZIndex = 2
titleGlow.TextSize = 17
titleGlow.TextTransparency = 0.05
titleGlow.TextStrokeColor3 = C.White
titleGlow.TextStrokeTransparency = 0

local title = Label(
    main,
    titleText,
    UDim2.new(1, -75, 0, 30),
    UDim2.fromOffset(15, 8),
    Enum.Font.GothamBold,
    C.White
)
title.ZIndex = 3
title.TextSize = 17
title.TextStrokeColor3 = C.White
title.TextStrokeTransparency = 0.25

local subtitle = Label(
    main,
    "I T A C H I",
    UDim2.new(1, -70, 0, 16),
    UDim2.fromOffset(16, 36),
    Enum.Font.Gotham,
    C.Gray
)
subtitle.ZIndex = 3
subtitle.TextSize = 9

--==================================================
-- ÁREA DE ARRASTO DO MENU
--==================================================

local dragHandle = Instance.new("TextButton")
dragHandle.Name = "DragHandle"
dragHandle.Size = UDim2.new(1, -55, 0, 58)
dragHandle.Position = UDim2.fromOffset(0, 0)
dragHandle.BackgroundTransparency = 1
dragHandle.Text = ""
dragHandle.AutoButtonColor = false
dragHandle.Active = true
dragHandle.ZIndex = 10
dragHandle.Parent = main

--==================================================
-- FECHAR
--==================================================

local close = Button(
    main,
    "×",
    UDim2.fromOffset(29, 29),
    UDim2.new(1, -42, 0, 9)
)
close.ZIndex = 11
close.TextSize = 21

--==================================================
-- DIVISOR
--==================================================

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -24, 0, 1)
divider.Position = UDim2.fromOffset(12, 59)
divider.BackgroundColor3 = C.White
divider.BackgroundTransparency = 0.82
divider.BorderSizePixel = 0
divider.ZIndex = 3
divider.Parent = main

--==================================================
-- LATERAL DE PÁGINAS
--==================================================

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.fromOffset(105, 263)
sidebar.Position = UDim2.fromOffset(10, 67)
sidebar.BackgroundColor3 = C.Panel
sidebar.BackgroundTransparency = 0.72
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 3
sidebar.Parent = main

Round(sidebar, 9)
Border(sidebar, 0.8)

local navTitle = Label(
    sidebar,
    "PÁGINAS",
    UDim2.new(1, -16, 0, 20),
    UDim2.fromOffset(9, 7),
    Enum.Font.GothamBold,
    C.Gray
)
navTitle.ZIndex = 4
navTitle.TextSize = 10

local homeButton = Button(
    sidebar,
    "⌂  Início",
    UDim2.new(1, -12, 0, 25),
    UDim2.fromOffset(6, 32)
)
homeButton.ZIndex = 4

local aimButton = Button(
    sidebar,
    "◉  Aimbot",
    UDim2.new(1, -12, 0, 25),
    UDim2.fromOffset(6, 63)
)
aimButton.ZIndex = 4

--==================================================
-- ÁREA DE CONTEÚDO
--==================================================

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.fromOffset(398, 263)
content.Position = UDim2.fromOffset(121, 67)
content.BackgroundColor3 = C.Panel
content.BackgroundTransparency = 0.72
content.BorderSizePixel = 0
content.ClipsDescendants = true
content.ZIndex = 3
content.Parent = main

Round(content, 9)
Border(content, 0.8)

--==================================================
-- PÁGINAS
--==================================================

local pages = {}

local function CreatePage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 4
    page.Parent = content

    pages[name] = page
    return page
end

--==================================================
-- INÍCIO
--==================================================

local home = CreatePage("Inicio")

local homeTitle = Label(
    home,
    "INÍCIO",
    UDim2.new(1, -20, 0, 25),
    UDim2.fromOffset(12, 9),
    Enum.Font.GothamBold,
    C.White
)
homeTitle.ZIndex = 5
homeTitle.TextSize = 15

-- CARTÃO DO JOGADOR

local profileCard = Instance.new("Frame")
profileCard.Name = "PlayerProfile"
profileCard.Size = UDim2.new(1, -24, 0, 91)
profileCard.Position = UDim2.fromOffset(12, 40)
profileCard.BackgroundColor3 = C.Card
profileCard.BackgroundTransparency = 0.88
profileCard.BorderSizePixel = 0
profileCard.ZIndex = 5
profileCard.Parent = home

Round(profileCard, 9)
Border(profileCard, 0.65)

local avatar = Instance.new("ImageLabel")
avatar.Name = "PlayerAvatar"
avatar.Size = UDim2.fromOffset(65, 65)
avatar.Position = UDim2.fromOffset(12, 13)
avatar.BackgroundColor3 = C.Background
avatar.BorderSizePixel = 0
avatar.Image = ""
avatar.ZIndex = 6
avatar.Parent = profileCard

Round(avatar, 8)
Border(avatar, 0.5)

local playerName = Label(
    profileCard,
    player.DisplayName,
    UDim2.new(1, -105, 0, 23),
    UDim2.fromOffset(88, 13),
    Enum.Font.GothamBold,
    C.White
)
playerName.ZIndex = 6
playerName.TextSize = 15
playerName.TextTruncate = Enum.TextTruncate.AtEnd

local username = Label(
    profileCard,
    "@" .. player.Name,
    UDim2.new(1, -105, 0, 18),
    UDim2.fromOffset(88, 36),
    Enum.Font.Gotham,
    C.Gray
)
username.ZIndex = 6
username.TextSize = 11
username.TextTruncate = Enum.TextTruncate.AtEnd

local onlineDot = Instance.new("Frame")
onlineDot.Name = "OnlineIndicator"
onlineDot.Size = UDim2.fromOffset(8, 8)
onlineDot.Position = UDim2.fromOffset(89, 65)
onlineDot.BackgroundColor3 = C.Green
onlineDot.BorderSizePixel = 0
onlineDot.ZIndex = 6
onlineDot.Parent = profileCard

Round(onlineDot, 50)

local onlineText = Label(
    profileCard,
    "ONLINE",
    UDim2.fromOffset(75, 16),
    UDim2.fromOffset(102, 61),
    Enum.Font.GothamBold,
    C.Green
)
onlineText.ZIndex = 6
onlineText.TextSize = 10

local connectedText = Label(
    profileCard,
    "CONECTADO AO SERVIDOR",
    UDim2.new(1, -105, 0, 13),
    UDim2.fromOffset(88, 77),
    Enum.Font.Gotham,
    C.Gray
)
connectedText.ZIndex = 6
connectedText.TextSize = 8

-- CARDS DE INFORMAÇÃO

local function CreateInfoCard(name, titleText, valueText, position)
    local card = Instance.new("Frame")
    card.Name = name
    card.Size = UDim2.new(0.5, -18, 0, 94)
    card.Position = position
    card.BackgroundColor3 = C.Card
    card.BackgroundTransparency = 0.88
    card.BorderSizePixel = 0
    card.ZIndex = 5
    card.Parent = home

    Round(card, 9)
    Border(card, 0.65)

    local heading = Label(
        card,
        titleText,
        UDim2.new(1, -16, 0, 20),
        UDim2.fromOffset(10, 10),
        Enum.Font.GothamBold,
        C.Gray
    )
    heading.ZIndex = 6
    heading.TextSize = 10

    local value = Label(
        card,
        valueText,
        UDim2.new(1, -16, 0, 32),
        UDim2.fromOffset(10, 38),
        Enum.Font.GothamBold,
        C.White
    )
    value.ZIndex = 6
    value.TextSize = 21

    return value
end

local playerCount = CreateInfoCard(
    "PlayersCard",
    "JOGADORES NO SERVIDOR",
    tostring(#Players:GetPlayers()),
    UDim2.fromOffset(12, 143)
)

local versionLabel = CreateInfoCard(
    "VersionCard",
    "VERSÃO DO MENU",
    VERSION,
    UDim2.new(0.5, 6, 0, 143)
)

-- AVATAR

task.spawn(function()
    local success, image = pcall(function()
        return Players:GetUserThumbnailAsync(
            player.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size150x150
        )
    end)

    if success and image then
        avatar.Image = image
    end
end)

-- CONTADOR AUTOMÁTICO

local function UpdatePlayerCount()
    playerCount.Text = tostring(#Players:GetPlayers())
end

Players.PlayerAdded:Connect(UpdatePlayerCount)
Players.PlayerRemoving:Connect(UpdatePlayerCount)


--==================================================
-- AIMBOT | INTERFACE V1
--==================================================

local aimbot = CreatePage("Aimbot")

local aimTitle = Label(
    aimbot, "AIMBOT",
    UDim2.new(1, -20, 0, 25),
    UDim2.fromOffset(10, 8),
    Enum.Font.GothamBold, C.White
)
aimTitle.ZIndex = 5
aimTitle.TextSize = 14

-- ÁREA DAS OPÇÕES
local optionsArea = Instance.new("Frame")
optionsArea.Name = "OptionsArea"
optionsArea.Size = UDim2.new(1, -132, 1, -43)
optionsArea.Position = UDim2.fromOffset(8, 36)
optionsArea.BackgroundColor3 = C.Card
optionsArea.BackgroundTransparency = 0.88
optionsArea.BorderSizePixel = 0
optionsArea.ZIndex = 5
optionsArea.Parent = aimbot
Round(optionsArea, 8)
Border(optionsArea, 0.85)

local optionsTitle = Label(
    optionsArea, "OPÇÕES",
    UDim2.new(1, -12, 0, 22),
    UDim2.fromOffset(8, 4),
    Enum.Font.GothamBold, C.Gray
)
optionsTitle.ZIndex = 7
optionsTitle.TextSize = 10

local scroll = Instance.new("ScrollingFrame")
scroll.Name = "OptionsScroll"
scroll.Size = UDim2.new(1, -8, 1, -30)
scroll.Position = UDim2.fromOffset(4, 27)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 2
scroll.ScrollBarImageColor3 = C.BrightRed
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ZIndex = 6
scroll.Parent = optionsArea

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 5)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Parent = scroll

local function Section(name)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -5, 0, 23)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = C.BrightRed
    label.TextSize = 11
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 7
    label.Parent = scroll
    return label
end


local function Toggle(name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -5, 0, 29)
    button.BackgroundColor3 = C.Card
    button.BackgroundTransparency = 0.55
    button.BorderSizePixel = 0
    button.Text = name .. "     [ OFF ]"
    button.TextColor3 = C.White
    button.TextSize = 10
    button.Font = Enum.Font.GothamMedium
    button.ZIndex = 7
    button.Parent = scroll
    Round(button, 6)
    Border(button, 0.85)

    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled

        button.Text = name .. (enabled and "     [ ON ]" or "     [ OFF ]")
        button.BackgroundColor3 = enabled and C.Red or C.Card

        if callback then
            callback(enabled)
        end
    end)

    return {
        Button = button,

        SetVisible = function(value)
            button.Visible = value
        end,

        Get = function()
            return enabled
        end
    }
end


local function Slider(name, minValue, maxValue, defaultValue, onChanged)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, -5, 0, 43)
    holder.BackgroundColor3 = C.Card
    holder.BackgroundTransparency = 0.65
    holder.BorderSizePixel = 0
    holder.ZIndex = 7
    holder.Parent = scroll
    Round(holder, 6)

    local value = defaultValue

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -12, 0, 17)
    label.Position = UDim2.fromOffset(6, 2)
    label.BackgroundTransparency = 1
    label.TextColor3 = C.White
    label.TextSize = 9
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 8
    label.Parent = holder

    local bar = Instance.new("TextButton")
    bar.Size = UDim2.new(1, -14, 0, 8)
    bar.Position = UDim2.fromOffset(7, 27)
    bar.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
    bar.BorderSizePixel = 0
    bar.Text = ""
    bar.AutoButtonColor = false
    bar.ZIndex = 8
    bar.Parent = holder
    Round(bar, 5)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = C.BrightRed
    fill.BorderSizePixel = 0
    fill.ZIndex = 9
    fill.Parent = bar
    Round(fill, 5)

    local dragging = false

    local function Update(inputX)
        local width = bar.AbsoluteSize.X
        local start = bar.AbsolutePosition.X
        local percent = math.clamp((inputX - start) / width, 0, 1)

        value = math.floor(minValue + (maxValue - minValue) * percent)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        label.Text = name .. ": " .. value
    end
    if onChanged then
    onChanged(value)
    end

    label.Text = name .. ": " .. value
    fill.Size = UDim2.new(
        (value - minValue) / (maxValue - minValue), 0, 1, 0
    )

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            Update(input.Position.X)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then
            Update(input.Position.X)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return {
        Holder = holder,
        Get = function() return value end,
        SetVisible = function(v) holder.Visible = v end
    }
end

local function Choice(name, choices)
    local index = 1

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -5, 0, 29)
    button.BackgroundColor3 = C.Card
    button.BackgroundTransparency = 0.55
    button.BorderSizePixel = 0
    button.TextColor3 = C.White
    button.TextSize = 10
    button.Font = Enum.Font.Gotham
    button.ZIndex = 7
    button.Parent = scroll
    Round(button, 6)
    Border(button, 0.85)

    local function Update()
        button.Text = name .. ": " .. choices[index]
    end

    button.MouseButton1Click:Connect(function()
        index = index % #choices + 1
        Update()
    end)

    Update()

    return {
        Holder = button,
        SetVisible = function(v) button.Visible = v end
    }
end

local paletteColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(180, 0, 255),
    Color3.fromRGB(0, 170, 255),
    Color3.fromRGB(0, 255, 120),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 180, 0)
}


--==================================================
-- COLOR LAB | PALETA HSV
--==================================================

local function Palette(name)
    local selectedColor = Color3.fromRGB(255, 0, 0)

    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, -5, 0, 35)
    holder.BackgroundColor3 = C.Card
    holder.BackgroundTransparency = 0.55
    holder.BorderSizePixel = 0
    holder.ZIndex = 7
    holder.Parent = scroll
    Round(holder, 6)
    Border(holder, 0.85)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -65, 1, 0)
    label.Position = UDim2.fromOffset(9, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = C.White
    label.TextSize = 10
    label.Font = Enum.Font.GothamMedium
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 8
    label.Parent = holder

    local swatch = Instance.new("TextButton")
    swatch.Size = UDim2.fromOffset(38, 25)
    swatch.Position = UDim2.new(1, -47, 0.5, -12)
    swatch.BackgroundColor3 = selectedColor
    swatch.Text = ""
    swatch.BorderSizePixel = 0
    swatch.ZIndex = 9
    swatch.Parent = holder
    Round(swatch, 5)
    Border(swatch, 0.3)

    local function OpenPicker()
        local oldPicker = main:FindFirstChild("ColorPicker")
        if oldPicker then
            oldPicker:Destroy()
        end

        local h, s, v = selectedColor:ToHSV()
        local dragging = nil
        local activeInput = nil

        local popup = Instance.new("Frame")
        popup.Name = "ColorPicker"
        popup.Size = UDim2.fromOffset(310, 270)
        popup.Position = UDim2.new(0.5, -155, 0.5, -135)
        popup.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        popup.BorderSizePixel = 0
        popup.ZIndex = 20
        popup.Parent = main
        Round(popup, 9)
        Border(popup, 0.15)

        local heading = Instance.new("TextLabel")
        heading.Size = UDim2.new(1, -20, 0, 25)
        heading.Position = UDim2.fromOffset(10, 5)
        heading.BackgroundTransparency = 1
        heading.Text = "ESCOLHER COR"
        heading.TextColor3 = C.White
        heading.TextSize = 12
        heading.Font = Enum.Font.GothamBold
        heading.TextXAlignment = Enum.TextXAlignment.Left
        heading.ZIndex = 21
        heading.Parent = popup

        -- QUADRADO HSV

        local square = Instance.new("Frame")
        square.Size = UDim2.fromOffset(274, 125)
        square.Position = UDim2.fromOffset(18, 35)
        square.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
        square.BorderSizePixel = 0
        square.ClipsDescendants = true
        square.ZIndex = 21
        square.Parent = popup
        Round(square, 5)

        local white = Instance.new("Frame")
        white.Size = UDim2.fromScale(1, 1)
        white.BackgroundColor3 = Color3.new(1, 1, 1)
        white.BorderSizePixel = 0
        white.ZIndex = 22
        white.Parent = square

        local wg = Instance.new("UIGradient")
        wg.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1)
        })
        wg.Parent = white

        local black = Instance.new("Frame")
        black.Size = UDim2.fromScale(1, 1)
        black.BackgroundColor3 = Color3.new(0, 0, 0)
        black.BorderSizePixel = 0
        black.ZIndex = 23
        black.Parent = square

        local bg = Instance.new("UIGradient")
        bg.Rotation = 90
        bg.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0)
        })
        bg.Parent = black

        local squareButton = Instance.new("TextButton")
        squareButton.Size = UDim2.fromScale(1, 1)
        squareButton.BackgroundTransparency = 1
        squareButton.Text = ""
        squareButton.ZIndex = 24
        squareButton.Parent = square

        local marker = Instance.new("Frame")
        marker.Size = UDim2.fromOffset(14, 14)
        marker.AnchorPoint = Vector2.new(0.5, 0.5)
        marker.BackgroundTransparency = 1
        marker.ZIndex = 25
        marker.Parent = square
        Round(marker, 20)

        local markerBorder = Instance.new("UIStroke")
        markerBorder.Color = Color3.new(1, 1, 1)
        markerBorder.Thickness = 2
        markerBorder.Parent = marker

        -- BARRA DE MATIZ

        local hueBar = Instance.new("Frame")
        hueBar.Size = UDim2.fromOffset(274, 16)
        hueBar.Position = UDim2.fromOffset(18, 170)
        hueBar.BackgroundColor3 = Color3.new(1, 1, 1)
        hueBar.BorderSizePixel = 0
        hueBar.ZIndex = 21
        hueBar.Parent = popup
        Round(hueBar, 5)

        local hueGradient = Instance.new("UIGradient")
        hueGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
        })
        hueGradient.Parent = hueBar

        local hueButton = Instance.new("TextButton")
        hueButton.Size = UDim2.fromScale(1, 1)
        hueButton.BackgroundTransparency = 1
        hueButton.Text = ""
        hueButton.ZIndex = 23
        hueButton.Parent = hueBar

        local hueMarker = Instance.new("Frame")
        hueMarker.Size = UDim2.fromOffset(5, 22)
        hueMarker.AnchorPoint = Vector2.new(0.5, 0.5)
        hueMarker.BackgroundColor3 = C.White
        hueMarker.BorderSizePixel = 0
        hueMarker.ZIndex = 24
        hueMarker.Parent = hueBar
        Round(hueMarker, 3)

        -- PRÉVIA

        local preview = Instance.new("Frame")
        preview.Size = UDim2.fromOffset(25, 25)
        preview.Position = UDim2.fromOffset(18, 195)
        preview.BorderSizePixel = 0
        preview.ZIndex = 21
        preview.Parent = popup
        Round(preview, 5)

        local hex = Instance.new("TextLabel")
        hex.Size = UDim2.fromOffset(120, 25)
        hex.Position = UDim2.fromOffset(52, 195)
        hex.BackgroundTransparency = 1
        hex.TextColor3 = C.White
        hex.TextSize = 11
        hex.Font = Enum.Font.GothamMedium
        hex.TextXAlignment = Enum.TextXAlignment.Left
        hex.ZIndex = 21
        hex.Parent = popup

        -- BOTÕES

        local cancel = Button(
            popup,
            "CANCELAR",
            UDim2.fromOffset(125, 27),
            UDim2.fromOffset(18, 232)
        )
        cancel.ZIndex = 22

        local confirm = Button(
            popup,
            "CONFIRMAR",
            UDim2.fromOffset(125, 27),
            UDim2.fromOffset(167, 232)
        )
        confirm.ZIndex = 22
        confirm.BackgroundColor3 = C.Red

        -- ATUALIZAÇÃO

        local function Update()
            local color = Color3.fromHSV(h, s, v)

            square.BackgroundColor3 = Color3.fromHSV(h, 1, 1)

            marker.Position = UDim2.new(s, 0, 1 - v, 0)
            hueMarker.Position = UDim2.new(h, 0, 0.5, 0)

            preview.BackgroundColor3 = color

            hex.Text = string.format(
                "#%02X%02X%02X",
                math.floor(color.R * 255),
                math.floor(color.G * 255),
                math.floor(color.B * 255)
            )
        end

        local function UpdateSquare(position)
            s = math.clamp(
                (position.X - square.AbsolutePosition.X)
                / square.AbsoluteSize.X, 0, 1
            )

            v = 1 - math.clamp(
                (position.Y - square.AbsolutePosition.Y)
                / square.AbsoluteSize.Y, 0, 1
            )

            Update()
        end

        local function UpdateHue(position)
            h = math.clamp(
                (position.X - hueBar.AbsolutePosition.X)
                / hueBar.AbsoluteSize.X, 0, 1
            )

            Update()
        end

        squareButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = "Square"
                activeInput = input
                UpdateSquare(input.Position)
            end
        end)

        hueButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = "Hue"
                activeInput = input
                UpdateHue(input.Position)
            end
        end)

        local changedConnection
        local endedConnection

        changedConnection = UIS.InputChanged:Connect(function(input)
            if not dragging then return end

            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if dragging == "Square" then
                    UpdateSquare(input.Position)
                else
                    UpdateHue(input.Position)
                end
            elseif input.UserInputType == Enum.UserInputType.Touch
            and input == activeInput then
                if dragging == "Square" then
                    UpdateSquare(input.Position)
                else
                    UpdateHue(input.Position)
                end
            end
        end)

        endedConnection = UIS.InputEnded:Connect(function(input)
            if input == activeInput
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = nil
                activeInput = nil
            end
        end)

        local function Close()
            changedConnection:Disconnect()
            endedConnection:Disconnect()
            popup:Destroy()
        end

        cancel.Activated:Connect(function()
            Close()
        end)

        confirm.Activated:Connect(function()
            selectedColor = Color3.fromHSV(h, s, v)
            swatch.BackgroundColor3 = selectedColor
            Close()
        end)

        Update()
    end

    swatch.Activated:Connect(OpenPicker)

    return {
        Holder = holder,

        Get = function()
            return selectedColor
        end,

        Set = function(color)
            selectedColor = color
            swatch.BackgroundColor3 = color
        end
    }
end


--==================================================
-- AIMBOTS
--==================================================

Section("AIMBOTS")

-- AIMBOT NORMAL
local aimForce, aimFov, aimFovSize

local mainAim = Toggle("Aimbot", function(active)
    aimForce.SetVisible(active)
    aimFov.SetVisible(active)
    aimFovSize.SetVisible(active and aimFov.Get())
end)

aimForce = Slider("Força do Aimbot", 1, 100, 50)

aimFov = Toggle("FOV Aimbot", function(active)
    aimFovSize.SetVisible(mainAim.Get() and active)
end)

aimFovSize = Slider("Tamanho do FOV", 1, 500, 100)

aimForce.SetVisible(false)
aimFov.SetVisible(false)
aimFovSize.SetVisible(false)

-- LEGIT AIM
local legitFov, legitSize

local legitAim = Toggle("Legit Aim", function(active)
    legitFov.SetVisible(active)
    legitSize.SetVisible(active and legitFov.Get())
end)

legitFov = Toggle("FOV Legit Aim", function(active)
    legitSize.SetVisible(legitAim.Get() and active)
end)

legitSize = Slider("Tamanho FOV Legit", 1, 500, 100)

legitFov.SetVisible(false)
legitSize.SetVisible(false)

-- HARD LOCK
local hardFov, hardSize

local hardLock = Toggle("Hard Lock", function(active)
    hardFov.SetVisible(active)
    hardSize.SetVisible(active and hardFov.Get())
end)

hardFov = Toggle("FOV Hard Lock", function(active)
    hardSize.SetVisible(hardLock.Get() and active)
end)

hardSize = Slider("Tamanho FOV Hard Lock", 1, 500, 100)

hardFov.SetVisible(false)
hardSize.SetVisible(false)

-- HITBOX AIM
local hitbox

local hitboxAim = Toggle("Hitbox Aim", function(active)
    hitbox.SetVisible(active)
end)

hitbox = Choice("Parte do corpo", {
    "Cabeça", "Peito", "Pernas"
})

hitbox.SetVisible(false)


--==================================================
-- OPÇÕES EXTRAS
--==================================================

Section("OPÇÕES EXTRAS")

local edgeSize, edgeThickness

local edge = Toggle("Edge Indicator", function(active)
    edgeSize.SetVisible(active)
    edgeThickness.SetVisible(active)
end)

edgeSize = Slider("Tamanho do círculo das setas", 1, 500, 150)
edgeThickness = Slider("Espessura das setas", 1, 10, 2)

edgeSize.SetVisible(false)
edgeThickness.SetVisible(false)

-- LOCK-LINE
local lineFov, lineSize

local lockLine = Toggle("Lock-Line", function(active)
    lineFov.SetVisible(active)
    lineSize.SetVisible(active and lineFov.Get())

    if _G.ItachiLockLine then
        _G.ItachiLockLine.SetEnabled(active)
    end
end)

lineFov = Toggle("FOV", function(active)
    lineSize.SetVisible(lockLine.Get() and active)

    if _G.ItachiLockLine then
        _G.ItachiLockLine.SetFOVVisible(active)
    end
end)

lineSize = Slider("Tamanho FOV", 50, 600, 200, function(value)
    if _G.ItachiLockLine then
        _G.ItachiLockLine.SetFOVSize(value)
    end
end)

lineSize.SetVisible(false)
lineFov.SetVisible(false)

-- Valor inicial
if _G.ItachiLockLine then
    _G.ItachiLockLine.SetFOVSize(lineSize.Get())
end


--==================================================
-- CORES
--==================================================

Section("CORES")

local fovColor = Palette("Cor do FOV")
local lineColor = Palette("Cor do Lock-Line")
local edgeColor = Palette("Cor das Setas")
--==================================================
-- FOV VISUAL
--==================================================

local function CreateFOV(name)
    local circle = Instance.new("Frame")
    circle.Name = name
    circle.AnchorPoint = Vector2.new(0.5, 0.5)
    circle.Position = UDim2.fromScale(0.5, 0.5)
    circle.Size = UDim2.fromOffset(100, 100)
    circle.BackgroundTransparency = 1
    circle.BorderSizePixel = 0
    circle.Visible = false
    circle.ZIndex = 100
    circle.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = circle

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Color = Color3.new(1, 0, 0)
    stroke.Parent = circle

    return {
        Frame = circle,
        Stroke = stroke
    }
end

local normalCircle = CreateFOV("NormalFOV")
local legitCircle = CreateFOV("LegitFOV")
local hardCircle = CreateFOV("HardFOV")

local function UpdateCircle(circle, enabled, size, color)
    circle.Frame.Visible = enabled

    if enabled then
        circle.Frame.Size = UDim2.fromOffset(size, size)
        circle.Stroke.Color = color
    end
end

RunService.RenderStepped:Connect(function()

    UpdateCircle(
        normalCircle,
        mainAim.Get() and aimFov.Get(),
        aimFovSize.Get(),
        fovColor.Get()
    )

    UpdateCircle(
        legitCircle,
        legitAim.Get() and legitFov.Get(),
        legitSize.Get(),
        fovColor.Get()
    )

    UpdateCircle(
        hardCircle,
        hardLock.Get() and hardFov.Get(),
        hardSize.Get(),
        fovColor.Get()
    )

end)
--==================================================
-- PERSONAGEM | PRÉVIA
--==================================================

local previewArea = Instance.new("Frame")
previewArea.Name = "CharacterPreview"
previewArea.Size = UDim2.new(0, 112, 1, -43)
previewArea.Position = UDim2.new(1, -120, 0, 36)
previewArea.BackgroundColor3 = C.Card
previewArea.BackgroundTransparency = 0.88
previewArea.BorderSizePixel = 0
previewArea.ClipsDescendants = true
previewArea.ZIndex = 5
previewArea.Parent = aimbot

Round(previewArea, 8)
local previewBorder = Border(previewArea, 0.65)
previewBorder.Thickness = 0.8

local previewTitle = Label(
    previewArea, "PERSONAGEM",
    UDim2.new(1, -8, 0, 22),
    UDim2.fromOffset(4, 5),
    Enum.Font.GothamBold, C.Gray
)
previewTitle.ZIndex = 7
previewTitle.TextSize = 9
previewTitle.TextXAlignment = Enum.TextXAlignment.Center

local characterImage = Instance.new("ImageLabel")
characterImage.Name = "SoldierImage"
characterImage.Size = UDim2.new(1, -6, 1, -34)
characterImage.Position = UDim2.fromOffset(3, 28)
characterImage.BackgroundTransparency = 1
characterImage.ImageTransparency = 0
characterImage.Image = "rbxassetid://104888390303578"
characterImage.ScaleType = Enum.ScaleType.Fit
characterImage.BorderSizePixel = 0
characterImage.ZIndex = 6
characterImage.Parent = previewArea

--==================================================
-- PERSONAGEM | IMAGEM ALTA E ESTREITA
--==================================================

local previewArea = Instance.new("Frame")
previewArea.Name = "CharacterPreview"

-- Área mais estreita
previewArea.Size = UDim2.new(0, 112, 1, -43)
previewArea.Position = UDim2.new(1, -120, 0, 36)

previewArea.BackgroundColor3 = C.Card
previewArea.BackgroundTransparency = 0.88
previewArea.BorderSizePixel = 0
previewArea.ClipsDescendants = true
previewArea.ZIndex = 5
previewArea.Parent = aimbot

Round(previewArea, 8)

-- Borda fina
local previewBorder = Border(previewArea, 0.65)
previewBorder.Thickness = 0.8

local previewTitle = Label(
    previewArea,
    "PERSONAGEM",
    UDim2.new(1, -8, 0, 22),
    UDim2.fromOffset(4, 5),
    Enum.Font.GothamBold,
    C.Gray
)
previewTitle.ZIndex = 7
previewTitle.TextSize = 9
previewTitle.TextXAlignment = Enum.TextXAlignment.Center

-- IMAGEM DO SOLDADO

local characterImage = Instance.new("ImageLabel")
characterImage.Name = "SoldierImage"

characterImage.Size = UDim2.new(1, -6, 1, -34)
characterImage.Position = UDim2.fromOffset(3, 28)

characterImage.BackgroundTransparency = 1
characterImage.ImageTransparency = 0
characterImage.Image = "rbxassetid://104888390303578"

characterImage.ScaleType = Enum.ScaleType.Fit
characterImage.BorderSizePixel = 0
characterImage.ZIndex = 6
characterImage.Parent = previewArea

--==================================================
-- NAVEGAÇÃO
--==================================================

local function ShowPage(name)
    for pageName, page in pairs(pages) do
        page.Visible = pageName == name
    end

    homeButton.BackgroundColor3 =
        name == "Inicio" and C.Red or C.Card

    aimButton.BackgroundColor3 =
        name == "Aimbot" and C.Red or C.Card
end

homeButton.MouseButton1Click:Connect(function()
    ShowPage("Inicio")
end)

aimButton.MouseButton1Click:Connect(function()
    ShowPage("Aimbot")
end)

--==================================================
-- ARRASTO DO MENU
--==================================================

local menuDragging = false
local menuInputType
local menuStart
local menuStartPosition

dragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        menuDragging = true
        menuInputType = "Touch"
        menuStart = input.Position
        menuStartPosition = main.Position

    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        menuDragging = true
        menuInputType = "Mouse"
        menuStart = input.Position
        menuStartPosition = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if not menuDragging then return end

    local valid =
        (menuInputType == "Touch" and input.UserInputType == Enum.UserInputType.Touch)
        or (menuInputType == "Mouse" and input.UserInputType == Enum.UserInputType.MouseMovement)

    if not valid then return end

    local delta = input.Position - menuStart

    main.Position = UDim2.new(
        menuStartPosition.X.Scale,
        menuStartPosition.X.Offset + delta.X,
        menuStartPosition.Y.Scale,
        menuStartPosition.Y.Offset + delta.Y
    )
end)

UIS.InputEnded:Connect(function(input)
    if menuInputType == "Touch" and input.UserInputType == Enum.UserInputType.Touch then
        menuDragging = false
        menuInputType = nil

    elseif menuInputType == "Mouse" and input.UserInputType == Enum.UserInputType.MouseButton1 then
        menuDragging = false
        menuInputType = nil
    end
end)

--==================================================
-- ARRASTO DO SHARINGAN
--==================================================

local buttonDragging = false
local buttonInputType
local buttonStart
local buttonStartPosition
local buttonMoved = false

openButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        buttonDragging = true
        buttonInputType = "Touch"
        buttonStart = input.Position
        buttonStartPosition = openButton.Position
        buttonMoved = false

    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        buttonDragging = true
        buttonInputType = "Mouse"
        buttonStart = input.Position
        buttonStartPosition = openButton.Position
        buttonMoved = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if not buttonDragging then return end

    local valid =
        (buttonInputType == "Touch" and input.UserInputType == Enum.UserInputType.Touch)
        or (buttonInputType == "Mouse" and input.UserInputType == Enum.UserInputType.MouseMovement)

    if not valid then return end

    local delta = input.Position - buttonStart

    if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
        buttonMoved = true
    end

    if buttonMoved then
        openButton.Position = UDim2.new(
            buttonStartPosition.X.Scale,
            buttonStartPosition.X.Offset + delta.X,
            buttonStartPosition.Y.Scale,
            buttonStartPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    local ended = false

    if buttonInputType == "Touch" and input.UserInputType == Enum.UserInputType.Touch then
        ended = true
    elseif buttonInputType == "Mouse" and input.UserInputType == Enum.UserInputType.MouseButton1 then
        ended = true
    end

    if ended and buttonDragging then
        if not buttonMoved then
            main.Visible = not main.Visible
        end

        buttonDragging = false
        buttonInputType = nil
    end
end)

--==================================================
-- FECHAR
--==================================================

close.MouseButton1Click:Connect(function()
    main.Visible = false
end)

--==================================================
-- INICIALIZAÇÃO
--==================================================

ShowPage("Inicio")

print("ITACHI HUB V1.6.2 carregado!")
