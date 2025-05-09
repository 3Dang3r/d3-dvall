local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("dvall", "Delete All Unused Vehicles", {}, true, function(source, args)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    TriggerClientEvent('chat:addMessage', -1, {

        template = '<div class="chat-message" style="background-color: rgba(255, 4, 4, 0.93);"><b></b> {0}</div>',
        args = {"Server: Dvall will happen in 10 seconds..."}
    })

    SetTimeout(10000, function()
        TriggerClientEvent('d3-dvall:client:deleteAllVehicles', -1)
    end)
end, "god")
