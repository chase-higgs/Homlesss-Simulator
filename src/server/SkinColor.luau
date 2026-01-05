local SkinColor = {}

SkinColor.Colors = {
	White = BrickColor.new("Pastel brown"),
	Black = BrickColor.new("Medium brown"),
	Asian = BrickColor.new("Brick yellow"),
	Native = BrickColor.new("CGA brown"),
	Hispanic = BrickColor.new("Bright orange"),
	Indian = BrickColor.new("Burnt Sienna")
}

function SkinColor:RandomColor()
	local colors = {}
	for key, value in self.Colors do
		table.insert(colors, value)
	end

	return colors[math.random(1, #colors)]
end

return SkinColor
