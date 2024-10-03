local Data = {
    Loaded = true,
    Stats = {
      MilesDriven = 0,
      CriminalsArrested = 0,
      CopsKilled = 0,
      TimePlayed = 0,
      EscapedPrison = 0,
      CriminalsKilled = 0,
      Heists = 0
    },
    Data = {
      Items = {
        "Camaro", "Helicopter", "Boat", 
        "Nero", "Fury", "Avenger", "Stingray", "Roadster", "Night Rider", "Light Bike", "Rhino",
        "Challenger", "Hydro", "Jetski", "Overdrive", "Thunderbird", "Mustang", "Tracer", "GTR", 
        "Cruiser", "Inferno", "Dominator", "Plane", "Buzzard", "Scout", "Falcon",
        "Nighthawk", "Warhawk", "Shelby", "911", "Smart","ATV", "Vapid", "Patriot"
      },
      Cars = {
        Camaro = {
          Paint = "S56",
          Spoiler = "SP1",
          Rims = "R1",
          Engine = "EN1",
          RimPaint = "RC1",
          WindowPaint = "WC9",
          Underglow = "UG1",
          SpoilerPaint = "SPC1",
          Suspension = "SU1"
        }
      },
      Skins = {
        Shotgun = "SHO1",
        Deagle = "DE1",
        Sniper = "SN1",
        Baton = "BA1",
        AK47 = "AK1",
        MP5 = "MP1",
        Pistol = "PIS1",
        SCAR = "SC1",
        TEC9 = "TE1",
        RPG = "RPG1",
        Bat = "BAT1",
        Knife = "KN1",
        AWP = "AWP1",
        SPAS = "SPAS1",
        M4A1 = "M41"
      },
      Season = 4,
      XP = 0,
      Cash = 0
    },
    Codes = {}
}

function LoadBypass()
    task.spawn(function()
        while true do
            for i,vgetgc in pairs(getgc(true)) do
                if type(vgetgc) == "function" and getinfo(vgetgc).name == "DataFetch" and getfenv(vgetgc).script == game.Players.LocalPlayer.Character.UI.UI_Main then
                    for i,v in pairs(getupvalues(vgetgc)) do
                        if type(v) == "table" then
                            setupvalue(vgetgc, i, Data)
                        end
                    end  
                end
            end 
            wait(5)       
        end
    end)    
end

LoadBypass()

print("Made by ntopenprocess / 0x108") 
