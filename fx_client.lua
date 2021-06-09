-- kadet.julcia#1234
-- kadet.julcia#1234

-- [CONFIG]--
local blips = false -- jesli false to nie ma blipow jestli true sa blipy <3
local napis = "Naciśnij [~p~E~w~] aby robić pompki" -- Tekst który pisze
local miejscapompki = { -- Miejsca gdzie mozna robic pompki

  {x=-1201.67, y=-1567.38, z=4.61},

}
-- [CONFIG]--



-- kadet.julcia#1234
-- kadet.julcia#1234


ESX = nil
  
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


-- kadet.julcia#1234
-- kadet.julcia#1234



local hujek = false


-- kadet.julcia#1234
-- kadet.julcia#1234

function CwiczeniaStart ()
      Citizen.CreateThread(function()
          local ped = PlayerPedId()
          local procent = 0
          hujek = true
          ClearPedTasks(ped)
          FreezeEntityPosition(PlayerPedId(), true)
          ESX.Streaming.RequestAnimDict("amb@world_human_push_ups@male@base", function()
              TaskPlayAnim(PlayerPedId(), "amb@world_human_push_ups@male@base", "base", 8.0, -8.0, -1, 2, 0, false, false, false)
          end)
          while procent <= 500 do
              ESX.Game.Utils.DrawText3D(GetEntityCoords(ped), "~p~" .. tonumber(procent * 0.2) ..'~w~%', 1)
              Wait(0)
              procent = procent + 1
          end
          FreezeEntityPosition(PlayerPedId(), false)
          ClearPedTasks(ped)
          hujek = false
   end)
  end
  

-- kadet.julcia#1234
-- kadet.julcia#1234


  Citizen.CreateThread(function()
        while true do
    Wait(0)
    for _, fxcudo in pairs(miejscapompki) do
    if(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), fxcudo.x, fxcudo.y, fxcudo.z, true) < 3.0) and hujek == false then
    ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby zaczac robic ~p~pompki')
    if IsControlJustReleased(0, 38) then
        CwiczeniaStart()
         end
        end
       end
      end
    end)


-- kadet.julcia#1234
-- kadet.julcia#1234

    
  Citizen.CreateThread(function()
      while true do
          Wait(0)
         for _, fxcudo in pairs(miejscapompki) do
              if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), fxcudo.x, fxcudo.y, fxcudo.z, true) < 15 and hujek == false then
                  DrawText3DTest(fxcudo.x, fxcudo.y, fxcudo.z, napis, 1)
            end
        end
    end
  end)
  


-- kadet.julcia#1234
-- kadet.julcia#1234

  -- Blip
  Citizen.CreateThread(function()
    if blips then
    for _, fxcudo in pairs(miejscapompki) do
      local blip = AddBlipForCoord(fxcudo.x, fxcudo.y, fxcudo.z)
      SetBlipSprite (blip, 570)
      SetBlipDisplay(blip, 4)
      SetBlipScale  (blip, 0.5)
      SetBlipColour (blip, 5)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentString('Siłownia')
      EndTextCommandSetBlipName(blip)
    end
    end
  end)


-- kadet.julcia#1234
-- kadet.julcia#1234

-- Inne

  function DrawText3DTest(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
            SetTextScale(0.2, 0.2)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 55)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
    end
end


-- kadet.julcia#1234
-- kadet.julcia#1234