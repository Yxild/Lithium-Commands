--[[
    Main Module for Lithium Command Interface
]]

local Library = {	}
local PoppinsFont = Font.fromId(11702779409)

local Services = {
	TweenService = game:GetService("TweenService"),
	UserInputService = game:GetService("UserInputService"),
	HttpService = game:GetService("HttpService")
}

local Keybinds = {
	KillKeybind = nil,
	OpenKeybind = nil
}

-- Functions:
function println(Message)
	local Time = DateTime.now()
	
	print(string.format("[ Lithium Module | %s ]: %s", tostring(Time:FormatLocalTime("LL", "en-us")), tostring(Message)))
end

function CreateDrag(Frame)
	local Drag = {
		Toggle = nil,
		Input = nil,
		Start = nil,
		Position = nil
	}
	
	local Delta
	local Position
	local StartPosition

	local function UpdateInput(InputObject)
		Delta = InputObject.Position - Drag.Start
		Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		
		Services.TweenService:Create(
			Frame,
			TweenInfo.new(0),
			{
				Position = Position	
			}
		):Play()
	end

	Frame.InputBegan:Connect(function(InputObject, GameEvent)
		if not (GameEvent) and (InputObject.UserInputType == Enum.UserInputType.MouseButton1 or InputObject.UserInputType == Enum.UserInputType.Touch) then
			Drag.Toggle = true
			Drag.Start = InputObject.Position
			StartPosition = Frame.Position
			
			InputObject.Changed:Connect(function()
				if (InputObject.UserInputState == Enum.UserInputState.End) then
					Drag.Toggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(InputObject, GameEvent)
		if not (GameEvent) and (InputObject.UserInputType == Enum.UserInputType.MouseMovement or InputObject.UserInputType == Enum.UserInputType.Touch) then
			Drag.Input = InputObject
		end
	end)

	Services.UserInputService.InputChanged:Connect(function(InputObject, GameEvent)
		if not (GameEvent) and (InputObject == Drag.Input and Drag.Toggle) then
			UpdateInput(InputObject)
		end
	end)
end

function SetParent(ScreenGui)
    if (gethui) then
        ScreenGui.Parent = gethui()
    elseif (syn and syn.protect_gui) then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
end

-- Create Main Interface:
local LiCommands = Instance.new("ScreenGui")
LiCommands.Name = Services.HttpService:GenerateGUID(false)
LiCommands.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local DEBUG = Instance.new("Folder")
DEBUG.Name = "DEBUG"
DEBUG.Parent = LiCommands

-- Create ExampleItems Folder
local ExampleItems = Instance.new("Folder")
ExampleItems.Name = "ExampleItems"
ExampleItems.Parent = DEBUG

-- Items
local Example_Command_Card = Instance.new("Frame")
Example_Command_Card.Name = "Example_Command_Card"
Example_Command_Card.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Example_Command_Card.BorderColor3 = Color3.fromRGB(49, 49, 49)
Example_Command_Card.Position = UDim2.new(-0.000241378322, 0, 0.00497925282, 0)
Example_Command_Card.Size = UDim2.new(1, 0, 0, 75)
Example_Command_Card.Parent = ExampleItems

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0206896383, 0, 0, 0)
Title.Size = UDim2.new(0, 376, 0, 30)
Title.Font = PoppinsFont
Title.Text = "Title Command"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18.000
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Example_Command_Card

local Description = Instance.new("TextLabel")
Description.Name = "Description"
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description.BorderSizePixel = 0
Description.Position = UDim2.new(0.0206896383, 0, 0.293333322, 0)
Description.Size = UDim2.new(0, 376, 0, 43)
Description.Font = PoppinsFont
Description.Text = "This is a description of a command lol"
Description.TextColor3 = Color3.fromRGB(120, 120, 120)
Description.TextSize = 16.000
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.TextYAlignment = Enum.TextYAlignment.Top
Description.Parent = Example_Command_Card

