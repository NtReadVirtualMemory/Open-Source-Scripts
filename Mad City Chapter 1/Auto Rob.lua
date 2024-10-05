repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

wait(2)

if _G.AutoRob == true then warn("Auto Rob already loaded.") return nil end

_G.AutoRob = true
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/NtReadVirtualMemory/Open-Source-Scripts/refs/heads/main/Mad%20City%20Chapter%201/Auto%20Rob.lua'))()")

for i = 1,100 do
   print("Made by NtOpenProcess and deni210 (on dc)")
end

function shop()
    local a,b = pcall(function()

        local servers = {}
        local req = request({Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"})
        local body = game:GetService("HttpService"):JSONDecode(req.Body)
    
        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end
    
        print(#servers)
        if #servers > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        else
            if #game.Players:GetChildren() <= 1 then
                Players.LocalPlayer:Kick("\nRejoining...")
                wait()
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            else
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
            end
        end
    
    end)
    
    print(a,b)

    if not a then
        shop()
    end 

    task.spawn(function()
        while wait(5) do
            shop()
        end
    end)
end

wait(1)

game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Died:Connect(function()
    shop()
end)

if game.Players.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
	game.Players.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
end
local function tp(x,y,z)
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


local MiniRobberies = {
    "Cash",
    "CashRegister",
    "DiamondBox",
    "Laptop",
    "Phone",
    "Luggage",
    "ATM",
    "TV",
    "Safe"
}
local function getevent(v)
	for i, v in next, v:GetDescendants() do
		if not v:IsA("RemoteEvent") then continue end
		return v
	end
end

local function getrobbery()
    for i, v in next, workspace.ObjectSelection:GetChildren() do
		if not table.find(MiniRobberies, v.Name) then continue end
		if v:FindFirstChild("Nope") then continue end
		if not getevent(v) then continue end
		return v
    end
end

tp(-82, 86, 807)
task.wait(0.5)
for i,v in pairs(workspace.JewelryStore.JewelryBoxes:GetChildren()) do
    task.spawn(function()
        for i = 1,5 do
            workspace.JewelryStore.JewelryBoxes.JewelryManager.Event:FireServer(v)
        end
    end)
end
task.wait(2)
tp(2115, 26, 420)
task.wait(1)
repeat
	local robbery = getrobbery()
	if robbery then
		for i = 1, 20 do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(robbery:GetPivot().Position.x,robbery:GetPivot().Position.y + 5,robbery:GetPivot().Position.z)
			getevent(robbery):FireServer()
			task.wait()
		end
	end
until getrobbery() == nil

task.wait(1)

shop()
