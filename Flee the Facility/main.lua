local Nova = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local CollectionService = game:GetService("CollectionService")

local Theme = {
    Background = Color3.fromRGB(18, 18, 22),
    Sidebar = Color3.fromRGB(24, 24, 29),
    ElementBg = Color3.fromRGB(32, 32, 38),
    ElementHover = Color3.fromRGB(42, 42, 48),
    Text = Color3.fromRGB(245, 245, 245),
    SubText = Color3.fromRGB(140, 140, 150),
    Accent = Color3.fromRGB(90, 105, 235),
    Outline = Color3.fromRGB(45, 45, 50)
}

local function Tween(obj, props, time)
    local tween = TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    tween:Play()
    return tween
end

local NotifGui = Instance.new("ScreenGui")
NotifGui.Name = "NovaNotifications"
pcall(function() NotifGui.Parent = CoreGui end)
if not NotifGui.Parent then NotifGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end

local NotifContainer = Instance.new("Frame", NotifGui)
NotifContainer.Size = UDim2.new(0, 300, 1, -20)
NotifContainer.Position = UDim2.new(1, -320, 0, 20)
NotifContainer.BackgroundTransparency = 1
local NotifLayout = Instance.new("UIListLayout", NotifContainer)
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifLayout.Padding = UDim.new(0, 10)

function Nova.Notify(opts)
    local Notif = Instance.new("Frame", NotifContainer)
    Notif.Size = UDim2.new(1, 40, 0, 70)
    Notif.BackgroundColor3 = Theme.Sidebar
    Notif.BackgroundTransparency = 1
    Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 6)
    local Stroke = Instance.new("UIStroke", Notif)
    Stroke.Color = Theme.Accent
    Stroke.Transparency = 1

    local TitleLbl = Instance.new("TextLabel", Notif)
    TitleLbl.Size = UDim2.new(1, -20, 0, 25)
    TitleLbl.Position = UDim2.new(0, 10, 0, 5)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Text = opts.Title or "Notification"
    TitleLbl.TextColor3 = Theme.Text
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextSize = 14
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
    TitleLbl.TextTransparency = 1

    local TextLbl = Instance.new("TextLabel", Notif)
    TextLbl.Size = UDim2.new(1, -20, 0, 35)
    TextLbl.Position = UDim2.new(0, 10, 0, 25)
    TextLbl.BackgroundTransparency = 1
    TextLbl.Text = opts.Text or ""
    TextLbl.TextColor3 = Theme.SubText
    TextLbl.Font = Enum.Font.GothamMedium
    TextLbl.TextSize = 13
    TextLbl.TextXAlignment = Enum.TextXAlignment.Left
    TextLbl.TextWrapped = true
    TextLbl.TextTransparency = 1

    Tween(Notif, {Size = UDim2.new(1, 0, 0, 70), BackgroundTransparency = 0.05}, 0.4)
    Tween(Stroke, {Transparency = 0.5}, 0.4)
    Tween(TitleLbl, {TextTransparency = 0}, 0.4)
    Tween(TextLbl, {TextTransparency = 0}, 0.4)

    task.spawn(function()
        task.wait(opts.Duration or 3)
        Tween(Notif, {Size = UDim2.new(1, 40, 0, 70), BackgroundTransparency = 1}, 0.4)
        Tween(Stroke, {Transparency = 1}, 0.4)
        Tween(TitleLbl, {TextTransparency = 1}, 0.4)
        Tween(TextLbl, {TextTransparency = 1}, 0.4)
        task.wait(0.4)
        Notif:Destroy()
    end)
end

