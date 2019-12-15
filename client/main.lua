ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

DistanceView = 10.0
DistanceActivate = 1.0

Citizen.CreateThread(function()																							
	while true do
		Citizen.Wait(1)
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)		
		
		---[Enter]
		if GetDistanceBetweenCoords(coords, 289.15, -1094.96, 29.42, true) < DistanceView then --Distance established where you can see the text
			ESX.Game.Utils.DrawText3D(vector3(287.75, -1095.07, 29.82), "~g~[REFUGIO]\n~c~Presiona ~g~[E] ~c~para entrar", 1.2, 4)
			if GetDistanceBetweenCoords(coords, 288.62, -1095.13, 29.42, true) < DistanceActivate then --Distance you can interact
				if IsControlJustPressed(0, 38) then --Press [E]
					DoScreenFadeOut(1000)
					Citizen.Wait(1500)
					SetEntityHeading(player, 357.43) --Direction in which the player will be looking
					ESX.Game.Teleport(player, { x = 265.16, y = -1002.65, z = -100.01 }) --Site where the player will appear
					DoScreenFadeIn(1500)
				end
			end
		end
		
		--[Exit]
		if GetDistanceBetweenCoords(coords, 266.06, -1007.6, -101.01, true) < DistanceView then --Distance established where you can see the text
			ESX.Game.Utils.DrawText3D(vector3(266.06, -1007.9, -100.71), "~g~[REFUGIO]\n~c~Presiona ~g~[E] ~c~para salir", 1.2, 4)
			if GetDistanceBetweenCoords(coords, 266.06, -1007.6, -101.01, true) < DistanceActivate then --Distance you can interact
				if IsControlJustPressed(0, 38) then --Press [E]
					DoScreenFadeOut(1000)
					Citizen.Wait(1500)
					SetEntityHeading(player, 266.92) ----Direction in which the player will be looking
					ESX.Game.Teleport(player, { x = 290.72, y = -1094.86, z = 28.41 }) --Site where the player will appear
					DoScreenFadeIn(1500)
				end
			end
		end
    end
end)
