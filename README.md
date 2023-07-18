# Lithium-Commands
Lithium Commands isn't directly a command thingy like IY or Fades Admin, it's a Library which you can use to make a Command list for yourself.

Note; this is licensed under the GPL v3.0 License provided from GNU, you cannot sell this source or a request will made to take down the source you've modified or are distributing.

Distributing your scripts without Credits will be requested from Me (Yxild), if not followed you will turn gay.

# Documentation 
(not good)

> This is so you can use the Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yxild/Lithium-Commands/main/Library/Library.lua"), 1)()
```


> Creates the Window
```lua
local Window = Library.CreateWindow({
	Title = <string>,
	Discord = {
		Code = <string> -- Set to nil if you don't want this
	},
	OpenKeybind = Enum.KeyCode.<inputkey>,
	KillKeybind = Enum.KeyCode.<inputkey>
})
```


> Creates a Card
```lua
Library.CreateCard({
	Title = <string>,
	Description = <string>,
	Universal = <bool>, -- Optional, set to nil or remove the line if you dont want it
	Runtime = <function>
})
```


> Sets the Debug Text (purple line) on the bottom
```lua
Library.SetDebugText(<string>)
```


> Sets a Keybind for the Library
```lua
Library.SetKey({
    Type = <string>, -- Either "KillKeybind" or "OpenKeybind"
    Keybind = Enum.KeyCode.<inputkey>
})
```
