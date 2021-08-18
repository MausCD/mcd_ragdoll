------------------------------------------ Config ------------------------------------------

local servername = Config.servername
local fallchance = Config.fallchance   
local language = Config.language 
local command = 0 
if(Config.command == true) then
    command = 1
end  
print(command)
local fallchancew = Config.fallchancew 
local wfall = Config.wfall 
local usingstatus = Config.usingstatus 
local drunkfallchance = Config.drunkfallchance
local drunkfallchancew = Config.drunkfallchancew
local drunktext = Config.drunktext

--------------------------------------------- END ---------------------------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local wait = false
local waitw = false
local fun = 0
local debugg = false
local ragdoll = 1
local retval = IsPedInAnyVehicle(ped,atGetIn --[[ boolean ]])
local isfallen = "You tripped/slipped"
local nocommand = "Funmode command not aktivated!"
local funmodeon = "Funmode: ON"
local funmodeoff = "Funmode: OFF"
local isfallenw = "You tripped"
local drunktext1 = "You are drunk run carefully ;)"
local drunktext2 = "You are no longer drunk run!"
local debuggon = "Debugg: ON"
local debuggoff = "Debugg: OFF"


Citizen.CreateThread(function(source)	
    while true do
        Citizen.Wait(0)
        if (language == "en") then
            isfallen = "You tripped/slipped"
            nocommand = "Funmode command not aktivated!"
            funmodeon = "Funmode: ON"
            funmodeoff = "Funmode: OFF"
            isfallenw = "You tripped"
            drunktext1 = "You are drunk run carefully ;)"
            drunktext2 = "You are no longer drunk run!"
        else
            if (language == "de") then
            isfallen = "Du bist gestolpert/abgerutscht"
            nocommand = "Funmode Kommand wurde nicht aktiviert!"
            funmodeon = "Funmode: AN"
            funmodeoff = "Funmode: AUS"
            isfallenw = "Du bist gestolpert"
            drunktext1 = "Du bist bedrunken lauf vorsichtig ;) "
            drunktext2 = "Du bist nicht mehr bedrunken lauf!"

            else 
            isfallen = "translation ".. language .. " doesn`t exist"
            nocommand = "translation ".. language .." doesn`t exist"
            funmodeon = "translation ".. language .." doesn`t exist"
            funmodeoff = "translation ".. language .." doesn`t exist"
            isfallenw = "translation ".. language .. " doesn`t exist"
            drunktext1 = "translation ".. language .. " doesn`t exist"
            drunktext2 = "translation ".. language .. " doesn`t exist"
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
        if(debugg == true) then
        print("Fun: "..fun)
        end


        local ragdoll = 1
        if (fun == 0) then
        ragdoll = math.random(1,fallchance)
        if(debugg == true) then
        print(ragdoll)
        end
        end

        -- print(ragdoll)
        -- print(retval)
        -- print(ped)

        -- print(fun)
        if (ragdoll == 1) then
            -- print('ragdoll')
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

-- w fall

	
if IsControlPressed(1, 32) then
if (wfall == true) then
    ped = GetPlayerPed(-1)
    local isinvehicle = IsPedInAnyVehicle(ped,false)
    if (isinvehicle == false) then
    if (waitw == false) then
        waitw = true

    local ragdollw = 1
    if (fun == 0) then
    ragdollw = math.random(1,fallchancew)
    if(debugg == true) then
    print(ragdollw)
    end
    end

    if (ragdollw == 1) then
        Citizen.Wait(700)
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
        TriggerEvent('pNotify:SendNotification', {
            text = {isfallenw}
        })
    end
    Citizen.Wait(1000)
    waitw = false
end end end end end 
end)

RegisterNetEvent("fun")
AddEventHandler("fun", function(souce)
local seted = 0

    if (fun == 0) then
    fun = 1
    ragdoll = 1
    if(debugg == true) then
    print('FUNmode on')
    end
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
        if(debugg == true) then
        print('FUNmode off')
        end
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {servername, funmodeoff}
            })
    end end


    seted = 0
end)

RegisterNetEvent("toggledebugg")
AddEventHandler("toggledebugg", function(souce)
local setedd = false

    if (debugg == false) then
    debugg = true
    setedd = true
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {servername, debuggon}
        })
    end

    if (setedd == false) then
    if (debugg == true) then
        debugg = false

        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {servername, debuggoff}
            })
    end end


    setedd = false
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

RegisterCommand("ragdolldebugg", function(source)
    TriggerEvent("toggledebugg")
end)


-- basic needs
local mfallchance = fallchance
local mfallchancew = fallchancew

RegisterNetEvent("mcd_ragdoll:drunk")
AddEventHandler("mcd_ragdoll:drunk", function(source,isdrunk)
    if(isdrunk == true) then
        mfallchance = fallchance
        fallchance = drunkfallchance
        mfallchancew = fallchancew
        fallchancew = drunkfallchancew
        if (drunktext == true) then
        TriggerEvent('pNotify:SendNotification', {
            text = {drunktext1}
        })
    end

        if(debugg == true) then
            print("mfallchance: "..mfallchance)
            print("mfallchancew: "..mfallchancew)
            print("drunkfallchance: "..drunkfallchance)
            print("drunkfallchancew: "..drunkfallchancew)
        end
    else
        TriggerEvent('mcd_ragdoll:undrunk', mfallchancew, mfallchance)
    end
end)

RegisterNetEvent("mcd_ragdoll:undrunk")
AddEventHandler("mcd_ragdoll:undrunk", function(mfallchancew,mfallchance)
        fallchance = mfallchance
        fallchancew = mfallchancew
        if (drunktext == true) then
        TriggerEvent('pNotify:SendNotification', {
            text = {drunktext2}
        })
         end
        if(debugg == true) then
            print("fallchance: "..fallchance)
            print("mfallchance: "..mfallchance)
            print("fallchancew: "..fallchancew)
            print("mfallchancew: "..mfallchancew)

        end
end)
 
local isdrunk = false
Citizen.CreateThread(function(source)	
    while true do
        Citizen.Wait(0)
        if(usingstatus == true) then
        TriggerEvent('esx_status:getStatus', 'drunk', function(status)
            if(status.val >= 1) then
                if(isdrunk == false) then
                source = status.val
                isdrunk = true
                TriggerEvent('mcd_ragdoll:drunk', source, isdrunk)
                end
            end
            if(status.val == 0) then
                if(isdrunk == true) then
                source = status.val
                isdrunk = false
                TriggerEvent('mcd_ragdoll:drunk', source, isdrunk)
                end
            end


        end)
    end
    end
end)
print("[MCD_Ragdoll]: Script Version 1.0")

