local InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Accessories = require(script.Accessories)
local Faces = require(script.Faces)
local SkinColor = require(script.SkinColor)
local rf: RemoteFunction = ReplicatedStorage:WaitForChild("rf")
--Server

local rig = workspace:WaitForChild("Rig")
local description = rig.Humanoid:GetAppliedDescription()

rf.OnServerInvoke = function(player: Player)
	local character: Model = player.Character

	character.Humanoid:ApplyDescriptionResetAsync(description)

	local colors: BodyColors = character["Body Colors"]
	local face: Decal = character.Head.face

	local shirt: Shirt = Instance.new("Shirt")
	local pants: Pants = Instance.new("Pants")

	local accessories = Accessories:RandomAccessories()
	local accessoryColor = Accessories:RandomColor()

	for _, accessoryID in accessories do
		print(accessoryID)
		local item = InsertService:LoadAsset(accessoryID):GetChildren()[1]
		print(item.Handle:GetChildren())
		if item:IsA("Accessory") then
			local handle: Part = item.Handle
			local mesh = handle:FindFirstChild("SpecialMesh") or handle:FindFirstChild("Mesh")

			mesh.TextureId = ""
			handle.BrickColor = accessoryColor

			character.Humanoid:AddAccessory(item)
		end
	end
	
	shirt.ShirtTemplate = 'rbxassetid://15642991539'
	pants.PantsTemplate = 'rbxassetid://16065165910'

	shirt.Parent = character
	pants.Parent = character

	local color = SkinColor:RandomColor()

	colors.HeadColor = color
	colors.TorsoColor = color
	colors.LeftArmColor = color
	colors.RightArmColor = color
	colors.LeftLegColor = color
	colors.RightLegColor = color

	face.Texture = Faces:RandomFace()

	return
end
