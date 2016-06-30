
_G.nCREATURE_RESPAWN_TIME = 30

XP_PER_LEVEL_TABLE = {
	     0, -- 1
	  200, -- 2 +200
	  500, -- 3 +300
	  900, -- 4 +400
	 1400, -- 5 +500
	 2000, -- 6 +600
	 2700, -- 7 +700
	 3500, -- 8 +800
	 4400, -- 9 +900
	 5400 -- 10 +1000
 }


function main:InitGameMode()
	print( "InitGameMode" )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	
	GameRules:SetTimeOfDay( 0.5 )
	GameRules:SetHeroRespawnEnabled( true )
	GameRules:SetUseUniversalShopMode( false )
	GameRules:SetHeroSelectionTime( 5.0 )
	GameRules:SetPreGameTime( 5.0 )
	GameRules:SetPostGameTime( 60.0 )
	GameRules:SetTreeRegrowTime( 60.0 )
	GameRules:SetHeroMinimapIconScale( 0.7 )
	GameRules:SetCreepMinimapIconScale( 0.7 )
	GameRules:SetRuneMinimapIconScale( 0.7 )
	GameRules:SetGoldTickTime( 60.0 )
	GameRules:SetGoldPerTick( 0 )
	GameRules:GetGameModeEntity():SetRemoveIllusionsOnDeath( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
	GameRules:GetGameModeEntity():SetBuybackEnabled( true )
	GameRules:GetGameModeEntity():SetRecommendedItemsDisabled( true )	

	--GameRules:SetRuneSpawnTime(30)

	--GameRules:GetGameModeEntity():SetRuneEnabled( 0, false ) --Double Damage
	--GameRules:GetGameModeEntity():SetRuneEnabled( 1, false ) --Haste
	--GameRules:GetGameModeEntity():SetRuneEnabled( 2, true ) --Illusion
	--GameRules:GetGameModeEntity():SetRuneEnabled( 3, false ) --Invis
	--GameRules:GetGameModeEntity():SetRuneEnabled( 4, true )  --Regen
	--GameRules:GetGameModeEntity():SetRuneEnabled( 5, false ) --Bounty

	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(10)		
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels(true)

	GameRules:GetGameModeEntity():SetLoseGoldOnDeath(false)	
	GameRules:SetUseBaseGoldBountyOnHeroes(false)
	
	--GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled( true )

    ListenToGameEvent('entity_killed', Dynamic_Wrap(main, 'OnEntityKilled'), self)
	ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(main, 'GameRulesStateChange'), self)


	GameRules.DropTable = LoadKeyValues("scripts/kv/item_drops.kv")	

	main:SpawnMoobs()

	