function Nova.CreateWindow(opts)
    local Window = { Tabs = {} }
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NovaUI_FTF"
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 550, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -210)
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.ClipsDescendants = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", MainFrame).Color = Theme.Outline

    local Topbar = Instance.new("Frame", MainFrame)
    Topbar.Size = UDim2.new(1, 0, 0, 30)
    Topbar.BackgroundTransparency = 1

    local dragging, dragInput, dragStart, startPos
    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Tween(MainFrame, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}, 0.1)
        end
    end)
    Topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 150, 1, 0)
    Sidebar.BackgroundColor3 = Theme.Sidebar
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)
    local SidebarFix = Instance.new("Frame", Sidebar)
    SidebarFix.Size = UDim2.new(0, 8, 1, 0)
    SidebarFix.Position = UDim2.new(1, -8, 0, 0)
    SidebarFix.BackgroundColor3 = Theme.Sidebar
    SidebarFix.BorderSizePixel = 0

    local TitleLbl = Instance.new("TextLabel", Sidebar)
    TitleLbl.Size = UDim2.new(1, 0, 0, 60)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Text = opts.Title or "Nova UI"
    TitleLbl.TextColor3 = Theme.Accent
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextSize = 18

    local TabContainer = Instance.new("ScrollingFrame", Sidebar)
    TabContainer.Size = UDim2.new(1, 0, 1, -70)
    TabContainer.Position = UDim2.new(0, 0, 0, 60)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 0
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.Padding = UDim.new(0, 5)

    local ContentArea = Instance.new("Frame", MainFrame)
    ContentArea.Size = UDim2.new(1, -160, 1, -20)
    ContentArea.Position = UDim2.new(0, 155, 0, 10)
    ContentArea.BackgroundTransparency = 1

    function Window:CreateTab(name)
        local Tab = {}
        
        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.Size = UDim2.new(0.9, 0, 0, 34)
        TabBtn.BackgroundColor3 = Theme.Accent
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = name
        TabBtn.TextColor3 = Theme.SubText
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize = 13
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

        local Scroll = Instance.new("ScrollingFrame", ContentArea)
        Scroll.Size = UDim2.new(1, 0, 1, 0)
        Scroll.BackgroundTransparency = 1
        Scroll.ScrollBarThickness = 2
        Scroll.ScrollBarImageColor3 = Theme.Outline
        Scroll.Visible = false
        
        local Layout = Instance.new("UIListLayout", Scroll)
        Layout.Padding = UDim.new(0, 8)
        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
        end)

        TabBtn.MouseButton1Click:Connect(function()
            for _, t in pairs(Window.Tabs) do
                t.Scroll.Visible = false
                Tween(t.Btn, {BackgroundTransparency = 1, TextColor3 = Theme.SubText}, 0.2)
            end
            Scroll.Visible = true
            Tween(TabBtn, {BackgroundTransparency = 0.8, TextColor3 = Theme.Text}, 0.2)
        end)

        Tab.Scroll = Scroll
        Tab.Btn = TabBtn
        table.insert(Window.Tabs, Tab)
        
        if #Window.Tabs == 1 then
            Scroll.Visible = true
            TabBtn.BackgroundTransparency = 0.8
            TabBtn.TextColor3 = Theme.Text
        end

        function Tab:CreateSection(name)
            local Lbl = Instance.new("TextLabel", Scroll)
            Lbl.Size = UDim2.new(1, 0, 0, 20)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = "  " .. name
            Lbl.TextColor3 = Theme.Accent
            Lbl.Font = Enum.Font.GothamBold
            Lbl.TextSize = 12
            Lbl.TextXAlignment = Enum.TextXAlignment.Left
        end

        function Tab:CreateButton(opts)
            local Btn = Instance.new("TextButton", Scroll)
            Btn.Size = UDim2.new(1, -10, 0, 38)
            Btn.BackgroundColor3 = Theme.ElementBg
            Btn.Text = opts.Name
            Btn.TextColor3 = Theme.Text
            Btn.Font = Enum.Font.GothamMedium
            Btn.TextSize = 13
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
            Instance.new("UIStroke", Btn).Color = Theme.Outline

            Btn.MouseEnter:Connect(function() Tween(Btn, {BackgroundColor3 = Theme.ElementHover}) end)
            Btn.MouseLeave:Connect(function() Tween(Btn, {BackgroundColor3 = Theme.ElementBg}) end)
            Btn.MouseButton1Click:Connect(function()
                Tween(Btn, {BackgroundColor3 = Theme.Outline}, 0.1)
                task.wait(0.1)
                Tween(Btn, {BackgroundColor3 = Theme.ElementHover}, 0.2)
                if opts.Callback then pcall(opts.Callback) end
            end)

            return Btn
        end

        function Tab:CreateToggle(opts)
            local state = opts.CurrentValue or false
            local ToggleFrame = Instance.new("TextButton", Scroll)
            ToggleFrame.Size = UDim2.new(1, -10, 0, 38)
            ToggleFrame.BackgroundColor3 = Theme.ElementBg
            ToggleFrame.Text = ""
            ToggleFrame.AutoButtonColor = false
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0, 6)
            Instance.new("UIStroke", ToggleFrame).Color = Theme.Outline

            local Lbl = Instance.new("TextLabel", ToggleFrame)
            Lbl.Size = UDim2.new(1, -60, 1, 0)
            Lbl.Position = UDim2.new(0, 10, 0, 0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = opts.Name
            Lbl.TextColor3 = Theme.Text
            Lbl.Font = Enum.Font.GothamMedium
            Lbl.TextSize = 13
            Lbl.TextXAlignment = Enum.TextXAlignment.Left

            local SwitchBG = Instance.new("Frame", ToggleFrame)
            SwitchBG.Size = UDim2.new(0, 40, 0, 20)
            SwitchBG.Position = UDim2.new(1, -50, 0.5, -10)
            SwitchBG.BackgroundColor3 = state and Theme.Accent or Theme.Outline
            Instance.new("UICorner", SwitchBG).CornerRadius = UDim.new(1, 0)

            local Circle = Instance.new("Frame", SwitchBG)
            Circle.Size = UDim2.new(0, 16, 0, 16)
            Circle.Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)

            ToggleFrame.MouseButton1Click:Connect(function()
                state = not state
                Tween(SwitchBG, {BackgroundColor3 = state and Theme.Accent or Theme.Outline}, 0.2)
                Tween(Circle, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}, 0.2)
                if opts.Callback then pcall(opts.Callback, state) end
            end)
        end

        function Tab:CreateKeybind(opts)
            local key = opts.CurrentKey or Enum.KeyCode.Unknown
            local binding = false

            local Frame = Instance.new("TextButton", Scroll)
            Frame.Size = UDim2.new(1, -10, 0, 38)
            Frame.BackgroundColor3 = Theme.ElementBg
            Frame.Text = ""
            Frame.AutoButtonColor = false
            Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)
            Instance.new("UIStroke", Frame).Color = Theme.Outline

            local Lbl = Instance.new("TextLabel", Frame)
            Lbl.Size = UDim2.new(0.6, 0, 1, 0)
            Lbl.Position = UDim2.new(0, 10, 0, 0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = opts.Name
            Lbl.TextColor3 = Theme.Text
            Lbl.Font = Enum.Font.GothamMedium
            Lbl.TextSize = 13
            Lbl.TextXAlignment = Enum.TextXAlignment.Left

            local KeyBox = Instance.new("TextLabel", Frame)
            KeyBox.Size = UDim2.new(0, 60, 0, 24)
            KeyBox.Position = UDim2.new(1, -70, 0.5, -12)
            KeyBox.BackgroundColor3 = Theme.Background
            KeyBox.Text = key == Enum.KeyCode.Unknown and "None" or key.Name
            KeyBox.TextColor3 = Theme.Accent
            KeyBox.Font = Enum.Font.GothamBold
            KeyBox.TextSize = 12
            Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 4)
            Instance.new("UIStroke", KeyBox).Color = Theme.Outline

            Frame.MouseButton1Click:Connect(function()
                binding = true
                KeyBox.Text = "..."
            end)

            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if binding and input.UserInputType == Enum.UserInputType.Keyboard then
                    key = input.KeyCode
                    KeyBox.Text = key.Name
                    binding = false
                elseif not binding and not gameProcessed and input.KeyCode == key then
                    if opts.Callback then pcall(opts.Callback) end
                end
            end)
        end

        return Tab
    end

    return Window
