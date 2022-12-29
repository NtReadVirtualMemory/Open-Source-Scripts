local NotificationTable = {};
local Done = true;
local TweenService = game:GetService("TweenService");
local TemplateName = {}

local function Debug(...)
    if getgenv().DebugEnabled and game:GetService("Players").LocalPlayer then
        rconsolename("Data".."_"..tostring(game.PlaceId))
        local Args = {...}
        local Str = "";
        for _,Arg in next, Args do
            Str = Str .. " " ..tostring(Arg)
        end
        rconsolewarn(Str)
        wait(1.5)
    end
end

local function CheckAd()
	if getgenv then
		if not getgenv()["IrisAd"] then
			getgenv()["IrisAd"] = true;
			NotificationTable.Notify("{ Iris }", "Thank you for using IrisNotify, consider donating! <b><font color=\"rgb(184,83,255)\">PayPal.me/IrisDev</font></b>", "rbxassetid://7258709020", {
				Duration = 7,
				TitleSettings = {
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = Enum.Font.SourceSansSemibold,
				},

				GradientSettings = {
					GradientEnabled = false,
					SolidColorEnabled = true,
					SolidColor = Color3.fromRGB(124, 83, 240),
					Retract = true
				}
			})
			wait(.3)
			NotificationTable.Notify("{ Iris }", "To remove this message add <b><font color=\"rgb(184,83,255)\">getgenv()[\"IrisAd\"] = true</font></b> to your script!", "rbxassetid://7258714296", {
				Duration = 7,
				TitleSettings = {
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = Enum.Font.SourceSansSemibold,
				},

				GradientSettings = {
					GradientEnabled = false,
					SolidColorEnabled = true,
					SolidColor = Color3.fromRGB(124, 83, 240),
					Retract = true
				}
			})
		end
	else
		if not _G["IrisAd"] then
			_G["IrisAd"] = true;
			NotificationTable.Notify("{ Iris }", "Thank you for using IrisNotify, consider donating! <b><font color=\"rgb(184,83,255)\">PayPal.me/IrisDev</font></b>", "rbxassetid://7258709020", {
				Duration = 7,
				TitleSettings = {
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = Enum.Font.SourceSansSemibold,
				},

				GradientSettings = {
					GradientEnabled = false,
					SolidColorEnabled = true,
					SolidColor = Color3.fromRGB(124, 83, 240),
					Retract = true
				}
			})
			wait(.3)
			NotificationTable.Notify("{ Iris }", "To remove this message add <b><font color=\"rgb(184,83,255)\">_G[\"IrisAd\"] = true</font></b> to your script!", "rbxassetid://7258714296", {
				Duration = 7,
				TitleSettings = {
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = Enum.Font.SourceSansSemibold,
				},
				
				GradientSettings = {
					GradientEnabled = false,
					SolidColorEnabled = true,
					SolidColor = Color3.fromRGB(124, 83, 240),
					Retract = true
				}
			})
		end
	end
	wait()
end

local function CreateNormalNotificationArguments()
	local ArgFour = {
		Duration = 4,

		TitleSettings = {
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 18.000,
			Font = Enum.Font.SourceSansBold,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		},

		DescriptionSettings = {
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 14.000,
			Font = Enum.Font.SourceSans,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		},

		IconSettings = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),				
		},

		GradientSettings = {
			GradientEnabled = true,
			SolidColorEnabled = false,
			SolidColor = Color3.fromRGB(0,255,255),
			Retract = false,
			Extend = false
		},

		Main = {
			BorderColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BackgroundTransparency = 0.050,
			Rounding = true,
			BorderSizePixel = 1
		}
	}

	return ArgFour;
end

