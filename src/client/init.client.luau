local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

require(script.StaminaController)
require(script.WaistRotation)

local e = React.createElement

local function HelloMessage(props: {
	name: string,
})
	return e("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.XY,
		Text = `Hello, {props.name}!`,
	})
end

local function App()
	return e("ScreenGui", {}, {
		MyMessage = e(HelloMessage, {
			name = "Taylor",
		}),
	})
end

local root = ReactRoblox.createRoot(Instance.new("Folder"))
root:render(ReactRoblox.createPortal(e(App), Players.LocalPlayer.PlayerGui))
