ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()																							
	while true do
		Citizen.Wait(1)
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)
		
		for k, v in pairs(Config.Teleport) do
			if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.View then 
				ESX.Game.Utils.DrawText3D(vector3(v.Pos.x, v.Pos.y, v.Pos.z), v.Text, 1.2, 4)
				if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Activate then
					if not IsPedInAnyVehicle(player, false) then
						if IsControlJustPressed(0, 38) then
							if Config.Animation then
								RequestAnimDict("anim@mp_atm@enter")
								while not HasAnimDictLoaded("anim@mp_atm@enter") do
									Citizen.Wait(1000)
								end
									
								Citizen.Wait(200)
								TaskPlayAnim(player,"anim@mp_atm@enter","enter",1.0, 1.0, 3000, 9, 1.0, 0, 0, 0)
								Citizen.Wait(3000)
							end
							if Config.Blackout then
								DoScreenFadeOut(1000)
								Citizen.Wait(1500)
							end
							SetEntityHeading(player, v.Heading)
							ESX.Game.Teleport(player, v.Posout) 
							if Config.Blackout then
								DoScreenFadeIn(1500)
							end
						end
					end
				end
			end
		end
	end
end)
