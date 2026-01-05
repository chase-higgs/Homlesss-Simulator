local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stamina = require(script.Parent.Stamina)
local Observers = require(ReplicatedStorage.Packages.Observers)

local StaminaController = {}

Observers.observeLocalCharacter(function(character: Model)
	local humanoid = character.Humanoid
	local staminaFrame = Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui").StaminaBar

	local attemptJump = false

	Stamina:Init(humanoid, staminaFrame)

	local heartbeatConnection: RBXScriptConnection = RunService.Heartbeat:Connect(function()
		if attemptJump then
			Stamina:Jump()
		end
	end)

	local inputBeganConnection: RBXScriptConnection = UserInputService.InputBegan:Connect(function(input: InputObject)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.LeftShift then
				Stamina:StartSprinting()
			elseif input.KeyCode == Enum.KeyCode.Space then
				attemptJump = true
			end
		end
	end)

	local inputEndedConnection: RBXScriptConnection = UserInputService.InputEnded:Connect(function(input: InputObject)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.LeftShift then
				Stamina:StopSprinting()
			elseif input.KeyCode == Enum.KeyCode.Space then
				attemptJump = false
			end
		end
	end)

	humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)

	return function()
		heartbeatConnection:Disconnect()

		inputBeganConnection:Disconnect()
		inputEndedConnection:Disconnect()

		Stamina:Cleanup()
	end
end)

return StaminaController
