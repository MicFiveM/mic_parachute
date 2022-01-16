local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterUsableItem('parachute', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerPed = GetPlayerPed(-1)
  if not xPlayer.hasWeapon("GADGET_PARACHUTE") then 
	TriggerClientEvent("GivePedWeapon", source)
	xPlayer.removeInventoryItem("parachute", 1)
	xPlayer.addInventoryItem("noparachute", 1)
	TriggerClientEvent('esx:showNotification', source,('You ~g~used ~w~the ~b~parachute'))
  end
end)



ESX.RegisterUsableItem('noparachute', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerPed = GetPlayerPed(-1)
	if xPlayer.hasWeapon("GADGET_PARACHUTE") then
	TriggerClientEvent("RemovePedWeapon", source)
	xPlayer.addInventoryItem("parachute", 1)
	xPlayer.removeInventoryItem("noparachute", 1)
    TriggerClientEvent('esx:showNotification', source,('You ~r~removed ~w~your ~b~parachute!'))
	elseif not xPlayer.hasWeapon("GADGET_PARACHUTE") then
		TriggerClientEvent("RemovePedWeapon2", source)
		xPlayer.removeInventoryItem("noparachute", 1)
  end
end)

   