item_runa_regeneration = class({}) 

function item_runa_regeneration:GetBehavior()
	return DOTA_ABILITY_BEHAVIOR_NO_TARGET
end

function item_runa_regeneration:OnSpellStart()
	print("cast")
end


function item_runa_regeneration:OnItemEquipped( hItem )
	print("equip")
end
