# Lithium-Commands
Lithium Commands | A project that's made in my spare time :D

# Documentation 
(not good)

-- This is so you can use the Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yxild/Lithium-Commands/main/Library/Library.lua"), 1)()

-- Creates the Window
local Window = Library.CreateWindow({
	Title = <string>,
	Discord = {
		Code = <string> -- Set to nil if you don't want this
	},
	OpenKeybind = Enum.KeyCode.<inputkey>,
	KillKeybind = Enum.KeyCode.<inputkey>
})

-- Creates a Card
Library.CreateCard({
	Title = <string>,
	Description = <string>,
	Universal = <bool>, -- Optional, set to nil or remove the line if you dont want it
	Runtime = <function>
})

-- Sets the Debug Text (purple line) on the bottom
Library.SetDebugText(<string>)

-- Sets a Keybind for the Library
Library.SetKey({
    Type = <string>, -- Either "KillKeybind" or "OpenKeybind"
    Keybind = Enum.KeyCode.<inputkey>
})
