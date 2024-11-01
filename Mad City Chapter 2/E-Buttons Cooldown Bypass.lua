local InputBeganFunc
for i, vgetgc in pairs(getgc(true)) do
    if type(vgetgc) == "function" and getfenv(vgetgc).script == game:GetService("Players").LocalPlayer.PlayerScripts.Aero.Controllers.InteractionClient then
        if getinfo(vgetgc).name == "InputBegan" then
            InputBeganFunc = vgetgc
        end
    end
end

function RemoveCooldown()
	local InteractionDataTable = debug.getupvalues(InputBeganFunc)[3]
	if InteractionDataTable ~= nil and type(InteractionDataTable) == "table" then

		-- local InteractionID = InteractionDataTable["ID"]
		-- local InteractionName = InteractionDataTable["Name"]
		-- local InteractionObject = InteractionDataTable["OriginObject"]
		-- local InteractionSecounds = InteractionDataTable["Seconds"]

		InteractionDataTable["Seconds"] = 0.1 -- they have a check if the Seconds is 0 but i dont have a decompiler so i cant bypass it :D
	else
		RemoveCooldown()
	end
end

-- We could just hook the InputBegan and shit but i dont see the point of doing it :)
game:GetService("Players").LocalPlayer.PlayerGui.Interactions.ChildAdded:Connect(function()
	RemoveCooldown()
end)
print("Made by ntopenprocess / 0x108") 
