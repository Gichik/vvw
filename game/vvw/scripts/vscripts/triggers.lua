countT = 0;
countM = 0;
countV = 0;

teamT = nil;
teamM = nil;
teamV = nil;

LinkLuaModifier("modifier_bonus_attack_speed", "modifiers/modifier_bonus_attack_speed.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_physical_armor_bonus", "modifiers/modifier_physical_armor_bonus.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_bonus_damage_physical", "modifiers/modifier_bonus_damage_physical.lua", LUA_MODIFIER_MOTION_NONE )

function VillageCapture(data)

teamT = data.activator:GetTeamNumber()

GameRules:SendCustomMessage("<font color='#acfa58'>The village was attacked! Townspeople in a panic</font>", 0, 0)	

	Timers:CreateTimer(1,function()
		countT = countT + 1
		local message = ("<font color='#acfa58'>To capture the left " .. 16 - countT .. "</font>")
		GameRules:SendCustomMessage(message, 0, 0)	
		if countT > 14 then
			GameRules:SendCustomMessage("<font color='#acfa58'>The village was captured. Townspeople suppressed.</font>", 0, 0)	
			GiveAura("modifier_bonus_attack_speed",teamT)	
			countT = 0
			return nil
		end
		
		local units = FindUnitsInRadius( teamT, Vector(-3186.91, 3291.36, 192), nil, 150,
		DOTA_UNIT_TARGET_TEAM_ENEMY , DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
	
		if units[ 1 ] then
			GameRules:SendCustomMessage("<font color='#acfa58'>Capture is interrupted, the townspeople rejoice!</font>", 0, 0)	
			countT = 0
			return nil
		end
		
		units = FindUnitsInRadius( teamT, Vector(-3186.91, 3291.36, 192), nil, 150,
			DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )		
		
		if units[ 1 ] then		
			return 1
		else
			GameRules:SendCustomMessage("<font color='#acfa58'>Capture is interrupted, the townspeople rejoice!</font>", 0, 0)
			countT = 0
			return nil
		end
		
	end)
end



function MountainsCapture(data)

teamM = data.activator:GetTeamNumber()

GameRules:SendCustomMessage("The mountains was attacked! Mountain residents in a panic", 0, 0)	

	Timers:CreateTimer(1,function()
		countM = countM + 1
		local message = ("To capture the left " .. 16 - countM)
		GameRules:SendCustomMessage(message, 0, 0)	
		if countM > 14 then
			GameRules:SendCustomMessage("The mountains was captured. Mountain residents suppressed.", 0, 0)
			GiveAura("modifier_physical_armor_bonus",teamM)
			countM = 0
			return nil
		end
		
		local units = FindUnitsInRadius( teamM, Vector(3840, 1024, 576), nil, 200,
		DOTA_UNIT_TARGET_TEAM_ENEMY , DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
	
		if units[ 1 ] then
			GameRules:SendCustomMessage("Capture is interrupted, the mountain residents rejoice!", 0, 0)	
			countM = 0
			return nil
		end
		
		units = FindUnitsInRadius( teamM, Vector(3840, 1024, 576), nil, 200,
			DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )		
		
		if units[ 1 ] then		
			return 1
		else
			GameRules:SendCustomMessage("Capture is interrupted, the mountain residents rejoice!", 0, 0)
			countM = 0
			return nil
		end
		
	end)
end



function VolcanoCapture(data)

teamV = data.activator:GetTeamNumber()

GameRules:SendCustomMessage("<font color='#fa585b'>The Volcano was attacked! Volcano residents in a panic</font>", 0, 0)	

	Timers:CreateTimer(1,function()
		countV = countV + 1
		local message = ("<font color='#fa585b'>To capture the left " .. 16 - countV .. "</font>")
		GameRules:SendCustomMessage(message, 0, 0)	
		if countV > 14 then
			GameRules:SendCustomMessage("<font color='#fa585b'>The Volcano was captured. Volcano residents suppressed.</font>", 0, 0)
			GiveAura("modifier_bonus_damage_physical",teamV)	
			countV = 0
			return nil
		end
		
		local units = FindUnitsInRadius( teamV, Vector(640, -4992, -227.577), nil, 200,
		DOTA_UNIT_TARGET_TEAM_ENEMY , DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
	
		if units[ 1 ] then
			GameRules:SendCustomMessage("<font color='#fa585b'>Capture is interrupted, the volcano residents rejoice!</font>", 0, 0)	
			countV = 0
			return nil
		end
		
		units = FindUnitsInRadius( teamV, Vector(640, -4992, -227.577), nil, 200,
			DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )		
		
		if units[ 1 ] then		
			return 1
		else
			GameRules:SendCustomMessage("<font color='#fa585b'>Capture is interrupted, the volcano residents rejoice!</font>", 0, 0)
			countV = 0
			return nil
		end
		
	end)
end


function GiveAura(aura_name,team)
	for i=0,5 do
		if PlayerResource:IsValidPlayer(i) then
			local player = PlayerResource:GetSelectedHeroEntity(i)
			local teamNumb = player:GetTeamNumber()
			if teamNumb == team then
				player:AddNewModifier( player, nil, aura_name, {} )		
			else
				player:RemoveModifierByName(aura_name)
			end		
		end
	end
end