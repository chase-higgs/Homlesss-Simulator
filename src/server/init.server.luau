local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rf: RemoteFunction = ReplicatedStorage:WaitForChild("rf")
local ApplyRandomCharacter = require(script.ApplyRandomCharacter)

rf.OnServerInvoke = function(player: Player)
	ApplyRandomCharacter.Apply(player)
end
