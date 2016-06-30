hunter_hide = class({})
LinkLuaModifier( "modifier_hidden", "modifiers/modifier_hidden.lua", LUA_MODIFIER_MOTION_NONE )

function hunter_hide:OnSpellStart()	
	EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", self:GetCaster())
	local caster = self:GetCaster()
	local radius = self:GetSpecialValueFor("radius")
	local end_duration = false

caster:AddNewModifier( caster, nil, "modifier_hidden", {duration = self:GetSpecialValueFor("duration")} )	
	
Timers:CreateTimer(self:GetSpecialValueFor("duration"),function()
end_duration = true
return nil
end)


	
Timers:CreateTimer(0.1,function()
	if GridNav:IsNearbyTree( caster:GetAbsOrigin() , radius, true ) and end_duration == false then
		caster:AddNewModifier( caster, nil, "modifier_invisible", {} )
		return 0.1
	else
		caster:RemoveModifierByName("modifier_invisible")
		caster:RemoveModifierByName("modifier_hidden")
		return nil
	end	
end)

	
end