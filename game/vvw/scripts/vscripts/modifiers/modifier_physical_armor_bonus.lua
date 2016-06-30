modifier_physical_armor_bonus = class({})

function modifier_physical_armor_bonus:IsHidden()
	return false
end

function modifier_physical_armor_bonus:DeclareFunctions()
	return { MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS  }
end

function modifier_physical_armor_bonus:GetTexture()
    return "physical_armor_bonus"
end

function modifier_physical_armor_bonus:GetModifierPhysicalArmorBonus()
		return 15
end

function modifier_physical_armor_bonus:RemoveOnDeath()
	return false
end