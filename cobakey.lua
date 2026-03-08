-- ============================================================
--  RAFA PRIVATE V12.0 | EMERALD EDITION
--  KEY SYSTEM POWERED BY KEYAUTH
-- ============================================================

-- [CONFIG] Isi sesuai data kamu
local Config = {
    api      = "c0016185-eb38-48d4-a4c3-d99b0c59ecda",  -- Owner ID KeyAuth
    service  = "yourservicenamehere",                    -- Application Name KeyAuth
    version  = "1.0",
    keyLink  = "https://work.ink/LINKMU"                 -- ⬅️ GANTI DENGAN LINK WORK.INK KAMU
}

-- ============================================================
--  KEY SYSTEM GUI
-- ============================================================
local TweenService   = game:GetService("TweenService")
local HttpService    = game:GetService("HttpService")
local Players        = game:GetService("Players")

local KeyGui         = Instance.new("ScreenGui")
KeyGui.Name          = "RafaKeySystem"
KeyGui.ResetOnSpawn  = false
KeyGui.Parent        = game:GetService("CoreGui")

-- Background blur overlay
local Overlay        = Instance.new("Frame", KeyGui)
Overlay.Size         = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4

-- Key Panel
local Panel          = Instance.new("Frame", KeyGui)
Panel.Size           = UDim2.new(0, 0, 0, 0)
Panel.AnchorPoint    = Vector2.new(0.5, 0.5)
Panel.Position       = UDim2.new(0.5, 0, 0.5, 0)
Panel.BackgroundColor3 = Color3.fromRGB(10, 14, 10)
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 12)
local panelStroke    = Instance.new("UIStroke", Panel)
panelStroke.Color    = Color3.fromRGB(0, 255, 120)
panelStroke.Thickness = 1.5

-- Animasi buka panel
TweenService:Create(Panel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 280, 0, 240)}):Play()

-- Top bar hijau
local TopBar         = Instance.new("Frame", Panel)
TopBar.Size          = UDim2.new(1, 0, 0, 36)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

-- Patch bawah topbar (biar top corner aja)
local TopBarFix      = Instance.new("Frame", TopBar)
TopBarFix.Size       = UDim2.new(1, 0, 0.5, 0)
TopBarFix.Position   = UDim2.new(0, 0, 0.5, 0)
TopBarFix.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
TopBarFix.BorderSizePixel = 0

local TopTitle       = Instance.new("TextLabel", TopBar)
TopTitle.Size        = UDim2.new(1, 0, 1, 0)
TopTitle.BackgroundTransparency = 1
TopTitle.Text        = "🔑  RAFA V12 — KEY SYSTEM"
TopTitle.TextColor3  = Color3.fromRGB(255, 255, 255)
TopTitle.Font        = Enum.Font.GothamBold
TopTitle.TextSize    = 13

-- Logo / Icon
local LogoLbl        = Instance.new("TextLabel", Panel)
LogoLbl.Size         = UDim2.new(1, 0, 0, 30)
LogoLbl.Position     = UDim2.new(0, 0, 0, 44)
LogoLbl.BackgroundTransparency = 1
LogoLbl.Text         = "🌿 EMERALD EDITION"
LogoLbl.TextColor3   = Color3.fromRGB(0, 255, 120)
LogoLbl.Font         = Enum.Font.GothamBold
LogoLbl.TextSize     = 12

-- Sub info
local SubLbl         = Instance.new("TextLabel", Panel)
SubLbl.Size          = UDim2.new(1, -20, 0, 20)
SubLbl.Position      = UDim2.new(0, 10, 0, 72)
SubLbl.BackgroundTransparency = 1
SubLbl.Text          = "Masukkan key untuk melanjutkan"
SubLbl.TextColor3    = Color3.fromRGB(150, 150, 150)
SubLbl.Font          = Enum.Font.Gotham
SubLbl.TextSize      = 11

