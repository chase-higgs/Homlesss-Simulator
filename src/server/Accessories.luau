local Accessories = {}

local function dictToList(dict)
	local r = {}

	for k, v in pairs(dict) do
		table.insert(r, v)
	end

	return r
end

Accessories.HairColors = {
	Black = BrickColor.new("Really black"),
	Brunette = BrickColor.new("Reddish brown"),
	Blonde = BrickColor.new("Daisy orange"),
	Grey = BrickColor.new("Fossil"),
	Red = BrickColor.new("Cocoa"),
}

Accessories.Combos = {
	GrandfatherOfTime = 76237055333464,
	HogRider = 75244287388664,
	LongBeard = 121599652716749,
	Escanor = 113251388675676,
}

Accessories.Hairs = {
	SceneHair = 323476364,
	SpikedHair = 376524487,
	BeautifulHair = 16630147,
	Shaggy = 20573078,
}

Accessories.FacialHair = {
	NeckBeard = 4641540396,
	AndrewsBeard = 158066137,
	AbesBeard = 134025304816175,
	Mustache = 119361818196670,
	LongMustache = 16052647000,
	FancyMustache = 126068758643672,
}

function Accessories:RandomAccessories()
	if math.random(1,2) == 1 then --should use combo?
		local combos = dictToList(self.Combos)
		return {combos[math.random(1,#combos)]}
	else
		local hairs = dictToList(self.Hairs)
		local facialhairs = dictToList(self.FacialHair)

		return {hairs[math.random(1, #hairs)], facialhairs[math.random(1, #facialhairs)]}
	end
end

function Accessories:RandomColor()
	local haircolors = dictToList(self.HairColors)
	return haircolors[math.random(1, #haircolors)]
end

return Accessories
