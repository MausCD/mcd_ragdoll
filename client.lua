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
local togglewkeyon = "Falling on W-Key: ON"
local togglewkeyoff = "Falling on W-Key: OFF"
local togglespacekeyon = "Falling on Space-Key: ON"
local togglespacekeyoff = "Falling on Space-Key: OFF"
local setting1 = "/ragdollsettings togglew --toggles Falling on pressing w in Funmode"
local setting2 = "/ragdollsettings togglespace --toggles Falling on pressing space in Funmode"
local ison = false
local toggled2 = false
local ison2 = true
local toggled3 = false
local fun1 = 0
local fun2 = 0
local mfallchance = fallchance
local mfallchancew = fallchancew


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
            debuggon = "Debugg: ON"
            debuggoff = "Debugg: OFF"
            togglewkeyon = "Falling on W-Key: ON"
            togglewkeyoff = "Falling on W-Key: OFF"
            togglespacekeyon = "Falling on Space-Key: ON"
            togglespacekeyoff = "Falling on Space-Key: OFF"
            setting1 = "/ragdollsettings togglew --toggles Falling on pressing w in Funmode"
            setting2 = "/ragdollsettings togglespace --toggles Falling on pressing space in Funmode"
        else
            if (language == "de") then
            isfallen = "Du bist gestolpert/abgerutscht"
            nocommand = "Funmode Kommand wurde nicht aktiviert!"
            funmodeon = "Funmode: AN"
            funmodeoff = "Funmode: AUS"
            isfallenw = "Du bist gestolpert"
            drunktext1 = "Du bist bedrunken lauf vorsichtig ;) "
            drunktext2 = "Du bist nicht mehr bedrunken lauf!"
            debuggon = "Debugg: AN"
            debuggoff = "Debugg: AUS"
            togglewkeyon = "Fallen bei W-Key: AN"
            togglewkeyoff = "Fallen bei W-Key: AUS"
            togglespacekeyon = "Fallen bei Space-Key: AN"
            togglespacekeyoff = "Fallen bei Space-Key: AUS"
            setting1 = "/ragdollsettings togglew --Stolpern beim drücken von w im Funmode umschalten"
            setting2 = "/ragdollsettings togglespace --Stolpern beim drücken von leertaste im Funmode umschalten"

            else 
            isfallen = "translation ".. language .. " doesn`t exist"
            nocommand = "translation ".. language .." doesn`t exist"
            funmodeon = "translation ".. language .." doesn`t exist"
            funmodeoff = "translation ".. language .." doesn`t exist"
            isfallenw = "translation ".. language .. " doesn`t exist"
            drunktext1 = "translation ".. language .. " doesn`t exist"
            drunktext2 = "translation ".. language .. " doesn`t exist"
            debuggon = "translation ".. language .. " doesn`t exist"
            debuggoff = "translation ".. language .. " doesn`t exist"
            togglewkeyon = "translation ".. language .. " doesn`t exist"
            togglewkeyoff = "translation ".. language .. " doesn`t exist"
            togglespacekeyon = "translation ".. language .. " doesn`t exist"
            togglespacekeyoff = "translation ".. language .. " doesn`t exist"
            setting1 = "translation ".. language .. " doesn`t exist"
            setting2 = "translation ".. language .. " doesn`t exist"
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
        print("Fun1: ",fun1)
        end


        local ragdoll = 1
        if (fun1 == 0) then
        ragdoll = math.random(1,fallchance)
        if(debugg == true) then
        print(ragdoll)
        end
        end
        if (ragdoll == 1) then
            Citizen.Wait(700)
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
            TriggerEvent('pNotify:SendNotification', {
                text = {isfallen}
            })
        end
        Citizen.Wait(1000)
        wait = false
        end end end

-- w fall

	
if IsControlPressed(1, 32) then
if (wfall == true) then
    ped = GetPlayerPed(-1)
    local isinvehicle = IsPedInAnyVehicle(ped,false)
    if (isinvehicle == false) then
    if (waitw == false) then
        waitw = true

    local ragdollw = 1
    if (fun2 == 0) then
    ragdollw = math.random(1,fallchancew)
    end
    if(debugg == true) then
        print(ragdollw)
        print("Fun2: ",fun2)
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


--w and space

if IsControlPressed(1, 32) and IsControlPressed(1, 22 --[[ "x" key ]]) then
    ped = GetPlayerPed(-1)
    local retval = IsPedInAnyVehicle(ped,false --[[ boolean ]])
    if (retval == false) then
    if (wait == false) then
    wait = true
    if(debugg == true) then
    print("Fun1: ",fun1)
    end


    local ragdoll = 1
    if (fun1 == 0) then
    ragdoll = math.random(1,fallchance)
    if(debugg == true) then
    print(ragdoll)
    end
    end
    if (ragdoll == 1) then
        Citizen.Wait(700)
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
        TriggerEvent('pNotify:SendNotification', {
            text = {isfallen}
        })
    end
    Citizen.Wait(1000)
    wait = false
    end end end










end)

RegisterNetEvent("fun")
AddEventHandler("fun", function(souce)
local seted = 0

    if (fun == 0) then
    fun = 1
    if(ison2 == true) then
    fun1 = 1
    end
    if(ison == true) then
    fun2 = 1
    end
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
        fun2 = 0
        fun1 = 0
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
    print("mfallchance: "..mfallchance)
    print("mfallchancew: "..mfallchancew)
    print("drunkfallchance: "..drunkfallchance)
    print("drunkfallchancew: "..drunkfallchancew)
    print("fallchance: "..fallchance)
    print("fallchancew: "..fallchancew)
end)


-- basic needs


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






























RegisterCommand("ragdollsettings", function(source,input)
    if (command == 1) then
    TriggerEvent("settings",source,input)
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {servername, nocommand}
            })

    end
end)



RegisterNetEvent("settings")
AddEventHandler("settings", function(source,input)
    local input = table.unpack(input)
        if(input == nil) then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {servername,setting1}
                })
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {servername,setting2}
                    })
        end
    
        if(input == "togglew") then
            if(ison == false) then
            ison = true
            toggled2 = true
            fun2 = 1
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {servername,togglewkeyon}
                })
            end

            if(toggled2 == false) then
            if(ison == true) then
                ison = false
                fun2 = 0
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {servername,togglewkeyoff}
                    })
                end
            end
            toggled2 = false
        end

        if(input == "togglespace") then
            if(ison2 == false) then
                ison2 = true
                toggled3 = true
                fun1 = 1
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {servername,togglespacekeyon}
                    })
                end
    
                if(toggled3 == false) then
                if(ison2 == true) then
                    ison2 = false
                    fun1 = 0
                    TriggerEvent('chat:addMessage', {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {servername,togglespacekeyoff}
                        })
                    end
                end
                toggled3 = false
        end
end)

