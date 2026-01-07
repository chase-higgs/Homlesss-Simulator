local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local e = React.createElement

return function() 
	return e("ScreenGui", {
		Name = "root",
	},{
		e("Frame", {
			Name = "Main",
			Size = UDim2.fromScale(0.3, 0.3),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {
			e("TextLabel", {
				Name = "Label",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Text = "test",
			})
		})
	})
end
