modifier_bonus_damage_physical = class({})

function modifier_bonus_damage_physical:IsHidden()
	return false
end

function modifier_bonus_damage_physical:DeclareFunctions()
	return { MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE    }
end

function modifier_bonus_damage_physical:GetTexture()
    return "bonus_damage_physical"
end

function modifier_bonus_damage_physical:GetModifierBaseAttack_BonusDamage()
		return 25
end

function modifier_bonus_damage_physical:RemoveOnDeath()
	return false
end