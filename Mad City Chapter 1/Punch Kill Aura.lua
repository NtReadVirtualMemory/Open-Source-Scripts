local function CalculateDistance(player1, player2)
    local character1 = player1.Character
    local character2 = player2.Character
    
    if player1 == player2 then
        return nil
    end

    if character1 and character2 then
        local hrp1 = character1:FindFirstChild("HumanoidRootPart")
        local hrp2 = character2:FindFirstChild("HumanoidRootPart")
        
        if hrp1 and hrp2 then
            local distance = (hrp1.Position - hrp2.Position).Magnitude
            return distance
        end
    end

    return nil
end

local MsgDB = false
local Player = game.Players.LocalPlayer
function CheckTeam(Plr)
	if Plr ~= nil then
		if Player.TeamColor == BrickColor.new("Bright blue") and Plr.TeamColor == BrickColor.new("Bright orange") then
			local Char = Plr.Character
			if Char and not Char:findFirstChild("PrisonCrime") and not Char:findFirstChild("RestrictedArea") and not MsgDB then
				MsgDB = true
				spawn(function()
					wait(2)
					MsgDB = false
				end)
			end
		end
		if Player.TeamColor == BrickColor.new("Bright yellow") and Plr.TeamColor == BrickColor.new("Bright orange") then
			local Char = Plr.Character
			if Char and not Char:findFirstChild("PrisonCrime") and not Char:findFirstChild("RestrictedArea") and not MsgDB then
				MsgDB = true
				spawn(function()
					wait(2)
					MsgDB = false
				end)
			end
		end
		if Player.TeamColor == BrickColor.new("Bright blue") and (Plr.TeamColor == BrickColor.new("Bright red") or Plr.TeamColor == BrickColor.new("Bright orange") or Plr.TeamColor == BrickColor.new("Bright violet")) then
			return true
		elseif Player.TeamColor == BrickColor.new("Bright orange") and (Plr.TeamColor == BrickColor.new("Bright blue") or Plr.TeamColor == BrickColor.new("Bright yellow")) then
			return true
		elseif Player.TeamColor == BrickColor.new("Bright red") and (Plr.TeamColor == BrickColor.new("Bright blue") or Plr.TeamColor == BrickColor.new("Bright yellow")) then
			return true
		elseif Player.TeamColor == BrickColor.new("Bright violet") and (Plr.TeamColor == BrickColor.new("Bright blue") or Plr.TeamColor == BrickColor.new("Bright yellow")) then
			return true
		elseif Player.TeamColor == BrickColor.new("Bright yellow") and (Plr.TeamColor == BrickColor.new("Bright red") or Plr.TeamColor == BrickColor.new("Bright orange") or Plr.TeamColor == BrickColor.new("Bright violet")) then
			return true
		else
			return false
		end
	else
		return true
	end
end

while wait(0.05) do
    for i,v in pairs(game.Players:GetChildren()) do
        local Distance = CalculateDistance(game.Players.LocalPlayer, v)
        if Distance then
            if Distance < 7 and CheckTeam(v) then
                if v.Character:FindFirstChild("Humanoid") then
                    if v.Character:FindFirstChild("Humanoid").Health > 0 then
                        game:GetService("ReplicatedStorage").Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                    end
                end
            end
        end
    end
end

print("Made by ntopenprocess / 0x108") 