-- Input box
local InputBox       = Instance.new("TextBox", Panel)
InputBox.Size        = UDim2.new(1, -20, 0, 38)
InputBox.Position    = UDim2.new(0, 10, 0, 98)
InputBox.BackgroundColor3 = Color3.fromRGB(20, 28, 20)
InputBox.Text        = ""
InputBox.PlaceholderText = "Paste key kamu di sini..."
InputBox.PlaceholderColor3 = Color3.fromRGB(80, 100, 80)
InputBox.TextColor3  = Color3.fromRGB(0, 255, 120)
InputBox.Font        = Enum.Font.GothamSemibold
InputBox.TextSize    = 12
InputBox.ClearTextOnFocus = false
local inputStroke    = Instance.new("UIStroke", InputBox)
inputStroke.Color    = Color3.fromRGB(0, 180, 80)
Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)

-- Status label
local StatusLbl      = Instance.new("TextLabel", Panel)
StatusLbl.Size       = UDim2.new(1, -20, 0, 20)
StatusLbl.Position   = UDim2.new(0, 10, 0, 142)
StatusLbl.BackgroundTransparency = 1
StatusLbl.Text       = ""
StatusLbl.Font       = Enum.Font.GothamSemibold
StatusLbl.TextSize   = 11

-- Confirm button
local ConfirmBtn     = Instance.new("TextButton", Panel)
ConfirmBtn.Size      = UDim2.new(1, -20, 0, 36)
ConfirmBtn.Position  = UDim2.new(0, 10, 0, 166)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
ConfirmBtn.Text      = "✅  UNLOCK SCRIPT"
ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtn.Font      = Enum.Font.GothamBold
ConfirmBtn.TextSize  = 13
Instance.new("UICorner", ConfirmBtn).CornerRadius = UDim.new(0, 8)

-- Get key button
local GetKeyBtn      = Instance.new("TextButton", Panel)
GetKeyBtn.Size       = UDim2.new(1, -20, 0, 26)
GetKeyBtn.Position   = UDim2.new(0, 10, 0, 207)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 15)
GetKeyBtn.Text       = "🔗  Dapatkan Key (work.ink)"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 200, 100)
GetKeyBtn.Font       = Enum.Font.GothamSemibold
GetKeyBtn.TextSize   = 11
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)
local gkStroke       = Instance.new("UIStroke", GetKeyBtn)
gkStroke.Color       = Color3.fromRGB(0, 130, 60)

-- ============================================================
--  KEY VALIDATION (KeyAuth)
-- ============================================================
local function setStatus(msg, color)
    StatusLbl.Text      = msg
    StatusLbl.TextColor3 = color or Color3.fromRGB(255, 255, 255)
end

local function validateKey(key)
    if key == nil or #key < 5 then
        setStatus("❌ Key terlalu pendek!", Color3.fromRGB(255, 80, 80))
        return false
    end

    setStatus("⏳ Memeriksa key...", Color3.fromRGB(200, 200, 0))

    local success, result = pcall(function()
        -- KeyAuth endpoint
        local url = string.format(
            "https://keyauth.win/api/1.2/?type=license&key=%s&name=%s&ownerid=%s&ver=%s",
            key,
            HttpService:UrlEncode(Config.service),
            HttpService:UrlEncode(Config.api),
            HttpService:UrlEncode(Config.version)
        )
        local resp = game:HttpGet(url)
        return HttpService:JSONDecode(resp)
    end)

    if not success then
        -- Fallback: cek key offline (hardcoded) jika HttpGet tidak tersedia
        local OFFLINE_KEYS = {
            -- Tambah key valid kamu di sini saat testing offline
            -- "RAFA-XXXXX-XXXXX",
        }
        for _, v in pairs(OFFLINE_KEYS) do
            if v == key then return true end
        end
        setStatus("⚠️ Tidak bisa cek server. Coba lagi.", Color3.fromRGB(255, 160, 0))
        return false
    end

    if result and result.success then
        return true
    else
        local msg = (result and result.message) or "Key tidak valid"
        setStatus("❌ " .. msg, Color3.fromRGB(255, 80, 80))
        return false
    end
end

