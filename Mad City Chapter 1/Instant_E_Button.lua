function New_HoldProgress()
    return true
end

function LoadBypass()
    task.spawn(function()
        while true do
            for i,vgetgc in pairs(getgc(true)) do
                  if type(vgetgc) == "function" and getinfo(vgetgc).name == "HoldProgress" then
                      hookfunction(vgetgc, New_HoldProgress)
                  end
              end 
            wait(5)       
        end
    end)    
end

LoadBypass()

print("Made by ntopenprocess / 0x108") 