end


local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local Window = Nova.CreateWindow({
    Title = "Flee the Facility"
})

local InfoTab = Window:CreateTab("Game Info")
local EspTab = Window:CreateTab("Visuals")
local BeastTab = Window:CreateTab("Beast")
local NBeastTab = Window:CreateTab("Survivor")
local PlayerTab = Window:CreateTab("Player")

local ESPEnabled = false 

EspTab:CreateSection("ESP Options")
EspTab:CreateToggle({
    Name = "Smart Player ESP",
    CurrentValue = false,
    Callback = function(state)
        ESPEnabled = state
        if state then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character then
                    pcall(function()
                        local transparency = 0.5
                        local Folder = Instance.new("Folder", v.Character)
                        Folder.Name = v.Name .. "'s ESP"
                        
                        local parts = {"Head", "Torso", "Left Arm", "Right Arm", "Right Leg", "Left Leg"}
                        local adornments = {}

                        for _, partName in ipairs(parts) do
                            if v.Character:FindFirstChild(partName) then
                                local box = Instance.new("BoxHandleAdornment", Folder)
                                box.AlwaysOnTop = true
                                box.Adornee = v.Character[partName]
                                box.ZIndex = 1
                                box.Name = partName
                                box.Transparency = transparency
                                box.Size = v.Character[partName].Size
                                adornments[partName] = box
                            end
                        end

                        getgenv().LoopBeastColor = RunService.Stepped:Connect(function()
                            if not v.Character or not v:FindFirstChild("TempPlayerStatsModule") then return end
                            
                            local tempStats = v.TempPlayerStatsModule
                            local hp = tempStats:FindFirstChild("Health")
                            local escaped = tempStats:FindFirstChild("Escaped")
                            local isBeast = tempStats:FindFirstChild("IsBeast")
                            
                            local isBeastValue = isBeast and isBeast.Value or false
                            
                            if not isBeastValue then
                                if (hp and hp.Value <= 0) or (escaped and escaped.Value == true) then
                                    for name, box in pairs(adornments) do box.Visible = false end
                                    return
                                else
                                    for name, box in pairs(adornments) do box.Visible = true end
                                end
                            else
                                for name, box in pairs(adornments) do box.Visible = true end
                            end

                            local color = isBeastValue and Color3.fromRGB(205, 98, 152) or Color3.new(225, 1, 1)
                            local bodyColor = isBeastValue and Color3.fromRGB(205, 98, 152) or Color3.new(1, 1, 1)

                            for name, box in pairs(adornments) do
                                box.Color3 = (name == "Head") and color or bodyColor
                            end
                        end)
                    end)
                end
            end
        else
            if getgenv().LoopBeastColor then getgenv().LoopBeastColor:Disconnect() end
            for _, v in pairs(Players:GetPlayers()) do
                if v.Character then
                    for _, e in pairs(v.Character:GetChildren()) do
                        if e:IsA("Folder") and e.Name:match("'s ESP") then
                            pcall(function() e:Destroy() end)
                        end
                    end
                end
            end
        end
    end
})


