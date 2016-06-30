function Respawn(data)

local moob = data.caster
local name = moob:GetUnitName()
local SpawnLoc = moob.vSpawnLoc
local SpawnVector = moob.vSpawnVector

if (name == "npc_bird") then
	SpawnLoc = Entities:FindByName( nil, "spawn_bird_" .. RandomInt(1, 13)):GetAbsOrigin()
end

if (SpawnLoc == nil) then
	SpawnLoc = moob:GetOrigin()
end

if (SpawnVector == nil) then
	SpawnVector = Vector(0,-1,0)
end

GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d",moob:GetEntityIndex()), 
	function()
	local unit = CreateUnitByName(name, SpawnLoc, true, nil, nil, DOTA_TEAM_NEUTRALS )
	unit.vSpawnLoc = SpawnLoc 
	unit.vSpawnVector = SpawnVector
	unit:SetForwardVector(SpawnVector)
	end,
	nCREATURE_RESPAWN_TIME)

end


function BossesRespawn(data)

local moob = data.caster
local name = moob:GetUnitName()
local SpawnLoc = moob.vSpawnLoc
local SpawnVector = moob.vSpawnVector
if (SpawnLoc == nil) then
	SpawnLoc = moob:GetOrigin()
end

if (SpawnVector == nil) then
	SpawnVector = Vector(0,-1,0)
end

GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d",moob:GetEntityIndex()), 
	function()
	local unit = CreateUnitByName(name, SpawnLoc, true, nil, nil, DOTA_TEAM_NEUTRALS )
	unit.vSpawnLoc = SpawnLoc 
	unit.vSpawnVector = SpawnVector
	unit:SetForwardVector(SpawnVector)
	end,
	300)

end



function RuneRespawn(data)

local moob = data.caster
local name = moob:GetUnitName()
local SpawnLoc = moob.vSpawnLoc
local SpawnVector = moob.vSpawnVector
if (SpawnLoc == nil) then
	SpawnLoc = moob:GetOrigin()
end

if (SpawnVector == nil) then
	SpawnVector = Vector(0,-1,0)
end

GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d",moob:GetEntityIndex()), 
	function()
	local unit = CreateUnitByName(name, SpawnLoc, true, nil, nil, DOTA_TEAM_NEUTRALS )
	unit.vSpawnLoc = SpawnLoc 
	unit.vSpawnVector = SpawnVector
	unit:SetForwardVector(SpawnVector)
	end,
	120)

end


function SetWinner(data)
GameRules:MakeTeamLose(data.caster:GetTeamNumber())
end

function AddRegeneration(data)
local Attacker = data.attacker
Attacker:AddNewModifier( data.caster, nil, "modifier_rune_regen", {} )
end


function GiveRegeneration(data)

local hero = data.caster
hero:AddNewModifier( hero, nil, "modifier_rune_regen", {} )
local point = hero:GetAbsOrigin() + (hero:GetForwardVector() * 150)	
RespawnItem(point,"item_rune_regen",(hero:GetEntityIndex()+1))
	
GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d",hero:GetEntityIndex()), 
	function()
		for i = 0, 5 do		
			local item = hero:GetItemInSlot(i)
			if item ~= nil then
				if item:GetAbilityName() == "item_rune_regen" then
					hero:RemoveItem(item)		
				end
			end
		end
	end,
	0.00000001)


	


end


function RespawnItem(pos,name,index)
GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d",index), 
	function()
		local item = CreateItem(name, nil, nil)
		local drop = CreateItemOnPositionSync( pos, item )
	end,
	120)	
end