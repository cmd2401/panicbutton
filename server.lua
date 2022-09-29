ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem('panicbutton', function(source)
      local xPlayer = ESX.GetPlayerFromId(source)
      if xPlayer.job.name == Config.JobName then
            TriggerClientEvent('panicbutton:sendCoords', source)
      end
end)

RegisterServerEvent('panicButton:syncPosition')
AddEventHandler('panicButton:syncPosition', function(position)

      local xPlayer = ESX.GetPlayerFromId(source)
      TriggerClientEvent('panicbutton:alarm', -1, xPlayer:getName(), position)

end)