local RunButton = Instance.new("TextButton")
RunButton.Name = "RunButton"
RunButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RunButton.BorderColor3 = Color3.fromRGB(49, 49, 49)
RunButton.Position = UDim2.new(0.695517302, 0, 0.436666667, 0)
RunButton.Size = UDim2.new(0, 169, 0, 32)
RunButton.ZIndex = 3
RunButton.Font = PoppinsFont
RunButton.Text = "Run Command"
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.TextSize = 17.000
RunButton.Parent = Example_Command_Card

local Universal = Instance.new("TextLabel")
Universal.Name = "Universal"
Universal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Universal.BackgroundTransparency = 1.000
Universal.BorderColor3 = Color3.fromRGB(0, 0, 0)
Universal.BorderSizePixel = 0
Universal.Position = UDim2.new(0.695517361, 0, 0.0266666673, 0)
Universal.Size = UDim2.new(0, 168, 0, 28)
Universal.Font = PoppinsFont
Universal.Text = "Universal: Yes"
Universal.TextColor3 = Color3.fromRGB(161, 255, 121)
Universal.TextSize = 18.000
Universal.TextXAlignment = Enum.TextXAlignment.Right
Universal.Parent = Example_Command_Card

-- Create Window Folder
local WindowFolder = Instance.new("Folder")
WindowFolder.Name = "WindowFolder"
WindowFolder.Parent = DEBUG

-- Window
local Window = Instance.new("Frame")
Window.Name = "Window"
Window.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Window.BorderColor3 = Color3.fromRGB(49, 49, 49)
Window.Position = UDim2.new(0.304941535, 0, 0.291208804, 0)
Window.Size = UDim2.new(0, 600, 0, 380)
Window.Parent = Window

local DebugBar = Instance.new("Frame")
DebugBar.Name = "DebugBar"
DebugBar.BackgroundColor3 = Color3.fromRGB(139, 75, 139)
DebugBar.BorderColor3 = Color3.fromRGB(49, 49, 49)
DebugBar.Position = UDim2.new(0, 0, 0.922719717, 0)
DebugBar.Size = UDim2.new(0, 600, 0, 30)
DebugBar.Parent = Window

local TextLine = Instance.new("TextLabel")
TextLine.Name = "TextLine"
TextLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLine.BackgroundTransparency = 1.000
TextLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLine.BorderSizePixel = 0
TextLine.Position = UDim2.new(0.0166666675, 0, 0, 0)
TextLine.Size = UDim2.new(0, 590, 0, 30)
TextLine.Font = PoppinsFont
TextLine.Text = "Lithium Commands Loaded Successfully!"
TextLine.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLine.TextSize = 17.000
TextLine.TextXAlignment = Enum.TextXAlignment.Left
TextLine.Parent = DebugBar

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderColor3 = Color3.fromRGB(49, 49, 49)
TopBar.Position = UDim2.new(0, 0, -7.4505806e-08, 0)
TopBar.Size = UDim2.new(0, 600, 0, 36)
TopBar.ZIndex = 2
TopBar.Parent = Window

local Settings = Instance.new("TextButton")
Settings.Name = "Settings"
Settings.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Settings.BorderColor3 = Color3.fromRGB(49, 49, 49)
Settings.Position = UDim2.new(0.814999998, 0, 0, 0)
Settings.Size = UDim2.new(0, 111, 0, 36)
Settings.ZIndex = 3
Settings.Font = PoppinsFont
Settings.Text = "Settings"
Settings.TextColor3 = Color3.fromRGB(120, 120, 120)
Settings.TextSize = 17.000
Settings.Parent = TopBar

local Commands = Instance.new("TextButton")
Commands.Name = "Commands"
Commands.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Commands.BorderColor3 = Color3.fromRGB(49, 49, 49)
Commands.Position = UDim2.new(0.629999995, 0, 0, 0)
Commands.Size = UDim2.new(0, 111, 0, 36)
Commands.ZIndex = 3
Commands.Font = PoppinsFont
Commands.Text = "Commands"
Commands.TextColor3 = Color3.fromRGB(139, 75, 139)
Commands.TextSize = 17.000
Commands.Parent = TopBar

