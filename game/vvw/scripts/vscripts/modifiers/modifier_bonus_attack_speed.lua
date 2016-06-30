modifier_bonus_attack_speed = class({})

function modifier_bonus_attack_speed:IsHidden()
	return false
end

function modifier_bonus_attack_speed:DeclareFunctions()
	return { MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT  }
end

function modifier_bonus_attack_speed:GetTexture()
    return "bonus_attack_speed"
end

function modifier_bonus_attack_speed:GetModifierAttackSpeedBonus_Constant()
		return 50
end

function modifier_bonus_attack_speed:RemoveOnDeath()
	return false
end
