
local IS_ARRESTING_ALIVE = true

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


game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")

game:GetService("RunService").RenderStepped:Connect(function()
    if IS_ARRESTING_ALIVE == true then
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
	   game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Handcuffs").Parent = game:GetService("Players").LocalPlayer.Character
	end
    end
end)

for i = 1,100 do
   print("Made by NtOpenProcess and deni210 (on dc)")
end

for i,v in pairs(game.Players:GetChildren()) do
	Arrest(v)
end

IS_ARRESTING_ALIVE = false
