--Stamina
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CharacterPhysicsControllerLoader = require(ReplicatedStorage.Shared.CharacterPhysicsControllerLoader)

local Stamina = {}

local jumpCooldown = 1

Stamina.Humanoid = nil
Stamina.UI = nil

Stamina.Stamina = 0
Stamina.isSprinting = false
Stamina.isJumping = false
Stamina.refresh = false

function Stamina:StartSprinting()
	self.isSprinting = true
end

function Stamina:StopSprinting()
	self.isSprinting = false
end

function Stamina:Init(humanoid: Humanoid, ui: Frame)
	self.Humanoid = humanoid
	self.Stamina = 100
	self.UI = ui

	self.UI.Visible = true

	self.refresh = RunService.Heartbeat:Connect(function(dt)
		if self.isSprinting then
			if self.Stamina > 0 then
				self.Humanoid.WalkSpeed = 20
				self.Stamina = math.clamp(self.Stamina - 10 * dt, 0, 100)
			else
				self.isSprinting = false
			end
		else
			self.Humanoid.WalkSpeed = 8
			self.Stamina = math.clamp(self.Stamina + 10 * dt, 0, 100)
		end
		
		self.UI.StaminaProgress.Size = UDim2.fromScale(self.Stamina / 100, 1)
	end)
end

function Stamina:Jump()
	if not self.isJumping and self.Humanoid.FloorMaterial ~= "Air" and self.Stamina >= 10 then
		self.Stamina = self.Stamina - 10
		self.isJumping = true
		self.Humanoid.Parent.PrimaryPart:ApplyImpulse(CharacterPhysicsControllerLoader.ComputeLinearImpulseFromJumpPower(self.Humanoid))
		task.wait(jumpCooldown)
		self.isJumping = false
	end
end

function Stamina:Cleanup()
	Stamina.Humanoid = nil
	Stamina.UI = nil

	Stamina.Stamina = 0
	Stamina.isSprinting = false
	Stamina.isJumping = false
	Stamina.refresh:Disconnect()
	Stamina.refresh = false
end

return Stamina
