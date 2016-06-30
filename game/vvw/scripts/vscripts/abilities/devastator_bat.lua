devastator_bat = class({})

function devastator_bat:OnSpellStart()	
	--EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", self:GetCaster())
	local caster = self:GetCaster()

	if self:GetLevel() <= 2 then
		local unit = CreateUnitByName("npc_dota_bat", caster:GetAbsOrigin(), true, nil, nil, caster:GetTeamNumber() )
		unit:SetControllableByPlayer(caster:GetPlayerID(), false)
	else
		local unit = CreateUnitByName("npc_dota_invisible_bat", caster:GetAbsOrigin(), true, nil, nil, caster:GetTeamNumber() )
		unit:SetControllableByPlayer(caster:GetPlayerID(), false)
	end
	
end