local TopbarTitle = Instance.new("TextLabel")
TopbarTitle.Name = "Title"
TopbarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopbarTitle.BackgroundTransparency = 1.000
TopbarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopbarTitle.BorderSizePixel = 0
TopbarTitle.Position = UDim2.new(0.0279999804, 0, 8.4771051e-07, 0)
TopbarTitle.Size = UDim2.new(0, 327, 0, 37)
TopbarTitle.ZIndex = 2
TopbarTitle.Font = PoppinsFont
TopbarTitle.Text = "Lithium Commands"
TopbarTitle.TextColor3 = Color3.fromRGB(98, 98, 98)
TopbarTitle.TextSize = 17.000
TopbarTitle.TextXAlignment = Enum.TextXAlignment.Left
TopbarTitle.Parent = TopBar

local Tabs = Instance.new("Folder")
Tabs.Name = "Tabs"
Tabs.Parent = Window

local Commands_2 = Instance.new("Frame")
Commands_2.Name = "Commands"
Commands_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Commands_2.BorderColor3 = Color3.fromRGB(49, 49, 49)
Commands_2.Position = UDim2.new(0, 0, 0.0979999974, 0)
Commands_2.Size = UDim2.new(0, 600, 0, 313)
Commands_2.Parent = Tabs

local SearchBar = Instance.new("TextBox")
SearchBar.Name = "SearchBar"
SearchBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SearchBar.BorderColor3 = Color3.fromRGB(49, 49, 49)
SearchBar.Position = UDim2.new(0.0166666675, 0, 0.036303632, 0)
SearchBar.Size = UDim2.new(0, 580, 0, 40)
SearchBar.Font = Enum.Font.Gotham
SearchBar.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
SearchBar.PlaceholderText = "Enter a command in here..."
SearchBar.Text = ""
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.TextSize = 14.000
SearchBar.Parent = Commands_2

local Commands_3 = Instance.new("ScrollingFrame")
Commands_3.Name = "Commands"
Commands_3.Active = true
Commands_3.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Commands_3.BorderColor3 = Color3.fromRGB(49, 49, 49)
Commands_3.Position = UDim2.new(0.0159999598, 0, 0.195415363, 0)
Commands_3.Size = UDim2.new(0, 580, 0, 241)
Commands_3.CanvasSize = UDim2.new(0, 0, 0, 0)
Commands_3.ScrollBarThickness = 7
Commands_3.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
Commands_3.Parent = Commands_2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Commands_3

local Settings_2 = Instance.new("Frame")
Settings_2.Name = "Settings"
Settings_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Settings_2.BorderColor3 = Color3.fromRGB(49, 49, 49)
Settings_2.Position = UDim2.new(0, 0, 0.0979999751, 0)
Settings_2.Size = UDim2.new(0, 600, 0, 313)
Settings_2.Visible = false
Settings_2.Parent = Tabs

local Discord = Instance.new("Frame")
Discord.Name = "Discord"
Discord.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Discord.BorderColor3 = Color3.fromRGB(49, 49, 49)
Discord.Position = UDim2.new(-0.000241378322, 0, 0.00497925282, 0)
Discord.Size = UDim2.new(1, 0, 0, 75)
Discord.Parent = Settings_2

local Title_3 = Instance.new("TextLabel")
Title_3.Name = "Title"
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.0206896383, 0, 0, 0)
Title_3.Size = UDim2.new(0, 376, 0, 30)
Title_3.Font = PoppinsFont
Title_3.Text = "Join Discord Server"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 18.000
Title_3.TextXAlignment = Enum.TextXAlignment.Left
Title_3.Parent = Discord

