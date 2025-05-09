local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
  local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
  end
  
  function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end
  
  RegisterNetEvent('d3-dvall:client:deleteAllVehicles', function()
      local deleted = 0
  
      for vehicle in EnumerateVehicles() do
          if DoesEntityExist(vehicle) then
              local driver = GetPedInVehicleSeat(vehicle, -1)
  
              if not IsPedAPlayer(driver) then
                  if not NetworkHasControlOfEntity(vehicle) then
                      NetworkRequestControlOfEntity(vehicle)
                      local attempts = 0
                      while not NetworkHasControlOfEntity(vehicle) and attempts < 50 do
                          Wait(10)
                          attempts = attempts + 1
                          NetworkRequestControlOfEntity(vehicle)
                      end
                  end
  
                  if NetworkHasControlOfEntity(vehicle) then
                      SetEntityAsMissionEntity(vehicle, true, true)
                      SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                      DeleteVehicle(vehicle)
  
                      if DoesEntityExist(vehicle) then
                          DeleteEntity(vehicle)
                      end
  
                      if not DoesEntityExist(vehicle) then
                          deleted = deleted + 1
                      end
                  end
              end
          end
      end
  
      TriggerEvent('chat:addMessage', {

        template = '<div class="chat-message" style="background-color: rgba(255, 4, 4, 0.93);"><b></b> {0}</div>',
        args = {"Server: Dvall Done."}
      })
  end)


  