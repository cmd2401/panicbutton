ESX = exports['es_extended']:getSharedObject()

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
      PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
      PlayerData.job = job
end)


RegisterNetEvent('panicbutton:sendCoords')
AddEventHandler('panicbutton:sendCoords', function()

      local playerCoords = GetEntityCoords(PlayerPedId())
      TriggerServerEvent('panicButton:syncPosition', playerCoords)

end)

RegisterNetEvent('panicbutton:alarm')
AddEventHandler('panicbutton:alarm', function(playername, pos)

      if PlayerData ~= nil and PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.JobName then
      -- Blip
      local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
      SetBlipSprite(blip, Config.BlipSprite)
      SetBlipDisplay(blip, Config.BlipDisplay)
      SetBlipScale(blip, Config.BlipScale)
      SetBlipColour(blip, Config.BlipColor)
      SetBlipAsShortRange(blip, false)

      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(playername)
      EndTextCommandSetBlipName(blip)

      -- nachricht
      ESX.ShowNotification(Config.Translation .. playername .. Config.Translation2)

            Citizen.Wait(500000)
            RemoveBlip(blip)

      end


end)

function ShowNotification(text)
      SetNotificationTextEntry('STRING')
         AddTextComponentString(text)
      DrawNotification(false, true)
     end
