-- well its not done yet but i dont see the point of acually finishing it. feel free to skid it :)

-- dont change this Table --
local RobAble = {
	Bank = true,
	Jewel = true,
	Pyramid = true,
	Club = true,
	Casino = true
}

function LockHeist(Heist)
    RobAble[Heist] = false
end

function UnLockHeist(Heist)
    RobAble[Heist] = true
end

function IsHeistLocked(Heist)
    return not RobAble[Heist]
end

function CheckHeist(Heist)
    if game:GetService("ReplicatedStorage").HeistStatus:FindFirstChild(Heist) then
        return not game:GetService("ReplicatedStorage").HeistStatus:FindFirstChild(Heist):FindFirstChild("Locked").Value
    end
end

function AnythingRobAble()
    local s = false

    for i,v in pairs(RobAble) do
        if v == true and CheckHeist(i) then
            s = true
        end
    end
    
    return s
end

for i,v in pairs(game:GetService("ReplicatedStorage").HeistStatus:GetChildren()) do
    v:FindFirstChild("Locked").Changed:Connect(function()
        if v:FindFirstChild("Locked").Value == true then
            UnLockHeist(v.Name)
        end
    end)
end



function WaitUntilCash(Ammount)
    local Ammount_Number = 0
	local callamount = 0
	local kek = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text, "%$", "")
	local startamount = tonumber(kek or 0)
    repeat wait(0.5)
        local RemoveWEirdCharacter = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text, "%$", "")
        Ammount_Number = tonumber(RemoveWEirdCharacter)    
		callamount = callamount + 1
		if callamount == 22 and Ammount_Number == startamount then break end 
    until Ammount_Number >= Ammount
end

function ResetToBeSure()
    game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "0"
end

if game.Players.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
	game.Players.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
end

-- Thanks to Deni210 <3
local function tp(x,y,z)

    game:GetService("Players").LocalPlayer.CriminalMarker.Value = false
    
    Game.Workspace.Pyramid.Tele.Core2.CanCollide = false
    Game.Workspace.Pyramid.Tele.Core2.Transparency = 1
    Game.Workspace.Pyramid.Tele.Core2.CFrame = Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    task.wait()
    Game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
    Game.Workspace.Pyramid.Tele.Core2.Transparency = 0
    Game.Workspace.Pyramid.Tele.Core2.CanCollide = true
    task.wait()
    for i = 1, 45 do
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
        task.wait()
    end
end

function Jewel()
    if CheckHeist("Jewel") == true and IsHeistLocked("Jewel") == false then
        tp(-81.6908951, 82.7215195, 804.913574, -0.374641657) -- Jewelry open (Vent)

        task.wait(1)

        for i,v in pairs(workspace.JewelryStore.JewelryBoxes:GetChildren()) do
            task.spawn(function()
                for i = 1,5 do
                    workspace.JewelryStore.JewelryBoxes.JewelryManager.Event:FireServer(v)
                end
            end)
        end

        task.wait(0.1)
        LockHeist("Jewel")
    end
end

function Pyramid()
    if CheckHeist("Pyramid") == true and IsHeistLocked("Pyramid") == false then

        tp(-1047.58899, 18.2789993, -479.790009)

        wait(2)

        tp(999, 51073, 539)

        WaitUntilCash(7500)
        LockHeist("Pyramid")
    end
end

function Club()
    if CheckHeist("Club") == true and IsHeistLocked("Club") == false then
        tp(1367.01428, 46.4838715, -153.158661)

        wait(1)

        -- these Retards dont have a check if the Button is Pressed on the Door

        tp(1329, 148, -128)

        -- done ez

        WaitUntilCash(6000)

        LockHeist("Club")

    end
end

function Bank()

    if CheckHeist("Bank") == true and IsHeistLocked("Bank") == false then
        tp(673, 83, 562)

        wait(2)

        tp(645, 86, 573)

        wait(2)

        tp(680, 84, 580)

        WaitUntilCash(3000)
        LockHeist("Bank")
    end
end

function Casino()

    if CheckHeist("Casino") == true and IsHeistLocked("Casino") == false then
        if (workspace.ObjectSelection.HackComputer:FindFirstChild("HackComputer")) then
            tp(1697, 38, 746)
    
            wait(1)
        
            workspace.ObjectSelection.HackComputer.HackComputer.HackComputer.Event:FireServer()
        end
    
    
    
        wait(1)
        local Lever = workspace.ObjectSelection.Lever3
        if Lever.Open.Value == false then
            tp(Lever.Lever.Position.X,Lever.Lever.Position.Y, Lever.Lever.Position.Z )
            wait()
            Lever.Lever.Lever.Event:FireServer()
        end
    
        wait()
        local Lever = workspace.ObjectSelection.Lever2
        if Lever.Open.Value == false then
            tp(Lever.Lever.Position.X,Lever.Lever.Position.Y, Lever.Lever.Position.Z )
            wait()
            Lever.Lever.Lever.Event:FireServer()
        end
    
        wait()
        local Lever = workspace.ObjectSelection.Lever1
        if Lever.Open.Value == false then
            tp(Lever.Lever.Position.X,Lever.Lever.Position.Y, Lever.Lever.Position.Z )
            wait()
            Lever.Lever.Lever.Event:FireServer()
        end
    
        wait()
        local Lever = workspace.ObjectSelection.Lever4
        if Lever.Open.Value == false then
            tp(Lever.Lever.Position.X,Lever.Lever.Position.Y, Lever.Lever.Position.Z )
            wait()
            Lever.Lever.Lever.Event:FireServer()
        end
    
        wait(3)
    
        tp(1696, 41, 517)
    
        WaitUntilCash(4000)
        LockHeist("Casino")
    end
end

for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
	if string.find(string.lower(v.Name), "laser") then
		v:Destroy()
	end
end

function main()

    if (AnythingRobAble() == true) then
        Casino()
        ResetToBeSure()
        Jewel()
        ResetToBeSure()
        Pyramid()
        ResetToBeSure()
        Club()
        ResetToBeSure()
        Bank()

        tp(2112, 26, 424) -- Teleport to the Base

        wait(2)
    end


end

while wait(1) do 
    main()
end
