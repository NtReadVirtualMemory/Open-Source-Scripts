local reloadFunction
local function New_Reload()
    setupvalue(reloadFunction, 2, 100)
    setupvalue(reloadFunction, 3, 100)
    return true;
end

local function RemoveCooldown(targetFunction)
    while wait() do
        local upvalues = debug.getupvalues(targetFunction)
        if type(upvalues[3]) == "boolean" then
            setupvalue(targetFunction, 3, false)
        end
    end
end

local function GetRPGScript()
    local character = game.Players.LocalPlayer.Character
    local backpack = game.Players.LocalPlayer.Backpack
    local rpg = character:FindFirstChild("RPG") or backpack:FindFirstChild("RPG")
    return rpg and rpg:FindFirstChild("RifleScript") or "NO_SCRIPT_FOUND"
end

local RPGScript = GetRPGScript()

if RPGScript == "NO_SCRIPT_FOUND" then
    warn("No RPG Found!")
    return
end

for i,targetFunction in pairs(getgc(true)) do
    if type(targetFunction) == "function" and getfenv(targetFunction).script == RPGScript then
        if getinfo(targetFunction).name == "Reload" then
            reloadFunction = targetFunction
            hookfunction(targetFunction, New_Reload)
        end

        if type(debug.getupvalues(targetFunction)[3]) == "boolean" then
            task.spawn(function()
                RemoveCooldown(targetFunction)
            end)
        end
    end
end
print("Made by ntopenprocess / 0x108") 
print("Thanks to evildragon0000 for the Idea :D")
