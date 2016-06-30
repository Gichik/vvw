-- Generated from template

if main == nil then
	_G.main = class({})
end

require( 'main' )
require( 'timers' )

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	
	---------------------------------models-------------------------------
	PrecacheModel("models/heroes/hero_doom/doom.vmdl", context)	
	PrecacheModel("models/items/courier/grim_wolf/grim_wolf_flying.vmdl", context) --bat

	PrecacheModel("models/creeps/neutral_creeps/n_creep_golem_a/neutral_creep_golem_a.vmdl", context) --golem
	PrecacheModel("models/creeps/neutral_creeps/n_creep_black_dragon/n_creep_black_dragon.vmdl", context) --dragon	


	PrecacheModel("models/heroes/chaos_knight/chaos_knight.vmdl", context) --knight	
	PrecacheModel("models/heroes/chaos_knight/chaos_knight_mount.vmdl", context) 	
	PrecacheModel("models/items/chaos_knight/hellfire_edge/hellfire_edge.vmdl", context) 
	PrecacheModel("models/items/chaos_knight/chaos_legion_shield/chaos_legion_shield.vmdl", context) 
	PrecacheModel("models/items/chaos_knight/discord_head_closed/discord_head_closed.vmdl", context) 

	PrecacheModel("models/heroes/visage/visage.vmdl", context) --ice dragon 	
	
	PrecacheModel("models/items/warlock/golem/obsidian_golem/obsidian_golem.vmdl", context) --volcanic golem
	PrecacheModel("models/heroes/beastmaster/beastmaster_bird.vmdl", context) --bird
	PrecacheModel("models/props_gameplay/rune_regeneration01.vmdl", context) --rune
	
	---------------------------------spells-------------------------------
	
	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_treant/", context) ---Hunter
	PrecacheResource("particle_folder", "particles/units/heroes/hero_terrorblade/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bounty_hunter/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_spirit_breaker/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ursa/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_naga_siren/", context)

	PrecacheResource("particle_folder", "particles/units/heroes/hero_bloodseeker/", context) ---Shadowlord
	PrecacheResource("particle_folder", "particles/units/heroes/hero_visage/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_slark/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_slardar/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_queenofpain/", context)

	PrecacheResource("particle_folder", "particles/units/heroes/hero_windrunner/", context)	---FleshEater 
	PrecacheResource("particle_folder", "particles/units/heroes/hero_weaver/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_life_stealer/", context)	

	PrecacheResource("particle_folder", "particles/units/heroes/hero_pugna/", context) ---Devastator

	PrecacheResource("particle_folder", "particles/units/heroes/hero_magnataur/", context) ---Stoneskin
	PrecacheResource("particle_folder", "particles/units/heroes/hero_dragon_knight/", context) 

	PrecacheResource("particle_folder", "particles/units/heroes/hero_axe/", context) ---Ferocious	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_huskar/", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_venomancer/", context) 

	PrecacheResource("particle_folder", "particles/units/heroes/hero_chaos_knight/", context)		
	PrecacheResource("particle_folder", "particles/units/heroes/hero_razor/", context)	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_legion_commander/", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_elder_titan/", context)
	
	
	
	PrecacheResource("particle_folder", "particles/units/heroes/hero_crystalmaiden/", context) --girls attack
	PrecacheResource("particle_folder", "particles/units/heroes/hero_omniknight/", context) --man attack
	PrecacheResource("particle_folder", "particles/units/heroes/hero_tuskarr", context) --tusk attack
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ancient_apparition/", context) --apparation attack	
	PrecacheResource("particle", "particles/neutral_fx/black_dragon_attack.vpcf", context) --dragon attack
	PrecacheResource("particle", "particles/units/heroes/hero_visage/visage_base_attack.vpcf", context) --death dragon attack	
	PrecacheResource("particle", "particles/units/heroes/hero_furion/furion_base_attack.vpcf", context) --bird attack	
	
	
	---------------------------------sounds------------------------------	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_treant.vsndevts", context )		
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_terrorblade.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bounty_hunter.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_spirit_breaker.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_ursa.vsndevts", context )	
--	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_naga_siren.vsndevts", context )	
	
	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bloodseeker.vsndevts", context )		
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_visage.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_slark.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_slardar.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_queenofpain.vsndevts", context )	

	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_weaver.vsndevts", context )		
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_life_stealer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pugna.vsndevts", context )

	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_magnataur.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_dragon_knight.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_venomancer.vsndevts", context )

	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_elder_titan.vsndevts", context )		
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_chaos_knight.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_razor.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_legion_commander.vsndevts", context )	

	
	
	local pathToIG = LoadKeyValues("scripts/items/items_game.txt") 
	PrecacheForHero("npc_dota_hero_lycan", pathToIG, context)
	PrecacheForHero("npc_dota_hero_night_stalker", pathToIG, context)	
	PrecacheForHero("npc_dota_hero_omniknight", pathToIG, context)
	PrecacheForHero("npc_dota_hero_crystal_maiden", pathToIG, context)
	PrecacheForHero("npc_dota_hero_tuskarr", pathToIG, context)
	PrecacheForHero("npc_dota_hero_ancient_apparition", pathToIG, context)	
	PrecacheForHero("npc_dota_hero_visage", pathToIG, context)		
end

-- Create the game mode when we activate
function Activate()
	main:InitGameMode()
end



function IsForHero(str, tbl)
	if type(tbl["used_by_heroes"]) ~= type(1) and tbl["used_by_heroes"] then -- привет от вашего друга, индийского быдлокодера работающего за еду
		if tbl["used_by_heroes"][str] then
			return true
		end
	end
	return false
end

function PrecacheForHero(name,path,context)

	print('[PrecacheHero] Start')
print("----------------------------------------Precache Start----------------------------------------")

	local wearablesList = {} --переменная для надеваемых шмоток(для всех героев)
	local precacheWearables = {} --переменная только для шмоток нужного героя
	local precacheParticle = {}
	for k, v in pairs(path) do
		if k == 'items' then
			wearablesList = v
		end
	end
	local counter = 0
	local counter_particle = 0
	local value
	for k, v in pairs(wearablesList) do -- выбираем из списка предметов только предметы на нужных героев
		if IsForHero(name, wearablesList[k]) then
			if wearablesList[k]["model_player"] then
				value = wearablesList[k]["model_player"] 
				precacheWearables[value] = true
			end
			if wearablesList[k]["particle_file"] then -- прекешируем еще и частицы, куда ж без них!
				value = wearablesList[k]["particle_file"] 
				precacheParticle[value] = true
			end
		end
	end

	for wearable,_ in pairs( precacheWearables ) do --собственно само прекеширование всех занесенных в список шмоток
		print("Precache model: " .. wearable)
		PrecacheResource( "model", wearable, context )
		counter = counter + 1
	end

	for wearable,_ in pairs( precacheParticle) do --и прекеширование частиц
		print("Precache particle: " .. wearable)
		PrecacheResource( "particle", wearable, context )
		counter_particle = counter_particle + 1

	end

	PrecacheUnitByNameSync(name, context) -- прекешируем саму модель героя! иначе будут бегать шмотки без тела
		
    print('[Precache]' .. counter .. " models loaded and " .. counter_particle .." particles loaded")
	print('[Precache] End')

end