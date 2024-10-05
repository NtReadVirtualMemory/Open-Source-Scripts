repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

wait(2)

if _G.AutoArrest == true then warn("Auto Arrest already loaded.") return nil end

_G.AutoArrest = true
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/NtReadVirtualMemory/Open-Source-Scripts/refs/heads/main/Mad%20City%20Chapter%201/Auto%20Arrest%20Serverhop.lua'))()")


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

game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Died:Connect(function()
    shop()
end)

if game.Players.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
	game.Players.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
end

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

function ArrestAble(Player)
	if Player:IsA("Player") and Player ~= game.Players.LocalPlayer then
		if Player.Team == game:GetService("Teams"):FindFirstChild("Criminals") or Player.Team == game:GetService("Teams"):FindFirstChild("Villains") then
			return true
		else
			return false
		end
	end
end

function Arrest(Player)
	if Player:IsA("Player") and Player ~= game.Players.LocalPlayer and ArrestAble(Player) then
		local Character = Player.Character
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

		tp(HumanoidRootPart.Position.x,HumanoidRootPart.Position.y,HumanoidRootPart.Position.z)

		local Count = 0

		while true do
			if Count > 100 then
				break
			end
			
			if ArrestAble(Player) == false then
				break
			end

			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(HumanoidRootPart.Position.x,HumanoidRootPart.Position.y,HumanoidRootPart.Position.z)
			game:GetService("ReplicatedStorage").Event:FireServer("Arrest", Player)
			task.wait(0.01)

			Count = Count + 1

						
			if ArrestAble(Player) == false then
				break
			end

		end
	end
end


for i = 1,100 do
   print("Made by NtOpenProcess and deni210 (on dc)")
end

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")

wait(2)

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Handcuffs").Parent = game:GetService("Players").LocalPlayer.Character
    end
end)

for i,v in pairs(game.Players:GetChildren()) do
	Arrest(v)
end

task.wait(1)

shop()
