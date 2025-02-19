QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kps-anotify:client:PullUpInputDialog')
AddEventHandler('kps-anotify:client:PullUpInputDialog', function()
    local input = lib.inputDialog('ADMINISTRATOR NOTIFICATION', {
        {type = 'number', label = 'Player ID?', description = 'The id of the person you want to send the notification to. (0 = Notify the entire server!)', required = true},
        {type = 'input', label = 'Content of the notification', required = true},
        {type = 'number', label = 'Notification duration', description = 'In milliseconds', required = false},
        {type = 'input', label = 'Notification title', required = false},
        {type = 'select', label = 'Position', options = {
            {value = 'top', label = 'TOP'},
            {value = 'top-right', label = 'TOP-RIGHT'},
            {value = 'top-left', label = 'TOP-LEFT'},
            {value = 'bottom', label = 'BOTTOM'},
            {value = 'bottom-right', label = 'BOTTOM-RIGHT'},
            {value = 'bottom-left', label = 'BOTTOM-LEFT'},
            {value = 'center', label = 'CENTER'},
            {value = 'center-right', label = 'CENTER-RIGHT'},
            {value = 'center-left', label = 'CENTER-LEFT'},
        }, required = false},
        {type = 'select', label = 'TYPE', options = {
            {value = 'inform', label = 'INFORM'},
            {value = 'error', label = 'ERROR'},
            {value = 'success', label = 'SUCCESS'},
            {value = 'warning', label = 'WARNING'},
        }, required = false},
      })

    if not input then return end

    local targetid = input[1]
    local desc = input[2]
    local duration = input[3]
    local title = input[4]
    local pos = input[5]
    local type = input[6]

    TriggerServerEvent('kps-anotify:server:DisplayNotify', targetid, desc, duration, title, pos, type)
end)
