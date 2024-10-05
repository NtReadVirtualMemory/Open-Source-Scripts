function ModifyCar()
	local Car = game.Workspace:FindFirstChild("ObjectSelection"):FindFirstChild(game.Players.LocalPlayer.Name.."'s Vehicle")
	if Car then
		if Car:FindFirstChild("Settings") then
          local Settings = require(Car:FindFirstChild("Settings"))


          -- These are Example Values, change them how you like --
      		Settings.Bounce = 120
      		Settings.Height = 3.5
      		Settings.Suspension = 15
      		Settings.TurnSpeed = 1.7
      		Settings.Sway = 15
      		Settings.Torque = 0.25
      		Settings.MaxSpeed = 110
      		Settings.BrakeForce = 0.8
      		Settings.SpeedDecay = 0.1
      		Settings.Boost = true
      		Settings.BoostParticles = "LeftRight"
      		Settings.Drift = true
      		Settings.VelLerp = 0.1
      		Settings.RotLerp = 0.075
      		Settings.DriftVelLerp = 0.05
      		Settings.DriftRotLerp = 0.1
      		Settings.HideCharacter = true
      		Settings.CameraOffset = 26
      
      	end
    end
end

game.Workspace.ObjectSelection.ChildAdded:Connect(function(Child)
	if Child.Name == game.Players.LocalPlayer.Name.."'s Vehicle" then
		ModifyCar()
	end
end)

-- Call if the Car Exists already --
ModifyCar()