local function RandomName(Size)
	local String = "";
	local Alphabet = {"{","}","[","]","(",")","/","\","'","\"","'","~",",",";",":",".","<",">","@","#","$","%","1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}

	for i = 1, Size do
		String = String .. Alphabet[math.random(#Alphabet)]
	end

	return String;
end

local NotificationFolder = Instance.new("Folder");

NotificationTable.CreateNotification = function(TitleData, Text, Image, Settings)

    Debug("CREATED_",TitleData, Text, Image, Settings)
	local Duration = Settings.Duration;
	local TitleSettings = Settings.TitleSettings;
	local DescriptionSettings = Settings.DescriptionSettings;
	local IconSettings = Settings.IconSettings;
	local GradientSettings = Settings.GradientSettings;
	local MainSettings = Settings.Main;
	
    Debug("Running Parent")
	if getgenv then
        Debug("GetGenv Detected")
		if (game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("NotificationFrame"):FindFirstChild("NotificationFolder")) then
            Debug("NotifFolder Detected")
			NotificationFolder = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("NotificationFrame"):FindFirstChild("NotificationFolder");
		else
            Debug("Creating NotifFolder")
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("NotificationFrame");
		end
	else
        Debug("Roblox Client Detected")
		if (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder")) then
			NotificationFolder = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder");
		else
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("Players").LocalPlayer.PlayerGui;
		end
	end

    Debug("Creating Notif Instances")
	local Notification = Instance.new("ScreenGui")
	local _Template = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Title = Instance.new("TextLabel")
	local TextLabel = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")


    Debug("Setting main Parent/Name")
	Notification.Name = RandomName(15)
    Debug("Main 1/4")
    
    if hookmetamethod then
        local a;a=hookmetamethod(game,"__index",function(...)local self,b=...if self==Notification and not checkcaller()then if tostring(b)=="Name"then return"CoreGui"end end;return a(...)end)
    end
    
	Notification.Parent = NotificationFolder
    Debug("Main 2/4")
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Debug("Main 3/4")
	Notification.Enabled = true;
    Debug("Main 4/4")

    if getgenv().DevBuild then
        TemplateName[_Template] = RandomName(15) .. "_";
        _Template.Name = TemplateName[_Template]
    else
        _Template.Name = "_Template";
    end
    Debug("_Temp 1/9")
	_Template.BackgroundColor3 = MainSettings.BackgroundColor3
    Debug("_Temp 2/9")
	_Template.BackgroundTransparency = MainSettings.BackgroundTransparency
    Debug("_Temp 3/9")
	_Template.BorderColor3 = MainSettings.BorderColor3
    Debug("_Temp 4/9")
	_Template.Position = UDim2.new(0.713929176, 0, 0.587826073, 0)
    Debug("_Temp 5/9")
	_Template.Size = UDim2.new(0, 270, 0, 64)
    Debug("_Temp 6/9")
	_Template.ZIndex = 9
    Debug("_Temp 7/9")
	_Template.Visible = false;
    Debug("_Temp 8/9")
	_Template.Parent = Notification
    Debug("_Temp 9/9")
    Debug("_Temp finished")
    
	Icon.Name = "Icon"
	Icon.Parent = _Template
	Icon.BackgroundColor3 = IconSettings.BackgroundColor3
	Icon.BackgroundTransparency = IconSettings.BackgroundTransparency
	Icon.Position = UDim2.new(0.0277603213, 0, 0.182097465, 0)
	Icon.Size = UDim2.new(0, 40, 0, 40)
	Icon.Image = Image
    Debug("Icon finished")

	UIAspectRatioConstraint.Parent = Icon
    Debug("UiAspect finished")

	Title.Name = "Title"
	Title.Parent = _Template
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 63, 0, 2)
	Title.Size = UDim2.new(0, 129, 0, 21)
	Title.Text = TitleData
	Title.TextColor3 = TitleSettings.TextColor3
	Title.TextScaled = TitleSettings.TextScaled
	Title.TextSize = TitleSettings.TextSize
	Title.TextWrapped = TitleSettings.TextWrapped
	Title.TextXAlignment = TitleSettings.TextXAlignment
	Title.TextYAlignment = TitleSettings.TextYAlignment
	Title.Font = TitleSettings.Font
	Title.BackgroundColor3 = TitleSettings.BackgroundColor3
	Title.RichText = true
    Debug("Title finished")

	TextLabel.Parent = _Template
	TextLabel.BackgroundColor3 = DescriptionSettings.BackgroundColor3
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 63, 0, 23)
	TextLabel.Size = UDim2.new(0, 178, 0, 35)
	TextLabel.Text = Text
	TextLabel.TextColor3 = DescriptionSettings.TextColor3
	TextLabel.TextScaled = DescriptionSettings.TextScaled
	TextLabel.TextSize = DescriptionSettings.TextSize
	TextLabel.TextWrapped = DescriptionSettings.TextWrapped
	TextLabel.TextXAlignment = DescriptionSettings.TextXAlignment
	TextLabel.TextYAlignment = DescriptionSettings.TextYAlignment
	TextLabel.Font = DescriptionSettings.Font
	TextLabel.BackgroundColor3 = DescriptionSettings.BackgroundColor3
	TextLabel.RichText = true
    Debug("TextLanel finished")

	if MainSettings.Rounding then
		UICorner.Parent = _Template
	end
    Debug("Rounding finished")

	Frame.Parent = _Template
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0,0,1,-3)
	Frame.Size = UDim2.new(0, 263, 0, 3)
	Frame.Visible = false;
    Debug("Frame finished")

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 8, 231)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(64, 0, 255))}
	UIGradient.Parent = Frame
    Debug("Gradient finished")

	if GradientSettings.GradientEnabled then
		Frame.Visible = true
	elseif GradientSettings.SolidColor then
		UIGradient:Destroy();
		Frame.BackgroundColor3 = GradientSettings.SolidColor
		Frame.Visible = true
	end

    Debug("Returning Objects")
	return {_Template, Duration, GradientSettings.Retract, GradientSettings.Extend};
