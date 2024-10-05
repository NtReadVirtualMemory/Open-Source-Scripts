function New_HoldProgress()
    return true
end

function LoadBypass()
    task.spawn(function()
        for i,vgetgc in pairs(getgc(true)) do
              if type(vgetgc) == "function" and getinfo(vgetgc).name == "HoldProgress" then
                  hookfunction(vgetgc, New_HoldProgress)
            end
        end 
    end)    
end

LoadBypass()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(10)
    LoadBypass()
end)

print("Made by ntopenprocess / 0x108") 