game:GetService("ReplicatedStorage"):WaitForChild("CurrentMap").Changed:Connect(function()
    if ESPEnabled then
        task.wait(10)
        for _, v in pairs(Workspace:GetDescendants()) do 
            if v.Name == "ComputerTable" and not v:FindFirstChildOfClass("Highlight") then
                pcall(function() Instance.new("Highlight", v) end)
            end
        end
        Nova.Notify({Title = "ESP", Text = "ESP refreshed for new map!", Duration = 2})
    end
end)

EspTab:CreateToggle({
    Name = "Door ESP",
    CurrentValue = false,
    Callback = function(state)
        getgenv().DoorESP = not state
        if state then
            task.spawn(function()
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "SingleDoor" and v:FindFirstChild("Door") then
                        pcall(function() Instance.new("Highlight", v.Door) end)
                    elseif v.Name == "DoubleDoor" then
                        pcall(function() Instance.new("Highlight", v) end)
                    end
                end

                while not getgenv().DoorESP do
                    for _, v in pairs(Workspace:GetDescendants()) do
                        pcall(function()
                            if v.Name == "SingleDoor" and v:FindFirstChild("DoorTrigger") then
                                local hl = v.Door:FindFirstChildOfClass("Highlight")
                                if hl then
                                    hl.FillColor = (v.DoorTrigger.ActionSign.Value == 11) and Color3.new(0,1,0) or Color3.new(1,0,0)
                                end
                            elseif v.Name == "DoubleDoor" and v:FindFirstChild("DoorTrigger") then
                                local hl = v:FindFirstChildOfClass("Highlight")
                                if hl then
                                    hl.FillColor = (v.DoorTrigger.ActionSign.Value == 11) and Color3.new(0,1,0) or Color3.new(1,0,0)
                                end
                            end
                        end)
                    end
                    task.wait(0.5)
                end
            end)
        else
            for _, v in pairs(Workspace:GetDescendants()) do
                if (v.Name == "SingleDoor" and v:FindFirstChild("Door")) or v.Name == "DoubleDoor" then
                    local target = v.Name == "SingleDoor" and v.Door or v
                    local hl = target:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end
        end
    end
})