end

NotificationTable.InsertNotification = function(Notification, Duration, Retracting, Extending)
    Debug("Insert Called, waiting to run")
	repeat game:GetService("RunService").Heartbeat:Wait() until Done;

	local ShowPosition = UDim2.new(1, -280, 1, -70 * #NotificationFolder:GetChildren() - 1);
	local HidePosition = UDim2.new(1, 0, 1, 0);

	Notification.Position = HidePosition;
	Notification.Visible = true;

	local TweenInfData = TweenInfo.new(0.4);
	local TweenInfData2 = TweenInfo.new(Duration);

	TweenService:Create(Notification, TweenInfData, {
		Position = ShowPosition
	}):Play();

	if (Retracting) then

		TweenService:Create(Notification.Frame, TweenInfData2, {
			Size = UDim2.new(0, 0, 0, 3)
		}):Play();
	elseif (Extending) then
		Notification.Frame.Size = UDim2.new(0, 0, 0, 3);

		TweenService:Create(Notification.Frame, TweenInfData2, {
			Size = UDim2.new(0, 263, 0, 3)
		}):Play();
	end

	wait(TweenInfData2.Time);
	wait(TweenInfData.Time);

	Done = false
	local Tween = TweenService:Create(Notification, TweenInfData, {
		Position = HidePosition
	})

	Tween.Completed:Connect(function(State)
		if State == Enum.PlaybackState.Completed then
			Notification.Parent:Destroy();
			Done = true
		end
	end)

	Tween:Play();
end

NotificationTable.Notify = function(...)
	CheckAd();
	coroutine.wrap(function(...)
		local Args = {...};
        
        Debug("Notif started")
		assert(#Args < 5, "Error: Too many arguments for Notify | Expected 3 : 4");
		assert(#Args > 2, "Error: Too little arguments for Notify | Expected 3 : 4")

        Debug("Notif started", "Fixing Args")
		for Index,Argument in next, Args do
			if Index ~= 4 then
				Args[Index] = tostring(Argument);
			end
		end


        Debug("Arg 3 reset")
		if (#Args == 3) then
			Args[4] = CreateNormalNotificationArguments();
		end

        Debug("Arg 5 reset")
		Args[5] = CreateNormalNotificationArguments();

        Debug("Settings set")
		if (type(Args[4]) ~= "table") then
			warn("Settings table malformed, please make sure you have the exact table copied! { ARG4_INVALID_TABLE }");
			Args[4] = CreateNormalNotificationArguments();
		end

		for Property, Value in next, Args[4] do
			if type(Value) == "table" then
				for SubProperty, SubValue in next, Value do
					Args[5][Property][SubProperty] = SubValue;
				end
			else
				Args[5][Property] = Value
			end
		end

        Debug("Settings set done")

		local NotifFrame = NotificationTable.CreateNotification(Args[1], Args[2], Args[3], Args[5]);

        Debug("Finished creating", "Inserting")
		NotificationTable.InsertNotification(NotifFrame[1], NotifFrame[2], NotifFrame[3], NotifFrame[4]);
        Debug("Finished Inserting")
	end)(...)
end

-- { Wall Notifications } --

local WallNotificationFolder = Instance.new("Folder");

local function CreateWallArgs()
	local ArgThree = {
		Duration = 5,

		MainSettings = {
			Orientation = "Middle",
			VisibleSize = UDim2.new(0.96981132, 0, 0.947604775, 0);
			HiddenSize  = UDim2.new(0, 0, 0.947604775, 0),
			TweenTime 	= 0.8
		},

		TitleSettings = {
			Enabled = true,
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 18.000,
			Font = Enum.Font.SourceSansBold,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		},

		DescriptionSettings = {
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 14.000,
			Font = Enum.Font.SourceSans,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
	};
	return ArgThree;
end

NotificationTable.CreateWallNotification = function(TitleText, DescriptionText, Settings)

	local Duration = Settings.Duration;
	local TitleSettings = Settings.TitleSettings;
	local DescriptionSettings = Settings.DescriptionSettings;
	local MainSettings = Settings.MainSettings;

	if getgenv then
		if (game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("WallNotificationFolder")) then
			WallNotificationFolder = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("WallNotificationFolder");
		else
			WallNotificationFolder.Name = "WallNotificationFolder"
			WallNotificationFolder.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
		end
	else
		if (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WallNotificationFolder")) then
			WallNotificationFolder = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WallNotificationFolder");
		else
			WallNotificationFolder.Name = "WallNotificationFolder"
			WallNotificationFolder.Parent = game:GetService("Players").LocalPlayer.PlayerGui;
		end
	end

	local WallNotification = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Description = Instance.new("TextLabel")

	WallNotification.Name = "Notification"
	WallNotification.Parent = WallNotificationFolder
	WallNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	WallNotification.Enabled = true;

	Main.Name = "Main"
	Main.Parent = WallNotification
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.BackgroundTransparency = 0.200
	Main.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = MainSettings.HiddenSize;

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.267834008, 0, 0.0142180091, 0)
	Title.Size = UDim2.new(0.463035017, 0, 0.0805396363, 0)
	Title.Text = TitleText
	Title.TextColor3 = TitleSettings.TextColor3
	Title.TextScaled = TitleSettings.TextScaled
	Title.TextSize = TitleSettings.TextSize
	Title.TextWrapped = TitleSettings.TextWrapped
	Title.TextXAlignment = TitleSettings.TextXAlignment
	Title.TextYAlignment = TitleSettings.TextYAlignment
	Title.Font = TitleSettings.Font
	Title.BackgroundColor3 = TitleSettings.BackgroundColor3
	Title.Visible = TitleSettings.Enabled
	Title.RichText = true
	
	Description.Name = "Description"
	Description.Parent = Main
	Description.BackgroundTransparency = 1.000
	Description.Position = UDim2.new(0.0149156936, 0, 0.127962083, 0)
	Description.Size = UDim2.new(0.969520092, 0, 0.830963671, 0)
	Description.Text = DescriptionText
	Description.TextColor3 = DescriptionSettings.TextColor3
	Description.TextScaled = DescriptionSettings.TextScaled
	Description.TextSize = DescriptionSettings.TextSize
	Description.TextWrapped = DescriptionSettings.TextWrapped
	Description.TextXAlignment = DescriptionSettings.TextXAlignment
	Description.TextYAlignment = DescriptionSettings.TextYAlignment
	Description.Font = DescriptionSettings.Font
	Description.BackgroundColor3 = DescriptionSettings.BackgroundColor3
	Description.RichText = true
	
	Main.Visible = false;
	
	return {Main, Duration, MainSettings};
end

NotificationTable.InsertWallNotification = function(Notification, Duration, SettingsTable)
	local ShowSize = SettingsTable.VisibleSize;
	local HiddenSize = SettingsTable.HiddenSize;
	local PositionType = SettingsTable.Orientation;
	local TweenInfData = TweenInfo.new(SettingsTable.TweenTime);
		
	if PositionType == "Top" then
		Notification.Visible = true;
		Notification.Size = ShowSize;
		Notification.Position = UDim2.new(Notification.Position.X.Scale, Notification.Position.X.Offset, 0, -(Notification.Parent.AbsoluteSize.Y / 2) - 25)

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(.5, 0, .5, 0)
		}):Play()

		wait(TweenInfData.Time + Duration);

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(Notification.Position.X.Scale, Notification.Position.X.Offset, 0, -(Notification.Parent.AbsoluteSize.Y / 2) - 25)
		}):Play();

		wait(TweenInfData.Time);
	elseif PositionType == "Left" then
		Notification.Visible = true;
		Notification.Size = ShowSize;
		Notification.Position = UDim2.new(0, -(Notification.Parent.AbsoluteSize.X / 2), Notification.Position.Y.Scale, Notification.Position.Y.Offset)
		
		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(.5, 0, .5, 0)
		}):Play()

		wait(TweenInfData.Time + Duration);

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(0, -(Notification.Parent.AbsoluteSize.X / 2), Notification.Position.Y.Scale, Notification.Position.Y.Offset)
		}):Play();

		wait(TweenInfData.Time);
	elseif PositionType == "Right" then 
		Notification.Visible = true;
		Notification.Size = ShowSize;
		Notification.Position = UDim2.new(0, Notification.Parent.AbsoluteSize.X + Notification.AbsoluteSize.X / 2, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
		
		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(.5, 0, .5, 0)
		}):Play()

		wait(TweenInfData.Time + Duration);

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(0, Notification.Parent.AbsoluteSize.X + Notification.AbsoluteSize.X / 2, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
		}):Play();

		wait(TweenInfData.Time);
		
	elseif PositionType == "Bottom" then
		Notification.Visible = true;
		Notification.Size = ShowSize;
		Notification.Position = UDim2.new(Notification.Position.X.Scale, Notification.Position.X.Offset, 0, Notification.Parent.AbsoluteSize.Y + (Notification.AbsoluteSize.Y / 2))
		
		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(.5, 0, .5, 0)
		}):Play()

		wait(TweenInfData.Time + Duration);

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(Notification.Position.X.Scale, Notification.Position.X.Offset, 0, Notification.Parent.AbsoluteSize.Y + (Notification.AbsoluteSize.Y / 2))
		}):Play();

		wait(TweenInfData.Time);
		
	elseif PositionType == "Middle" then
		Notification.Visible = true;

		TweenInfData = TweenInfo.new(.8);

		TweenService:Create(Notification, TweenInfData, {
			Size = ShowSize
		}):Play();

		wait(TweenInfData.Time + Duration);

		TweenService:Create(Notification, TweenInfData, {
			Size = HiddenSize
		}):Play();

		wait(TweenInfData.Time);
	end

	Notification.Parent:Destroy();
