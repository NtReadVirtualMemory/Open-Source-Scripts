local Shotgun = game.Players.LocalPlayer.Character:FindFirstChild("Shotgun") or game.Players.LocalPlayer.Backpack:FindFirstChild("Shotgun")

if Shotgun == nil then
    warn("Unable to Find a Shotgun.")
    return "Unable to Find a Shotgun."
end

function New_RayCheck()
    return true
end

for i,vgetgc in pairs(getgc(true)) do
    if type(vgetgc) == "function" and getfenv(vgetgc).script == Shotgun:FindFirstChild("ShotgunScript") then
        if getinfo(vgetgc).name == "RayCheck" then
            hookfunction(vgetgc, New_RayCheck)
        end 
        if getinfo(vgetgc).name == "Reload" then

            --[[
            
              1 IsReloading
              2. Current Ammo
              3. Max Ammo
              4. Equipped? (Im unsure about this one) - Dont make true because it breaks the Shotgun!

            ]]

            setupvalue(vgetgc, 1, false)
            setupvalue(vgetgc, 2, math.huge)
            setupvalue(vgetgc, 3, math.huge)
            setupvalue(vgetgc, 4, false)
        end 

    end
end

for i,vgetgc in pairs(getgc(true)) do
    if type(vgetgc) == "function" and getfenv(vgetgc).script == game:GetService("ReplicatedStorage").Modules.WeaponCore then
        if getinfo(vgetgc).name == "ShootShotgun" then
            setconstant(vgetgc, 80, 1000) -- // ray - unit multiplier (Max Distance)
            setconstant(vgetgc, 147, 1) -- // Bypass the XOR when not elseif part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "HumanoidRootPart" then
            setconstant(vgetgc, 143, 10) -- // Damage Multiplier on Head
        end
    end
end 


print("Made by ntopenprocess / 0x108") 
