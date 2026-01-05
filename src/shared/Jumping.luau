local Jumping = {}

function Jumping:Jump(character: Model)
	local rootPart: BasePart = character.PrimaryPart
	local newImpulse = sensorAndControllerLoader.ComputeLinearImpulseFromJumpPower(stateMachine.context.humanoid)
	rootPart:ApplyImpulse(newImpulse)
	stateMachine.context.timer = self.timerCount
end


return Jumping
