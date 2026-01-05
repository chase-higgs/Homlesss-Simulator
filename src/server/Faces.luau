local Faces = {}

Faces.Faces = {
	Goofball = "rbxassetid://27134272",
	FriendlyGrin = "rbxassetid://25321744",
	LazyEye = "rbxassetid://7075492",
	TiredFace = "rbxassetid://141728515",
	O_o = "rbxassetid://7046277",
	NotAmused = "rbxassetid://7131857",
	Normal = "rbxasset://textures/face.png",
}

function Faces:RandomFace()
	local faces = {}
	for key, value in pairs(self.Faces) do
		table.insert(faces, value)
	end

	return faces[math.random(1, #faces)]
end

return Faces
