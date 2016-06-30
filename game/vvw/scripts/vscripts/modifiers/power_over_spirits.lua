function OnAttacked( data )

local attacker = data.attacker
local caster = data.caster
local casterAngles = caster:GetAngles()

if attacker:IsIllusion() then
	attacker:SetPlayerID(caster:GetPlayerID())
	attacker:SetControllableByPlayer(caster:GetPlayerID(), false)
	attacker:SetAngles( casterAngles.x, casterAngles.y, casterAngles.z )
	attacker:SetTeam(caster:GetTeamNumber())
end

end