local Description_2 = Instance.new("TextLabel")
Description_2.Name = "Description"
Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description_2.BackgroundTransparency = 1.000
Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description_2.BorderSizePixel = 0
Description_2.Position = UDim2.new(0.0206896383, 0, 0.293333322, 0)
Description_2.Size = UDim2.new(0, 376, 0, 43)
Description_2.Font = PoppinsFont
Description_2.Text = "LITHIUM_DISCORDSERVER_SCRIPT_DESCRIPTION"
Description_2.TextColor3 = Color3.fromRGB(120, 120, 120)
Description_2.TextSize = 16.000
Description_2.TextWrapped = true
Description_2.TextXAlignment = Enum.TextXAlignment.Left
Description_2.TextYAlignment = Enum.TextYAlignment.Top
Description_2.Parent = Discord

local RunButton_2 = Instance.new("TextButton")
RunButton_2.Name = "RunButton"
RunButton_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RunButton_2.BorderColor3 = Color3.fromRGB(49, 49, 49)
RunButton_2.Position = UDim2.new(0.695517302, 0, 0.436666667, 0)
RunButton_2.Size = UDim2.new(0, 169, 0, 32)
RunButton_2.ZIndex = 3
RunButton_2.Font = Enum.Font.Gotham
RunButton_2.Text = "Join Discord Server"
RunButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton_2.TextSize = 14.000
RunButton_2.Parent = Discord

local UIListLayout_2 = Instance.new("UIListLayout")
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 4)
UIListLayout_2.Parent = Settings_2

local KillUI = Instance.new("Frame")
KillUI.Name = "KillUI"
KillUI.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KillUI.BorderColor3 = Color3.fromRGB(49, 49, 49)
KillUI.Position = UDim2.new(-0.000241378322, 0, 0.00497925282, 0)
KillUI.Size = UDim2.new(1, 0, 0, 75)
KillUI.Parent = Settings_2

local Title_4 = Instance.new("TextLabel")
Title_4.Name = "Title"
Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_4.BackgroundTransparency = 1.000
Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_4.BorderSizePixel = 0
Title_4.Position = UDim2.new(0.0206896383, 0, 0, 0)
Title_4.Size = UDim2.new(0, 376, 0, 30)
Title_4.Font = PoppinsFont
Title_4.Text = "Kill Interface"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 18.000
Title_4.TextXAlignment = Enum.TextXAlignment.Left
Title_4.Parent = KillUI

local Description_3 = Instance.new("TextLabel")
Description_3.Name = "Description"
Description_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description_3.BackgroundTransparency = 1.000
Description_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description_3.BorderSizePixel = 0
Description_3.Position = UDim2.new(0.0206896383, 0, 0.293333322, 0)
Description_3.Size = UDim2.new(0, 376, 0, 43)
Description_3.Font = PoppinsFont
Description_3.Text = "This will destroy this interface and stop the script, commands may stop working or will crash the client"
Description_3.TextColor3 = Color3.fromRGB(120, 120, 120)
Description_3.TextSize = 16.000
Description_3.TextWrapped = true
Description_3.TextXAlignment = Enum.TextXAlignment.Left
Description_3.TextYAlignment = Enum.TextYAlignment.Top
Description_3.Parent = KillUI

local RunButton_3 = Instance.new("TextButton")
RunButton_3.Name = "RunButton"
RunButton_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RunButton_3.BorderColor3 = Color3.fromRGB(49, 49, 49)
RunButton_3.Position = UDim2.new(0.695517361, 0, 0.436666667, 0)
RunButton_3.Size = UDim2.new(0, 169, 0, 32)
RunButton_3.ZIndex = 3
RunButton_3.Font = PoppinsFont
RunButton_3.Text = "Kill Interface"
RunButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton_3.TextSize = 17.000
RunButton_3.Parent = KillUI

SetParent(LiCommands)

-- Module
local ExampleCommandCard = {
	Path = Example_Command_Card,
	Colors = {
		Universal = {
			Yes = Color3.fromRGB(161, 255, 121),
			No = Color3.fromRGB(255, 125, 125)
		}
	}
}

-- Set Tab Buttons:
Commands.MouseButton1Click:Connect(function()
	Settings.Visible = false
	Settings.TextColor3 = Color3.fromRGB(120, 120, 120)
	
	Commands.Visible = true
	Commands.TextColor3 = Color3.fromRGB(139, 75, 139)
end)

