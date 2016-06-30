repel_activator = class({})

function repel_activator:OnUpgrade()	
	--EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", self:GetCaster())
	--self:GetCaster():AddNewModifier( self:GetCaster(), nil, "modifier_omniknight_repel", {} )	
	
Timers:CreateTimer(1,function()
	local modifiers = self:GetCaster():FindAllModifiers()
	if modifiers then
		for k,mod in pairs(modifiers) do
			if(mod:GetName() == "modifier_bloodseeker_rupture") or  (mod:GetName() == "modifier_ursa_fury_swipes_damage_increase") then
				self:GetCaster():RemoveModifierByName(mod:GetName())
			end
		end
	end

	return 3
end)	
	

	
	
end
