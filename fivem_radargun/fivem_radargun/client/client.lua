local NUI = string.format("nui://%s/ui/index.html", GetCurrentResourceName())
local SPEED_GUN_MODEL = `weapon_radargun`

local function GetRaycast()
    local world, normal = GetWorldCoordFromScreenCoord(0.5, 0.5)
    local target = world + normal * CONFIG.RANGE
    local handle = StartShapeTestLosProbe(world.x, world.y, world.z, target.x, target.y, target.z, 2, PlayerPedId(), 4)

    while true do
        Wait(0)
        local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(handle)

        if retval ~= 1 then
            return hit, entityHit, endCoords
        end
    end
end

local hit, entityHit, endCoords 
local function ActivateSpeedDetection()
    DUI_OBJECT = CreateDui(NUI, 256, 256)

    local txdHandle = CreateRuntimeTxd("RadarDUI")
	local duiHandle = GetDuiHandle(DUI_OBJECT)
	local texture = CreateRuntimeTextureFromDuiHandle(txdHandle, "DUI", duiHandle)
    AddReplaceTexture("w_pi_radargun", "radargun_radar", "RadarDUI", "DUI")

    while IsPlayerFreeAiming(PlayerId(PlayerPedId())) == 1 do
        hit, entityHit, endCoords = GetRaycast()
        if IsEntityAVehicle(entityHit) then
            local ENTITY_SPEED = CONFIG.USE_MPH == true and GetEntitySpeed(entityHit)*3.6 or GetEntitySpeed(entityHit)*2.236936
            local DISTANCE_FROM_ENTITY = #(GetEntityCoords(PlayerPedId())-endCoords)
            
            SendDuiMessage(DUI_OBJECT, json.encode({
                SPEED = ENTITY_SPEED,
                DISTANCE = DISTANCE_FROM_ENTITY,
                SPEED_UNIT = CONFIG.SPEED_MEASURE_UNIT,
                DISTANCE_UNIT = CONFIG.DISTANCE_MEASURE_UNIT,
            }))
        end
        Wait(CONFIG.REFRESH_RATE)
    end
    AddReplaceTexture("w_pi_radargun", "radargun_radar", "w_pi_radargun", "radargun_radar")
    DestroyDui(DUI_OBJECT)
end

CreateThread(function()
    while true do
        Wait(800)
        if IsPlayerFreeAiming(PlayerId(PlayerPedId())) == 1 then
            if GetSelectedPedWeapon(PlayerPedId()) == SPEED_GUN_MODEL then 
                ActivateSpeedDetection()
            end
        end
    end
end)