EspTab:CreateToggle({
    Name = "Computer ESP",
    CurrentValue = false,
    Callback = function(state)
        getgenv().StopComputerESP = not state
        if state then
            for _, v in pairs(Workspace:GetDescendants()) do 
                if v.Name == "ComputerTable" then
                    pcall(function() Instance.new("Highlight", v) end)
                end
            end

            task.spawn(function()
                while not getgenv().StopComputerESP do
                    for _, v in pairs(Workspace:GetDescendants()) do
                        if v.Name == "ComputerTable" and v:FindFirstChild("Screen") then
                            pcall(function()
                                local hl = v:FindFirstChildOfClass("Highlight")
                                if hl then
                                    if v.Screen.BrickColor == BrickColor.new("Bright blue") then
                                        hl.FillColor = Color3.new(0,0,1)
                                    elseif v.Screen.BrickColor == BrickColor.new("Dark green") then
                                        hl.FillColor = Color3.new(0,1,0)
                                    end
                                end
                            end)
                        end
                    end
                    task.wait(1)
                end
            end)
        else
            for _, v in pairs(Workspace:GetDescendants()) do 
                if v.Name == "ComputerTable" then
                    local hl = v:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end
        end
    end
})

EspTab:CreateToggle({
    Name = "Freeze Pod ESP",
    CurrentValue = false,
    Callback = function(state)
        for _, v in pairs(Workspace:GetDescendants()) do 
            if v.Name == "FreezePod" then
                if state then
                    pcall(function() Instance.new("Highlight", v) end)
                else
                    local hl = v:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end
        end
    end
})

EspTab:CreateToggle({
    Name = "Locker ESP",
    CurrentValue = false,
    Callback = function(state)
        if state then
            local function showLockers()
                for _, locker in pairs(CollectionService:GetTagged("LOCKER")) do
                    if not locker:FindFirstChildOfClass("Highlight") then
                        local hl = Instance.new("Highlight", locker)
                        hl.FillColor = Color3.fromRGB(255, 165, 0)
                        hl.FillTransparency = 0.5
                    end
                end
            end
            
            showLockers()
            getgenv().LockerConnection = CollectionService:GetInstanceAddedSignal("LOCKER"):Connect(showLockers)
        else
            if getgenv().LockerConnection then getgenv().LockerConnection:Disconnect() end
            for _, locker in pairs(CollectionService:GetTagged("LOCKER")) do
                local hl = locker:FindFirstChildOfClass("Highlight")
                if hl then hl:Destroy() end
            end
        end
    end
})


EspTab:CreateToggle({
    Name = "Fullbright (Remove Fog)",
    CurrentValue = false,
    Callback = function(state)
        getgenv().FullBright = state
        if state then
            getgenv().BrightLoop = RunService.RenderStepped:Connect(function()
                Lighting.Atmosphere.Density = 0
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
            end)
            Nova.Notify({Title = "Visuals", Text = "Fog removed. Map is bright.", Duration = 2})
        else
            if getgenv().BrightLoop then getgenv().BrightLoop:Disconnect() end
            Lighting.Atmosphere.Density = 0.3
            Lighting.Brightness = 1
        end
    end
})

