werewolves_earth_splitter_activator = class({})

function werewolves_earth_splitter_activator:OnUpgrade()	
	--EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", self:GetCaster())
	local caster = self:GetCaster()
	Timers:CreateTimer(10, function()
		print("timer")
		if caster:GetHealth() < 3000  then
			print("ok")
			local ability = caster:FindAbilityByName("werewolves_earth_splitter")
			local point = caster:GetOrigin()
			caster:CastAbilityOnPosition(point, ability, -1 )
		end		
	return 10
	end)
	
	
end


--[[
function werewolves_earth_splitter_activator:OnSpellStart()	
	--EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", self:GetCaster())
	local caster = self:GetCaster()

		if caster:GetHealth() < 1900  then
			print("ok")
			local ability = caster:FindAbilityByName("werewolves_earth_splitter")
			local point = caster:GetAbsOrigin()
			caster:CastAbilityOnPosition(point, ability, -1 )
		end		

	
	
end]]