------------------------------------------ CONFIG ------------------------------------------

local servername = "Shadow-V"   -- place here your server name




local fallchance = 10   -- place here the chanze to fall (standart 1/10)




local language = "de" -- write lower case (Available languages: de,en)




local command = 1 -- de-, aktivate funmode command 1 = true , 0 == false   






--------------------------------------------- END ---------------------------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local wait = false
local fun = 0
local ragdoll = 1
local retval = IsPedInAnyVehicle(ped,atGetIn --[[ boolean ]])
local isfallen = "You tripped/slipped"
local nocommand = "Funmode command not aktivated!"
local funmodeon = "Funmode: ON"
local funmodeoff = "Funmode: OFF"


Citizen.CreateThread(function(source)	
    while true do
        Citizen.Wait(0)
        if (language == "en") then
            isfallen = "You tripped/slipped"
            nocommand = "Funmode command not aktivated!"
            funmodeon = "Funmode: ON"
            funmodeoff = "Funmode: OFF"
        else
            if (language == "de") then
            isfallen = "Du bist gestolpert/abgerutscht"
            nocommand = "Funmode Kommand wurde nicht aktiviert!"
            funmodeon = "Funmode: AN"
            funmodeoff = "Funmode: AUS"

            else 
            isfallen = "translation ".. language .. " doesn`t exist"
            nocommand = "translation ".. language .." doesn`t exist"
            funmodeon = "translation ".. language .." doesn`t exist"
            funmodeoff = "translation ".. language .." doesn`t exist"
        end end

    end 
end)


Citizen.CreateThread(function(source)	
    while true do
        Citizen.Wait(0) 		
        if IsControlPressed(1, 22 --[[ "x" key ]]) then
        ped = GetPlayerPed(-1)
        local retval = IsPedInAnyVehicle(ped,false --[[ boolean ]])
        if (retval == false) then
        if (wait == false) then
        wait = true
        print("Fun: "..fun)

        local ragdoll = 1
        if (fun == 0) then
        ragdoll = math.random(1,fallchance)
        end

        print(ragdoll)
        print(retval)
        print(ped)
        -- TriggerEvent('pNotify:SendNotification', {
        --     text = {ragdoll}
        -- })
        -- print(fun)
        if (ragdoll == 1) then
            print('ragdoll')
            Citizen.Wait(700)
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
            TriggerEvent('pNotify:SendNotification', {
                text = {isfallen}
            })
        end
        Citizen.Wait(1000)
        wait = false
        end 
        end
        end
        

    end 
end)

RegisterNetEvent("fun")
AddEventHandler("fun", function(souce)
local seted = 0

    if (fun == 0) then
    fun = 1
    ragdoll = 1
    print('FUNmode on')
    seted = 1
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {servername, funmodeon}
        })
    end

    if (seted == 0) then
    if (fun == 1) then
        fun = 0
        print('FUNmode off')

        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {servername, funmodeoff}
            })
    end end


    seted = 0
end)

RegisterCommand("ragdollfun", function(source)
    if (command == 1) then
    TriggerEvent("fun")
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {servername, nocommand}
            })

    end
end)


    