local sprintBegan, sprintEnded

local function ToggleSprint(state, requireBeast)
    if requireBeast and LocalPlayer.TempPlayerStatsModule.IsBeast.Value == false then return end

    if state then
        if sprintBegan then sprintBegan:Disconnect() end
        if sprintEnded then sprintEnded:Disconnect() end

        sprintBegan = UserInputService.InputBegan:Connect(function(key, processed)
            if not processed and key.KeyCode == Enum.KeyCode.Q and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 30
            end
        end)

        sprintEnded = UserInputService.InputEnded:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.Q and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end)

        if requireBeast then pcall(function() LocalPlayer.Character.PowersLocalScript:Destroy() end) end
    else
        if sprintBegan then sprintBegan:Disconnect() end
        if sprintEnded then sprintEnded:Disconnect() end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end


InfoTab:CreateSection("Live Game Stats")
local MapLbl = InfoTab:CreateButton({Name = "Map: Loading..."})
local CompLbl = InfoTab:CreateButton({Name = "Computers Left: ..."})
local PowerLbl = InfoTab:CreateButton({Name = "Beast Power: Unknown"})
local TimeLbl = InfoTab:CreateButton({Name = "Time Left: ..."})

task.spawn(function()
    local RepStore = game:GetService("ReplicatedStorage")

    local currentMap = RepStore:WaitForChild("CurrentMap")
    local function updateMap()
        MapLbl.Text = "Map: " .. (currentMap.Value and currentMap.Value.Name or "Lobby")
    end
    currentMap.Changed:Connect(updateMap)
    updateMap()

    local compsLeft = RepStore:WaitForChild("ComputersLeft")
    compsLeft.Changed:Connect(function()
        CompLbl.Text = "Computers Left: " .. tostring(compsLeft.Value)
    end)
    CompLbl.Text = "Computers Left: " .. tostring(compsLeft.Value)

    local currentPower = RepStore:WaitForChild("CurrentPower")
    currentPower.Changed:Connect(function()
        PowerLbl.Text = "Beast Power: " .. currentPower.Value
        Nova.Notify({Title = "Beast Power Alert", Text = "The Beast is now using: " .. currentPower.Value, Duration = 4})
    end)
    PowerLbl.Text = "Beast Power: " .. currentPower.Value

    local gameTimer = RepStore:WaitForChild("GameTimer")
    gameTimer.Changed:Connect(function()
        local minutes = math.floor(gameTimer.Value / 60)
        local seconds = gameTimer.Value % 60
        TimeLbl.Text = string.format("Time Left: %02d:%02d", minutes, seconds)
    end)
end)


BeastTab:CreateSection("Beast Abilities")
BeastTab:CreateToggle({
    Name = "Toggle Infinite Sprint (Q)",
    CurrentValue = false,
    Callback = function(state) ToggleSprint(state, true) end
})

BeastTab:CreateToggle({
    Name = "Toggle Crawl",
    CurrentValue = false,
    Callback = function(state)
        if LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
            LocalPlayer.TempPlayerStatsModule.DisableCrawl.Value = not state
        end
    end
})

-- also breaks powers, we should find an other way. maybe by hooking?
--[[BeastTab:CreateButton({
    Name = "No Slow (Irreversible)",
    Callback = function()
        if LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
            pcall(function() LocalPlayer.Character.PowersLocalScript:Destroy() end)
            Nova.Notify({Title = "Success", Text = "Removed Slow Effect."})
        end
    end
})]]

BeastTab:CreateButton({
    Name = "Remove Sound And Glow (Irreversible)",
    Callback = function()
        if LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
            pcall(function()
                for _, v in pairs(LocalPlayer.Character.Hammer.Handle:GetChildren()) do
                    if v:IsA("Sound") then v:Destroy() end
                end
                LocalPlayer.Character.Gemstone.Handle.PointLight:Destroy()
            end)
            Nova.Notify({Title = "Stealth", Text = "Hammer sound and glow removed."})
        end
    end
})

