--Waist Rotation
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Observers = require(ReplicatedStorage.Packages.Observers)

local rf: RemoteFunction = ReplicatedStorage:WaitForChild("rf")

local WaistRotation = {}

Observers.observeLocalCharacter(function(character: Model)
	print("character loaded")
	
	rf:InvokeServer()

	local root = character.PrimaryPart

	local neck = character.Head.Neck
	local neckOG = neck.C0

	local waist = character.UpperTorso.Waist
	local waistOG = waist.C0

	local camera = workspace.CurrentCamera

	local heartbeatConnection: RBXScriptConnection = RunService.Heartbeat:Connect(function()
		local relativeCFrame = root.CFrame:ToObjectSpace(camera.CFrame)
		local x, y, z = relativeCFrame:ToEulerAnglesXYZ()

		waist.C0 = CFrame.new(waistOG.Position) * CFrame.Angles(0, math.clamp(y, -30, 30), 0)
		neck.C0 = CFrame.new(neckOG.Position) * CFrame.Angles(0, math.clamp(y, -90, 90), 0)
	end)

	return function()
		heartbeatConnection:Disconnect()
		print("character not loaded")
	end
end)

return WaistRotation