end

 function main:GameRulesStateChange(keys)
  local newState = GameRules:State_Get()
  if newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
    main:ForcedToPlay()
  end
  if newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
   --main:GameStart()
   	ShowGenericPopup(  "#popup_title_Main", "#popup_body_Main", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
  end
end



function main:ForcedToPlay()
print("----------------------------------------all connect----------------------------------------")
	for i=0,6 do
		if PlayerResource:IsValidPlayer(i) then
			local player = PlayerResource:GetPlayer(i)
			--local player = hero:GetPlayerOwner()
			local teamNumb = player:GetTeamNumber()
			local name =  GetTeamName(teamNumb)
			if name == "#DOTA_BadGuys" then
					main:NewHeroCreated("npc_dota_hero_night_stalker",player)
			end
			if name == "#DOTA_GoodGuys" then
					main:NewHeroCreated("npc_dota_hero_lycan",player)				
			end			
		end
	end
end

function main:NewHeroCreated(name,player)
	player=CreateHeroForPlayer(name,player)
	player:SetGold(0, false)
	player:SetAbilityPoints(0)
	--player:GetAbilityCount()				
	for i = 0, 2 do
		local ability = player:GetAbilityByIndex(i)
		if ability ~= nil then
			if ability:GetLevel() == 0 then							
				  ability:SetLevel(1)
			end
		end
	end
return player					

end


function main:SpawnMoobs()

local point = nil
local unit = nil
local item = nil

	point = Entities:FindByName( nil, "werewolves_spawn"):GetAbsOrigin()
	unit = CreateUnitByName("werewolves_ancient", point, true, nil, nil, DOTA_TEAM_GOODGUYS )
	unit:SetForwardVector(unit:GetForwardVector()*(-1))
	unit.vSpawnVector = unit:GetForwardVector()*(-1)
	
	point = Entities:FindByName( nil, "vampiers_spawn"):GetAbsOrigin()
	unit = CreateUnitByName("vampiers_ancient", point, true, nil, nil, DOTA_TEAM_BADGUYS )
	unit:SetForwardVector(Vector(0,1,0))
	unit.vSpawnVector = Vector(0,1,0)	
	--local ability = unit:FindAbilityByName("werewolves_earth_splitter")
	--ability:SetLevel(1)

	
for i = 1, 5 do	
	point = Entities:FindByName( nil, "spawn_bird_" .. RandomInt(1, 13)):GetAbsOrigin()
	unit = CreateUnitByName("npc_bird", point, true, nil, nil, DOTA_TEAM_NEUTRALS )
	--way = Entities:FindByName( nil, "spawn_bird_" .. (i+1)) 
	--unit:SetInitialGoalEntity( way )		
end	

for i = 1, 12 do	
	point = Entities:FindByName( nil, "rune_spawn_" .. i):GetAbsOrigin()
	--item = CreateItem("item_rune_regen", nil, nil)
	--CreateItemOnPositionSync( point, item )
	
	unit = CreateUnitByName("npc_rune", point, true, nil, nil, DOTA_TEAM_NEUTRALS )
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
end	




----------------------VILLAGE-------------------------------
	
for i = 1, 1 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_man", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
	
	unit = CreateUnitByName("npc_girl", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
end		
	
	
for i = 2, 3 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_man", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))
	
	unit = CreateUnitByName("npc_girl", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))
end	

for i = 4, 5 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_man", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))
end

for i = 6, 6 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_man", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))
end	

for i = 7, 7 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_knight", point, true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
	
--	unit = CreateUnitByName("npc_girl", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
--	unit.vSpawnLoc = unit:GetOrigin()
--	unit.vSpawnVector = Vector(0,1,0)
--	unit:SetForwardVector(Vector(0,1,0))
end	

--[[
for i = 8, 8 do	
	point = Entities:FindByName( nil, "spawn_moobs_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("npc_girl", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
end	--]]

----------------------MOUNTAINS----------------------------

	point = Entities:FindByName( nil, "spawn_moobs_9"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))

	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))
	
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))

	
	point = Entities:FindByName( nil, "spawn_moobs_10"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_11"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	

	point = Entities:FindByName( nil, "spawn_moobs_12"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))	

	point = Entities:FindByName( nil, "spawn_moobs_13"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	

	point = Entities:FindByName( nil, "spawn_moobs_14"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))		
	
	point = Entities:FindByName( nil, "spawn_moobs_15"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	

	point = Entities:FindByName( nil, "spawn_moobs_16"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_17"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
	
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))

	point = Entities:FindByName( nil, "spawn_moobs_18"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))	

	point = Entities:FindByName( nil, "spawn_moobs_19"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))

	point = Entities:FindByName( nil, "spawn_moobs_20"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))

	point = Entities:FindByName( nil, "spawn_moobs_21"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_22"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))	

	point = Entities:FindByName( nil, "spawn_moobs_23"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_24"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_25"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_26"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_27"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_28"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_29"):GetAbsOrigin()
	unit = CreateUnitByName("npc_tusk", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_30"):GetAbsOrigin()
	unit = CreateUnitByName("npc_apparation", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_52"):GetAbsOrigin()
	unit = CreateUnitByName("npc_death_dragon", point, true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))		
----------------------VOLCANO----------------------------	


	point = Entities:FindByName( nil, "spawn_moobs_31"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_32"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_33"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))


	point = Entities:FindByName( nil, "spawn_moobs_34"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_35"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))

	point = Entities:FindByName( nil, "spawn_moobs_36"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))

	point = Entities:FindByName( nil, "spawn_moobs_37"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_38"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))	

	point = Entities:FindByName( nil, "spawn_moobs_39"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_40"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,-1,0)
	unit:SetForwardVector(Vector(1,-1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_41"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_42"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))

	point = Entities:FindByName( nil, "spawn_moobs_43"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_44"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_45"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))

	point = Entities:FindByName( nil, "spawn_moobs_46"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_47"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(-1,0,0)
	unit:SetForwardVector(Vector(-1,0,0))	
	
	point = Entities:FindByName( nil, "spawn_moobs_48"):GetAbsOrigin()
	unit = CreateUnitByName("npc_dragon", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))

	point = Entities:FindByName( nil, "spawn_moobs_49"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,1,0)
	unit:SetForwardVector(Vector(0,1,0))
	
	point = Entities:FindByName( nil, "spawn_moobs_50"):GetAbsOrigin()
	unit = CreateUnitByName("npc_golem", point + RandomVector( RandomFloat( 0, 100 )), true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(0,-1,0)
	unit:SetForwardVector(Vector(0,-1,0))	

	point = Entities:FindByName( nil, "spawn_moobs_51"):GetAbsOrigin()
	unit = CreateUnitByName("npc_volcanic_golem", point, true, nil, nil, DOTA_TEAM_NEUTRALS  )	
	unit.vSpawnLoc = unit:GetOrigin()
	unit.vSpawnVector = Vector(1,0,0)
	unit:SetForwardVector(Vector(1,0,0))
	
end


 function main:OnEntityKilled (data)
    local killedUnit = EntIndexToHScript( data.entindex_killed )
    if killedUnit:IsNeutralUnitType() or killedUnit:IsCreature() then
        main:RollDrops(killedUnit)
    end
   end

   
  function main:RollDrops(unit)
    local DropInfo = GameRules.DropTable[unit:GetUnitName()]
    if DropInfo then
        for item_name,chance in pairs(DropInfo) do
            if RollPercentage(chance) then
                -- Create the item
                local item = CreateItem(item_name, nil, nil)
                local pos = unit:GetAbsOrigin()
                local drop = CreateItemOnPositionSync( pos, item )
                local pos_launch = pos+RandomVector(RandomFloat(50,50))
                item:LaunchLoot(false, 200, 0.75, pos_launch)
            end
        end
    end
end 