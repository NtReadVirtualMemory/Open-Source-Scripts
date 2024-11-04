local function Find_ClientCore()
    for i, instance in pairs(getnilinstances()) do
        if instance.ClassName == "ModuleScript" then
            local success, result = pcall(function()
                if require(instance)["Framerate"] ~= nil then
                    return instance
                end
            end)
            if success and result then
                return result
            end
        end
    end
end

function DecryptObjects(DataTable)
    for RealName, Obj in pairs(DataTable) do
        Obj.Changed:Connect(function()
            Obj.Name = RealName
        end)
    end
end

-- Check "game:GetService("ReplicatedFirst").ClientLoader" for more Information
local moduleScript = Find_ClientCore()
for _, gcObject in pairs(getgc(true)) do
    if type(gcObject) == "function" and getfenv(gcObject).script == moduleScript then
        if debug.getinfo(gcObject).name == "Step" then
            for i, upvalue in pairs(debug.getupvalues(gcObject)) do
                --// at i (index) 2 there is an Weird BindableEvent, maybe you need that for something?
                --// i haven't fully reversed it yet since i dont have a good decompiler.
                if type(upvalue) == "table" then
                    if i == 4 then
                        DecryptObjects(upvalue)
                    end 
                end
            end
        end
    end
end
print("Made by NtOpenProcess / 0x108")
