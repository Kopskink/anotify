QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand('anotify', {
    help = 'Send an admin notification to the desired person.',
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('kps-anotify:client:PullUpInputDialog', source)
end)

RegisterNetEvent('kps-anotify:server:DisplayNotify')
AddEventHandler('kps-anotify:server:DisplayNotify', function(targetid, desc, duration, title, pos, type)

    local whole_server = QBCore.Functions.GetQBPlayers()

    if targetid == 0 then
        for _, player in pairs(whole_server) do
            lib.notify(player.PlayerData.source, {
                title = title,
                description = desc,
                duration = duration,
                type = type,
                position = pos,
            })
        end
        return
    end

    lib.notify(targetid, {
        title = title,
        description = desc,
        duration = duration,
        type = type,
        position = pos,
    })
end)