local function launchMainScript()
    -- Animasi tutup key panel
    TweenService:Create(Panel, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.45)
    KeyGui:Destroy()

    -- ================================================================
    --  MAIN SCRIPT (RAFA PRIVATE V12.0 | EMERALD EDITION)
    -- ================================================================
    local TweenService = game:GetService("TweenService")
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local LogoButton = Instance.new("TextButton")

    local Theme = {
        MainBG    = Color3.fromRGB(15, 18, 15),
        TopBar    = Color3.fromRGB(0, 180, 80),
        TabDark   = Color3.fromRGB(25, 30, 25),
        Accent    = Color3.fromRGB(0, 255, 120),
        TextWhite = Color3.fromRGB(255, 255, 255)
    }

    ScreenGui.Name = "Rafa_V120_Emerald"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    LogoButton.Parent = ScreenGui
    LogoButton.BackgroundColor3 = Theme.TabDark
    LogoButton.Position = UDim2.new(0.05, 0, 0.2, 0)
    LogoButton.Size = UDim2.new(0, 0, 0, 0)
    LogoButton.Text = "3"
    LogoButton.TextColor3 = Theme.Accent
    LogoButton.Font = Enum.Font.GothamBold
    LogoButton.TextSize = 30
    LogoButton.Visible = false
    LogoButton.Draggable = true
    Instance.new("UICorner", LogoButton).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", LogoButton).Color = Theme.Accent

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Theme.MainBG
    MainFrame.Position = UDim2.new(0.4, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    Instance.new("UICorner", MainFrame)
    Instance.new("UIStroke", MainFrame).Color = Theme.Accent

    local openTween = TweenService:Create(MainFrame,
        TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 230, 0, 360)})
    openTween:Play()

    local WarBar = Instance.new("Frame", MainFrame)
    WarBar.Size = UDim2.new(1, 0, 0, 30)
    WarBar.BackgroundColor3 = Theme.TopBar
    Instance.new("UICorner", WarBar)

    local WarLabel = Instance.new("TextLabel", WarBar)
    WarLabel.Size = UDim2.new(1, -70, 1, 0)
    WarLabel.Position = UDim2.new(0, 10, 0, 0)
    WarLabel.Text = "THR33 V12.0"
    WarLabel.TextColor3 = Theme.TextWhite
    WarLabel.Font = Enum.Font.GothamBold
    WarLabel.BackgroundTransparency = 1
    WarLabel.TextXAlignment = Enum.TextXAlignment.Left

    local MinBtn = Instance.new("TextButton", WarBar)
    MinBtn.Size = UDim2.new(0, 25, 0, 25)
    MinBtn.Position = UDim2.new(1, -55, 0, 2.5)
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Theme.TextWhite
    MinBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 40)
    Instance.new("UICorner", MinBtn)

    local CloseBtn = Instance.new("TextButton", WarBar)
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -27, 0, 2.5)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Theme.TextWhite
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    Instance.new("UICorner", CloseBtn)

    local TabBar = Instance.new("Frame", MainFrame)
    TabBar.Position = UDim2.new(0, 5, 0, 35)
    TabBar.Size = UDim2.new(1, -10, 0, 30)
    TabBar.BackgroundTransparency = 1

    local WarTabBtn = Instance.new("TextButton", TabBar)
    WarTabBtn.Size = UDim2.new(0.32, 0, 1, 0)
    WarTabBtn.BackgroundColor3 = Theme.TopBar
    WarTabBtn.Text = "WAR"
    WarTabBtn.TextColor3 = Theme.TextWhite
    WarTabBtn.Font = Enum.Font.GothamBold
    WarTabBtn.TextSize = 11
    Instance.new("UICorner", WarTabBtn)

    local FarmTabBtn = Instance.new("TextButton", TabBar)
    FarmTabBtn.Size = UDim2.new(0.32, 0, 1, 0)
    FarmTabBtn.Position = UDim2.new(0.34, 0, 0, 0)
    FarmTabBtn.BackgroundColor3 = Theme.TabDark
    FarmTabBtn.Text = "FARM"
    FarmTabBtn.TextColor3 = Theme.TextWhite
    FarmTabBtn.Font = Enum.Font.GothamBold
    FarmTabBtn.TextSize = 11
    Instance.new("UICorner", FarmTabBtn)

    local InfoTabBtn = Instance.new("TextButton", TabBar)
    InfoTabBtn.Size = UDim2.new(0.32, 0, 1, 0)
    InfoTabBtn.Position = UDim2.new(0.68, 0, 0, 0)
    InfoTabBtn.BackgroundColor3 = Theme.TabDark
    InfoTabBtn.Text = "INFO"
    InfoTabBtn.TextColor3 = Theme.TextWhite
    InfoTabBtn.Font = Enum.Font.GothamBold
    InfoTabBtn.TextSize = 11
    Instance.new("UICorner", InfoTabBtn)

    local function createPage()
        local page = Instance.new("ScrollingFrame", MainFrame)
        page.Position = UDim2.new(0, 10, 0, 75)
        page.Size = UDim2.new(1, -20, 1, -85)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 2
        page.ScrollBarImageColor3 = Theme.Accent
        page.Visible = false
        Instance.new("UIListLayout", page).Padding = UDim.new(0, 8)
        return page
    end

    local WarPage = createPage(); WarPage.Visible = true
    local FarmPage = createPage()
    local InfoPage = createPage()

    -- INFO TAB
    local InfoTitle = Instance.new("TextLabel", InfoPage)
    InfoTitle.Size = UDim2.new(1, 0, 0, 25)
    InfoTitle.BackgroundTransparency = 1
    InfoTitle.Text = "SOCIAL MEDIA"
    InfoTitle.TextColor3 = Theme.Accent
    InfoTitle.Font = Enum.Font.GothamBold

    local TikTokLbl = Instance.new("TextLabel", InfoPage)
    TikTokLbl.Size = UDim2.new(1, 0, 0, 30)
    TikTokLbl.BackgroundColor3 = Theme.TabDark
    TikTokLbl.Text = "🎵 TikTok: @hendriix"
    TikTokLbl.TextColor3 = Theme.TextWhite
    TikTokLbl.Font = Enum.Font.GothamSemibold
    Instance.new("UICorner", TikTokLbl)

    local DiscordLbl = Instance.new("TextLabel", InfoPage)
    DiscordLbl.Size = UDim2.new(1, 0, 0, 30)
    DiscordLbl.BackgroundColor3 = Theme.TabDark
    DiscordLbl.Text = "💬 Discord: discord.gg/rafa"
    DiscordLbl.TextColor3 = Theme.TextWhite
    DiscordLbl.Font = Enum.Font.GothamSemibold
    Instance.new("UICorner", DiscordLbl)

    local WarningFrame = Instance.new("Frame", InfoPage)
    WarningFrame.Size = UDim2.new(1, 0, 0, 70)
    WarningFrame.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    Instance.new("UICorner", WarningFrame)
    Instance.new("UIStroke", WarningFrame).Color = Color3.fromRGB(255, 50, 50)

    local WarningText = Instance.new("TextLabel", WarningFrame)
    WarningText.Size = UDim2.new(1, -10, 1, -10)
    WarningText.Position = UDim2.new(0, 5, 0, 5)
    WarningText.BackgroundTransparency = 1
    WarningText.Text = "⚠️ USE AT YOUR OWN RISK ⚠️\nWe are not responsible for any bans or account resets."
    WarningText.TextColor3 = Color3.fromRGB(255, 100, 100)
    WarningText.TextWrapped = true
    WarningText.Font = Enum.Font.GothamBold

    local Running = true
    local Flags = {BoxESP=false,TPNoClip=false,FakeName=false,InvScan=false,AutoCook=false,InstantInteract=false}
    local ESP_Boxes = {}
    local totalMasak = 0

    local function switchTab(activeBtn, activePage)
        WarPage.Visible=false; FarmPage.Visible=false; InfoPage.Visible=false
        WarTabBtn.BackgroundColor3=Theme.TabDark; FarmTabBtn.BackgroundColor3=Theme.TabDark; InfoTabBtn.BackgroundColor3=Theme.TabDark
        activePage.Visible=true
        activeBtn.BackgroundColor3=Theme.TopBar
    end

    WarTabBtn.MouseButton1Click:Connect(function() switchTab(WarTabBtn, WarPage) end)
    FarmTabBtn.MouseButton1Click:Connect(function() switchTab(FarmTabBtn, FarmPage) end)
    InfoTabBtn.MouseButton1Click:Connect(function() switchTab(InfoTabBtn, InfoPage) end)

    MinBtn.MouseButton1Click:Connect(function()
        local shrink = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
        shrink:Play(); shrink.Completed:Wait()
        MainFrame.Visible=false; LogoButton.Visible=true
        TweenService:Create(LogoButton, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size=UDim2.new(0,50,0,50)}):Play()
    end)

    LogoButton.MouseButton1Click:Connect(function()
        local sl = TweenService:Create(LogoButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
        sl:Play(); sl.Completed:Wait()
        LogoButton.Visible=false; MainFrame.Visible=true
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size=UDim2.new(0,230,0,360)}):Play()
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        Running=false
        for _,box in pairs(ESP_Boxes) do if box then box:Remove() end end
        ESP_Boxes={}; ScreenGui:Destroy()
    end)

    local function AddToggle(parent, name, flagName)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(1,0,0,35)
        btn.BackgroundColor3 = Theme.TabDark
        btn.Text = name.." [OFF]"
        btn.TextColor3 = Theme.TextWhite
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 10
        Instance.new("UICorner", btn)
        Instance.new("UIStroke", btn).Color = Color3.fromRGB(50,60,50)
        btn.MouseButton1Click:Connect(function()
            Flags[flagName] = not Flags[flagName]
            btn.TextColor3 = Flags[flagName] and Theme.Accent or Theme.TextWhite
            btn.Text = name..(Flags[flagName] and " [ON]" or " [OFF]")
            btn.UIStroke.Color = Flags[flagName] and Theme.Accent or Color3.fromRGB(50,60,50)
        end)
        return btn
    end

    AddToggle(WarPage,"Instant Interact","InstantInteract")
    AddToggle(WarPage,"Inventory Scanner","InvScan")
    AddToggle(WarPage,"Box ESP","BoxESP")
    AddToggle(WarPage,"Blink TP [T]","TPNoClip")

    local CounterLabel = Instance.new("TextLabel", FarmPage)
    CounterLabel.Size = UDim2.new(1,0,0,30)
    CounterLabel.BackgroundColor3 = Theme.TabDark
    CounterLabel.Text = "Masak: 0"
    CounterLabel.TextColor3 = Theme.Accent
    CounterLabel.Font = Enum.Font.GothamBold
    Instance.new("UICorner", CounterLabel)

    local ResetBtn = Instance.new("TextButton", FarmPage)
    ResetBtn.Size = UDim2.new(1,0,0,30)
    ResetBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
    ResetBtn.Text = "Reset Cycle & Counter"
    ResetBtn.TextColor3 = Theme.TextWhite
    ResetBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", ResetBtn)

    local currentCookStep = 1
    local cookSteps = {
        {keyword="water",   baseWait=20},
        {keyword="sugar",   baseWait=2},
        {keyword="gelatin", baseWait=45},
        {keyword="empty",   baseWait=2}
    }

    ResetBtn.MouseButton1Click:Connect(function()
        totalMasak=0; CounterLabel.Text="Masak: 0"; currentCookStep=1
    end)

    local CookToggleBtn = AddToggle(FarmPage,"Auto Cook Non-Stop","AutoCook")
    local vim = game:GetService("VirtualInputManager")

    task.spawn(function()
        while Running do
            task.wait(math.random(20,40)/100)
            if Flags.AutoCook then
                local data = cookSteps[currentCookStep]
                local p = game.Players.LocalPlayer
                local char = p.Character
                local hum = char and char:FindFirstChild("Humanoid")
                local tool = nil
                for i=1,6 do
                    if not Flags.AutoCook or not Running then break end
                    if p.Backpack then
                        for _,v in pairs(p.Backpack:GetChildren()) do
                            if string.find(string.lower(v.Name),data.keyword) then tool=v; break end
                        end
                    end
                    if not tool and char then
                        for _,v in pairs(char:GetChildren()) do
                            if v:IsA("Tool") and string.find(string.lower(v.Name),data.keyword) then tool=v; break end
                        end
                    end
                    if tool then break end
                    task.wait(0.5)
                end
                if tool and hum then
                    task.wait(math.random(3,7)/10)
                    hum:EquipTool(tool)
                    task.wait(math.random(5,10)/10)
                    vim:SendKeyEvent(true,Enum.KeyCode.E,false,game)
                    task.wait(math.random(1,3)/10)
                    vim:SendKeyEvent(false,Enum.KeyCode.E,false,game)
                    if data.keyword=="empty" then
                        task.wait(math.random(2,5)/10)
                        vim:SendKeyEvent(true,Enum.KeyCode.E,false,game)
                        task.wait(math.random(1,3)/10)
                        vim:SendKeyEvent(false,Enum.KeyCode.E,false,game)
                    end
                    local humanWait = data.baseWait+(math.random(5,25)/10)
                    local timeWaited=0
                    while timeWaited<humanWait and Flags.AutoCook and Running do
                        local mw=math.random(4,6)/10; task.wait(mw); timeWaited=timeWaited+mw
                    end
                    if Flags.AutoCook and Running then
                        if data.keyword=="empty" then
                            totalMasak=totalMasak+1
                            CounterLabel.Text="Masak: "..totalMasak
                        end
                        currentCookStep=currentCookStep+1
                        if currentCookStep>#cookSteps then currentCookStep=1 end
                    end
                else
                    Flags.AutoCook=false
                    CookToggleBtn.Text="HABIS: "..string.upper(data.keyword).." [OFF]"
                    CookToggleBtn.TextColor3=Color3.fromRGB(255,50,50)
                    task.wait(3)
                    if not Flags.AutoCook then
                        CookToggleBtn.Text="Auto Cook Non-Stop [OFF]"
                        CookToggleBtn.TextColor3=Theme.TextWhite
                    end
                end
            end
        end
    end)

    local interactConn
    interactConn = game:GetService("ProximityPromptService").PromptShown:Connect(function(prompt)
        if not Running then if interactConn then interactConn:Disconnect() end return end
        if Flags.InstantInteract then pcall(function() if prompt.HoldDuration>0 then prompt.HoldDuration=0.05 end end) end
    end)

    local Inv_Tags = {}
    task.spawn(function()
        while Running do
            task.wait(2)
            for _,p in pairs(game.Players:GetPlayers()) do
                if p~=game.Players.LocalPlayer and p.Character then
                    local head=p.Character:FindFirstChild("Head")
                    if Flags.InvScan and head then
                        if not Inv_Tags[p] then
                            local invTag=Instance.new("BillboardGui")
                            invTag.Size=UDim2.new(0,250,0,150)
                            invTag.StudsOffset=Vector3.new(0,4,0)
                            invTag.AlwaysOnTop=true
                            invTag.Adornee=head
                            invTag.Parent=ScreenGui
                            local lbl=Instance.new("TextLabel",invTag)
                            lbl.Size=UDim2.new(1,0,1,0)
                            lbl.BackgroundTransparency=1
                            lbl.TextColor3=Theme.Accent
                            lbl.Font=Enum.Font.GothamBold
                            lbl.TextSize=9
                            lbl.TextStrokeTransparency=0.5
                            lbl.TextYAlignment=Enum.TextYAlignment.Top
                            Inv_Tags[p]=invTag
                        end
                        pcall(function()
                            local held="None"; local inv={}
                            for _,v in pairs(p.Character:GetChildren()) do if v:IsA("Tool") then held=v.Name end end
                            for _,v in pairs(p.Backpack:GetChildren()) do table.insert(inv,"• "..v.Name) end
                            if Inv_Tags[p] and Inv_Tags[p]:FindFirstChild("TextLabel") then
                                Inv_Tags[p].TextLabel.Text="[HELD]: "..held.."\n\n[INVENTORY]:\n"..table.concat(inv,"\n")
                            end
                        end)
                    elseif not Flags.InvScan or not head then
                        if Inv_Tags[p] then Inv_Tags[p]:Destroy(); Inv_Tags[p]=nil end
                    end
                end
            end
            for p,tag in pairs(Inv_Tags) do
                if not p or not p.Parent then if tag then tag:Destroy() end; Inv_Tags[p]=nil end
            end
        end
    end)

    local blinkDistance = -6
    local dashTime = 0.15

    local inputConn
    inputConn = game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
        if not Running then if inputConn then inputConn:Disconnect() end return end
        if not processed and Flags.TPNoClip and input.KeyCode==Enum.KeyCode.T then
            local p=game.Players.LocalPlayer
            local char=p.Character
            local hrp=char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                TweenService:Create(hrp, TweenInfo.new(dashTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {CFrame = hrp.CFrame * CFrame.new(0,0,blinkDistance)}):Play()
            end
        end
    end)

    local renderConn
    renderConn = game:GetService("RunService").RenderStepped:Connect(function()
        if not Running then if renderConn then renderConn:Disconnect() end return end
        if not Flags.BoxESP then for _,box in pairs(ESP_Boxes) do box.Visible=false end return end
        for _,p in pairs(game.Players:GetPlayers()) do
            if p~=game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local root=p.Character.HumanoidRootPart
                local pos,onScreen=workspace.CurrentCamera:WorldToViewportPoint(root.Position)
                if onScreen then
                    if not ESP_Boxes[p] then
                        ESP_Boxes[p]=Drawing.new("Square")
                        ESP_Boxes[p].Thickness=1.5
                        ESP_Boxes[p].Color=Theme.Accent
                    end
                    local sizeY=(workspace.CurrentCamera:WorldToViewportPoint(root.Position+Vector3.new(0,3,0)).Y
                               - workspace.CurrentCamera:WorldToViewportPoint(root.Position+Vector3.new(0,-3.5,0)).Y)
                    ESP_Boxes[p].Size=Vector2.new(sizeY/1.5,sizeY)
                    ESP_Boxes[p].Position=Vector2.new(pos.X-ESP_Boxes[p].Size.X/2, pos.Y-ESP_Boxes[p].Size.Y/2)
                    ESP_Boxes[p].Visible=true
                elseif ESP_Boxes[p] then
                    ESP_Boxes[p].Visible=false
                end
            end
        end
    end)
    -- ================================================================
    --  END MAIN SCRIPT
    -- ================================================================
