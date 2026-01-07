local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local e = React.createElement

local GUI = {}

local function HelloMessage()
	local visible, setVisible = React.useState(true)
	React.useEffect(function()
		local conn = UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.F then
				setVisible(not visible)
			end
		end)

		return function() 
			conn:Disconnect()
		end

	end, {visible})

	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		Visible = visible,
	},
	{
		e("TextLabel", {
			Size = UDim2.fromScale(1, 0.1),
			Text = "Homeless Simulator",
			BackgroundTransparency = 1,
			TextSize = 24,
			BorderSizePixel = 0,
			TextColor3 = Color3.fromRGB(255, 255, 255),
		},
		{
			e("UIStroke",
				{
					Thickness = 3
				})
		})
	},
	{
		e("TextButton", {
			Size = UDim2.fromScale(0.3, 0.2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Text = "Menu",
			[React.Event.Activated] = function ()

			end
		})
	})
end

local function App()
	return e("ScreenGui", {
		Name = "root"
	}, {
		MyMessage = e(HelloMessage),
	})
end

local root = ReactRoblox.createRoot(Instance.new("Folder"))
root:render(ReactRoblox.createPortal(e(App), Players.LocalPlayer.PlayerGui))

return GUI
