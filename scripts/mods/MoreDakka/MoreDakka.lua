local mod = get_mod("MoreDakka")


mod.on_disabled = function()
	if not mod.is_ready then
		return
	end

	mod.remove_buffs()
end

mod.update = function()
	if not mod.is_ready then
		return
	end

	if mod:is_enabled() then
		mod.refresh_buffs()
	else
		mod.remove_buffs()
	end
end

mod.on_game_state_changed = function(status, state)
	if status == "enter" and state == "StateIngame" then
		mod.is_ready = true
	end
end

mod.remove_buffs = function()
	if Managers.player:local_player() then
		local local_player_unit = Managers.player:local_player().player_unit
		if local_player_unit and Unit.alive(local_player_unit) then
			local buff_extension = ScriptUnit.has_extension(local_player_unit, "buff_system")
			
			if buff_extension and buff_extension:has_buff_type("markus_huntsman_headshot_no_ammo_count_buff") then
				local buff = buff_extension:get_non_stacking_buff("markus_huntsman_headshot_no_ammo_count_buff")
				buff_extension:remove_buff(buff.id)
			end

			if buff_extension and buff_extension:has_buff_type("twitch_attack_speed_buff") then
				local buff = buff_extension:get_non_stacking_buff("twitch_speed_boost")
				buff_extension:remove_buff(buff.id)
			end

		end
	end
end

mod.refresh_buffs = function()
	if Managers.player:local_player() then
		local local_player_unit = Managers.player:local_player().player_unit
		if local_player_unit and Unit.alive(local_player_unit) then
			local buff_extension = ScriptUnit.has_extension(local_player_unit, "buff_system")
			
			if buff_extension then
				-- mod.error("%q %q", buff, buff_extension:has_buff_type(buff))
				buff_extension:add_buff("markus_huntsman_headshot_no_ammo_count_buff")

				if not buff_extension:has_buff_type("twitch_attack_speed_buff") then
					buff_extension:add_buff("twitch_speed_boost")
				end
			end
		end
	end
end
