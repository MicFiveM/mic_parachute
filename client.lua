
ESX = exports["es_extended"]:getSharedObject()
-- ESX, playerloaded
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent("GivePedWeapon")
AddEventHandler("GivePedWeapon", function()
    local weapon = GetHashKey("GADGET_PARACHUTE")
    local ped = GetPlayerPed(PlayerId())
    GiveWeaponToPed(ped, weapon, 1000, false, false)
    SetPedComponentVariation(GetPlayerPed(-1), 5, 63, 0, 0)
end)

RegisterNetEvent("RemovePedWeapon")
AddEventHandler("RemovePedWeapon", function()
    local weapon = GetHashKey("GADGET_PARACHUTE")
    local ped = GetPlayerPed(PlayerId())
    RemoveWeaponFromPed(ped, weapon)

    Wait(3000)
    SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 0)
end)

RegisterNetEvent("RemovePedWeapon2")
AddEventHandler("RemovePedWeapon2", function()
    local weapon = GetHashKey("GADGET_PARACHUTE")
    local ped = GetPlayerPed(PlayerId())
    SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 0)
end)


function reloadSkin()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  local model = nil
       
  if skin.sex == 0 then
    model = GetHashKey("mp_m_freemode_01")
  else
    model = GetHashKey("mp_f_freemode_01")
  end

  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)

  TriggerEvent('skinchanger:loadSkin', skin)
  TriggerEvent('esx:restoreLoadout')
  end)
end