BeastTab:CreateButton({
    Name = "Fix Camera",
    Callback = function()
        local cam = Workspace.CurrentCamera
        cam.CameraSubject = LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
        cam.CameraType = Enum.CameraType.Custom
        LocalPlayer.CameraMinZoomDistance = 0.5
        LocalPlayer.CameraMaxZoomDistance = math.huge
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        if LocalPlayer.Character:FindFirstChild("Head") then
            LocalPlayer.Character.Head.Anchored = false
        end
    end
})


NBeastTab:CreateSection("Survivor Perks")
NBeastTab:CreateToggle({
    Name = "Toggle Sprint (Q)",
    CurrentValue = false,
    Callback = function(state) ToggleSprint(state, false) end
})

NBeastTab:CreateToggle({
    Name = "Infinite Double Jump",
    CurrentValue = false,
    Callback = function(state)
        getgenv().InfJump = state
        if state then
            getgenv().JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if getgenv().InfJump then
                    LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 36, 0)
                end
            end)
        else
            if getgenv().JumpConnection then getgenv().JumpConnection:Disconnect() end
        end
    end
})

local hackConnection

NBeastTab:CreateToggle({
    Name = "Anti PC Fail",
    CurrentValue = false,
    Callback = function(state)
        local TempStats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        if not TempStats then return end

        local TimingGoal = TempStats:FindFirstChild("TimingGoalPosition")
        local ActionProgress = TempStats:FindFirstChild("ActionProgress")
        local OnTrigger = TempStats:FindFirstChild("OnTrigger")
        local ActionInput = TempStats:FindFirstChild("ActionInput")
        local Remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

        if state then
            hackConnection = TimingGoal.Changed:Connect(function()
                local v1 = TimingGoal.Value
                if v1 > 0 then
                    task.spawn(function()
                        local progress = ActionProgress and ActionProgress.Value or 0
                        local speed = 360 / (-1 * progress + 2)
                        local randomHitOffset = math.random(30, 60)
                        local targetAngle = v1 + randomHitOffset
                        local waitTime = targetAngle / speed
                        
                        local hasFired = false
                        
                        -- FALLBACK!
                        task.delay(1.5, function()
                            if not hasFired and OnTrigger and OnTrigger.Value == true then
                                hasFired = true
                                if ActionInput then ActionInput.Value = true end
                                Remote:FireServer("SetPlayerMinigameResult", true)
                            end
                        end)

                        task.wait(0.4 + waitTime)

                        if not hasFired then
                            hasFired = true
                            if ActionInput then ActionInput.Value = true end
                            Remote:FireServer("SetPlayerMinigameResult", true)
                        end
                    end)
                end
            end)
        else
            if hackConnection then
                hackConnection:Disconnect()
                hackConnection = nil
            end
        end
    end
})

--[[
NBeastTab:CreateToggle({
    Name = "Auto-Free Survivors",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoFree = state
        task.spawn(function()
            while getgenv().AutoFree do
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "ActionSign" and v.Value == 31 then -- 31 = "Free"
                        local trigger = v.Parent:FindFirstChild("Event")
                        if trigger then
                            RemoteEvent:FireServer("Input", "Trigger", true, trigger)
                            task.wait(0.2)
                            RemoteEvent:FireServer("Input", "Trigger", false, trigger)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    end
})]]


PlayerTab:CreateSection("Local Player")
PlayerTab:CreateButton({
    Name = "Respawn",
    Callback = function()
        if LocalPlayer.Character then LocalPlayer.Character:Destroy() end
    end
})

PlayerTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        Nova.Notify({Title = "Rejoining", Text = "Attempting to rejoin..."})
        local TeleportService = game:GetService("TeleportService")
        pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
    end
})

-- Anti AFK Kick
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

Nova.Notify({Title = "Nova UI Loaded", Text = "Welcome to Flee the Facility!", Duration = 4})