Settings.MouseButton1Click:Connect(function()
	Commands.Visible = false
	Commands.TextColor3 = Color3.fromRGB(120, 120, 120)
	
	Settings.Visible = true
	Settings.TextColor3 = Color3.fromRGB(139, 75, 139)
end)

RunButton_3.MouseButton1Click:Connect(function()
	LiCommands:Destroy()
end)

-- Library Functions
function Library.CreateWindow(t)
	println("Creating Window..")
	
	local Values = {
		Title = t["Title"],
		Discord = t["Discord"],
		OpenKeybind = t["OpenKeybind"],
		KillKeybind = t["KillKeybind"],
	}
	
	-- Set Title
	TopbarTitle.Text = Values.Title
	
	-- Discord Invite
	if not (Values.Discord == nil) and not (Values.Discord.Code == nil) then
		local DiscordMessage = string.format("Join our Discord Server to chat with other %s users and get support for issues!", Values.Title)
		
		Description_2 = DiscordMessage
		RunButton_2.MouseButton1Click:Connect(function()
			-- Join Discord Server Handler:
			local RequestFunction = (syn and syn.request) or (request or http.request or http_request)
			
			RequestFunction({
				Url = "https://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					["Origin"] = "https://discord.com"
				},
				Body = Services.HttpService:JSONEncode({
					cmd = "INVITE_BROWSER",
					args = {
						code = Values.Discord.Code
					},
					nonce = Services.HttpService:GenerateGUID(false)
				})
			})
			
			println("Tried to join Discord Server...")
		end)
		
	else
		Settings_2.Discord:Destroy()
	end
	
	-- Init
	Keybinds.OpenKeybind = Values.OpenKeybind
	Window.Visible = true
	
	task.wait(1)
	CreateDrag(Window)
	println("Created Window!")
end

function Library.CreateCard(t)
	local Values = {
		Title = t["Title"],
		Description = t["Description"],
		Universal = t["Universal"],
		Runtime = t["Runtime"]
	}
	
	-- Create's a new Card
	local NewCard = ExampleCommandCard.Path:Clone()
	
	-- Set Title, Description Text
	NewCard.Title.Text = Values.Title
	NewCard.Description.Text = Values.Description
	
	-- Adds Universal Text
	if not (Values.Universal == nil) and (Values.Universal == true) then
		NewCard.Universal.Text = "Universal: Yes"
		NewCard.Universal.TextColor3 = ExampleCommandCard.Colors.Universal.Yes
	elseif not (Values.Universal == nil) and (Values.Universal == false) then
		NewCard.Universal.Text = "Universal: No"
		NewCard.Universal.TextColor3 = ExampleCommandCard.Colors.Universal.No
	else
		NewCard.Universal:Destroy()
	end
	
	-- Runtime Function
	NewCard.RunButton.MouseButton1Click:Connect(function()
		println("Pressed a Runtime Button...")
		Values.Runtime()
	end)
	
	-- Change Parent
	NewCard.Parent = Commands_3
end

function Library.SetKey(t)
	local Values = {
		Type = t["Type"],
		Keybind = t["Keybind"]
	}
	
	if (Values.Type == "KillKeybind") then
		Keybinds.KillKeybind = Values.Keybind
	elseif (Values.Type == "OpenKeybind") then
		Keybinds.OpenKeybind = Values.Keybind
	end
	
	println("SetKey Called...")
end

function Library.SetDebugText(Message)
	if not (Message == nil) then
		TextLine.Text = tostring(Message)
		println("SetDebugText Called...")
	end
end

Services.UserInputService.InputBegan:Connect(function(InputObject, GameEvent)
	if not (GameEvent) and (InputObject.KeyCode == Keybinds.OpenKeybind) then
		-- Open Keybind:
		Window.Visible = not Window.Visible
	elseif not (GameEvent) and (InputObject.KeyCode == Keybinds.KillKeybind) then
		-- Kill Keybind:
		LiCommands:Destroy()
	end
end)

return Library