end

-- ============================================================
--  BUTTON EVENTS
-- ============================================================
ConfirmBtn.MouseButton1Click:Connect(function()
    local key = InputBox.Text
    ConfirmBtn.AutoButtonColor = false
    ConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 55)

    if validateKey(key) then
        setStatus("✅ Key valid! Memuat script...", Color3.fromRGB(0, 255, 120))
        -- Animasi sukses
        TweenService:Create(panelStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(0,255,120)}):Play()
        task.wait(0.8)
        launchMainScript()
    else
        -- Goyangkan panel jika gagal
        local origPos = Panel.Position
        for i = 1, 4 do
            TweenService:Create(Panel, TweenInfo.new(0.05), {Position = origPos + UDim2.new(0,6,0,0)}):Play()
            task.wait(0.05)
            TweenService:Create(Panel, TweenInfo.new(0.05), {Position = origPos - UDim2.new(0,6,0,0)}):Play()
            task.wait(0.05)
        end
        TweenService:Create(Panel, TweenInfo.new(0.05), {Position = origPos}):Play()
        ConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
    end
    ConfirmBtn.AutoButtonColor = true
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    -- Copy link work.ink ke clipboard player otomatis
    local success = pcall(function()
        setclipboard(Config.keyLink)
    end)
    if success then
        GetKeyBtn.Text = "✅  Link ter-copy! Buka di browser"
        GetKeyBtn.TextColor3 = Color3.fromRGB(0, 255, 120)
        gkStroke.Color = Color3.fromRGB(0, 255, 120)
        setStatus("🔗 Link work.ink sudah di clipboard!", Color3.fromRGB(0, 255, 120))
        task.delay(3, function()
            GetKeyBtn.Text = "🔗  Dapatkan Key (work.ink)"
            GetKeyBtn.TextColor3 = Color3.fromRGB(0, 200, 100)
            gkStroke.Color = Color3.fromRGB(0, 130, 60)
            setStatus("", Color3.fromRGB(255,255,255))
        end)
    else
        -- Fallback jika executor tidak support setclipboard
        setStatus("Link: " .. Config.keyLink, Color3.fromRGB(255, 200, 0))
    end
end)