end

NotificationTable.WallNotification = function(...)
	CheckAd();
	coroutine.wrap(function(...)
		local Args = {...};

		assert(#Args < 4, "Error: Too many arguments for WallNotification | Expected 2 : 3");
		assert(#Args > 1, "Error: Too little arguments for WallNotification | Expected 2 : 3")

		for Index,Argument in next, Args do
			if Index ~= 3 then
				Args[Index] = tostring(Argument);
			end
		end

		if (#Args == 2) then
			Args[3] = CreateWallArgs();
		end

		Args[4] = CreateWallArgs();

		if (type(Args[3]) ~= "table") then
			warn("Settings table malformed, please make sure you have the exact table copied! { ARG4_INVALID_TABLE }");
			Args[3] = CreateWallArgs();
		end

		for Property, Value in next, Args[3] do
			if type(Value) == "table" then
				for SubProperty, SubValue in next, Value do
					Args[4][Property][SubProperty] = SubValue;
				end
			else
				Args[4][Property] = Value
			end
		end


		local NotifFrame = NotificationTable.CreateWallNotification(Args[1], Args[2], Args[4]);

		NotificationTable.InsertWallNotification(NotifFrame[1], NotifFrame[2], NotifFrame[3]);
	end)(...)
end

NotificationTable.ClearOverride = function()
	CheckAd();
	for _, Folder in next, game:GetService("CoreGui"):FindFirstChild("RobloxGui"):GetChildren() do
		if Folder.Name:match("NotificationFolder") or Folder.Name:match("WallNotificationFolder") then
			Folder:Destroy();
		end
	end
	for _, Folder in next, game:GetService("Players").LocalPlayer.PlayerGui:GetChildren() do
		if Folder.Name:match("NotificationFolder") or Folder.Name:match("WallNotificationFolder") then
			Folder:Destroy();
		end
	end
end

return NotificationTable;
