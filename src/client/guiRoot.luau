local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local e = React.createElement

return function() 
	return e("ScreenGui", {
		Name = "root2"
	})
end
