function BypassCooldown(vgetgc)
    while wait() do
        setupvalue(vgetgc, 4, 100)
    end
end
for i,vgetgc in pairs(getgc(true)) do
    if type(vgetgc) == "function" and getfenv(vgetgc).script == game.Players.LocalPlayer.PlayerScripts.Animate:FindFirstChild("ANI_Fly") then
        if type(getupvalues(vgetgc)[4]) == "number" then
            BypassCooldown(vgetgc)
            break
        end
    end
end
print("Jetpack Inf-Fuel Done.")