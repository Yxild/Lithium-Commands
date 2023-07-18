--[[


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yxild/Lithium-Commands/main/Library/Library.lua"), 1)()

local Window = Library.CreateWindow({
	Title = <string>,
	Discord = {
		Code = <string> -- Set to nil if you don't want this
	},
	OpenKeybind = Enum.KeyCode.<inputkey>,
	KillKeybind = Enum.KeyCode.<inputkey>
})

Library.CreateCard({
	Title = <string>,
	Description = <string>,
	Universal = <bool>, -- Optional, set to nil or remove the line if you dont want it
	Runtime = <function>
})

Library.SetDebugText(<string>)

Library.SetKey({
    Type = <string>, -- Either "KillKeybind" or "OpenKeybind"
    Keybind = Enum.KeyCode.<inputkey>
})

]]--

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yxild/Lithium-Commands/main/Library/Library.lua"), 1)()

local Window = Library.CreateWindow({
	Title = "Lithium Commands",
	Discord = {
		Code = "roblox"
	},
	OpenKeybind = Enum.KeyCode.Insert,
	KillKeybind = Enum.KeyCode.End
})

Library.CreateCard({
	Title = "Testing 1",
	Description = "gheheheheheheheheh",
	Universal = true,
	Runtime = (function()
		Library.SetDebugText("You pressed test 1")
		print("You pressed test 1")
	end)
})

Library.SetDebugText("This is a Test Message")

Library.SetKey({
    Type = "KillKeyBind", -- Either "KillKeybind" or "OpenKeybind"
    Keybind = Enum.KeyCode.End
})
