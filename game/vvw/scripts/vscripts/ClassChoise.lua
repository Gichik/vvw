LinkLuaModifier( "modifier_power_over_spirits", "modifiers/modifier_power_over_spirits.lua", LUA_MODIFIER_MOTION_NONE )

function SetAbilityForShadowlord(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
local ability = hero:AddAbility("shadow_lord_grave_chill")
ability:SetLevel(1)
ability = hero:AddAbility("shadow_lord_shadow_dance")
ability:SetLevel(1)
ability = hero:AddAbility("shadow_lord_blink")
ability:SetLevel(1)
ability = hero:AddAbility("shadow_lord_bash")
ability:SetLevel(1)
ability = hero:AddAbility("shadow_lord_thirst")
ability:SetLevel(1)
ability = hero:AddAbility("shadow_lord_hunter_in_the_night")
ability:SetLevel(1)
ability = hero:AddAbility("power_over_spirits")
ability:SetLevel(1)

--hero:RemoveModifierByName("modifier_slark_shadow_dance")
--hero:RemoveModifierByName("modifier_slark_shadow_dance_passive")
--hero:RemoveModifierByName("modifier_slark_shadow_dance_passive_regen")
--hero:RemoveModifierByName("modifier_slark_shadow_dance_visual")
  
end


function SetAbilityForFleshEater(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
hero:SetRenderColor(48, 213, 200)
local ability = hero:AddAbility("flesheater_void")
ability:SetLevel(1)
ability = hero:AddAbility("flesheater_windrun")
ability:SetLevel(1)
ability = hero:AddAbility("flesheater_blink")
ability:SetLevel(1)
ability = hero:AddAbility("flesheater_swarm")
ability:SetLevel(1)
ability = hero:AddAbility("flesheater_feast")
ability:SetLevel(1)
ability = hero:AddAbility("flesheater_hunter_in_the_night")
ability:SetLevel(1)
end

function SetAbilityForDevastator(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
hero:SetRenderColor(255, 0, 0)
local ability = hero:AddAbility("devastator_rupture")
ability:SetLevel(1)
ability = hero:AddAbility("devastator_life_drain")
ability:SetLevel(1)
ability = hero:AddAbility("devastator_blink")
ability:SetLevel(1)
ability = hero:AddAbility("devastator_blood_bath")
ability:SetLevel(1)
ability = hero:AddAbility("devastator_bat")
ability:SetLevel(1)
ability = hero:AddAbility("devastator_hunter_in_the_night")
ability:SetLevel(1)
end



function SetAbilityForStoneskin(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
hero:SetModel("models/items/lycan/ultimate/sirius_curse/sirius_curse.vmdl")
hero:SetOriginalModel("models/items/lycan/ultimate/sirius_curse/sirius_curse.vmdl")

hero:SetModelScale(1.3)
local ability = hero:AddAbility("stoneskin_earthshock")
ability:SetLevel(1)
ability = hero:AddAbility("stoneskin_enrage")
ability:SetLevel(1)
ability = hero:AddAbility("stoneskin_skewer")
ability:SetLevel(1)
ability = hero:AddAbility("stoneskin_greater_bash")
ability:SetLevel(1)
ability = hero:AddAbility("stoneskin_dragon_blood")
ability:SetLevel(1)
ability = hero:AddAbility("werewolf_fury_swipes")
ability:SetLevel(1)
end


function SetAbilityForFerocious(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
hero:SetModel("models/items/lycan/ultimate/ambry_true_form/ambry_true_form.vmdl")
hero:SetOriginalModel("models/items/lycan/ultimate/ambry_true_form/ambry_true_form.vmdl")
local ability = hero:AddAbility("ferocious_open_wounds")
ability:SetLevel(1)
ability = hero:AddAbility("ferocious_culling_blade")
ability:SetLevel(1)
ability = hero:AddAbility("ferocious_life_break")
ability:SetLevel(1)
ability = hero:AddAbility("ferocious_poison_sting")
ability:SetLevel(1)
ability = hero:AddAbility("ferocious_berserkers_blood")
ability:SetLevel(1)
ability = hero:AddAbility("werewolf_fury_swipes")
ability:SetLevel(1)
end

function SetAbilityForHunter(data)
local hero = data.caster
RemoveAbilitiOfChoise(hero)
hero:SetModel("models/items/lycan/ultimate/alpha_trueform9/alpha_trueform9.vmdl")
hero:SetOriginalModel("models/items/lycan/ultimate/alpha_trueform9/alpha_trueform9.vmdl")
local ability = hero:AddAbility("hunter_hide")
ability:SetLevel(1)
ability = hero:AddAbility("hunter_conjure_image")
ability:SetLevel(1)
ability = hero:AddAbility("hunter_empowering_haste")
ability:SetLevel(1)
ability = hero:AddAbility("hunter_track")
ability:SetLevel(1)
ability = hero:AddAbility("hunter_jinada")
ability:SetLevel(1)
ability = hero:AddAbility("werewolf_fury_swipes")
ability:SetLevel(1)
end




function RemoveAbilitiOfChoise(hero)
for i = 0, 2 do
	local ability = hero:GetAbilityByIndex(i)
	if ability ~= nil then
		hero:RemoveAbility(ability:GetAbilityName())
	end
end
end