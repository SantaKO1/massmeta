//ORIGINAL FILE: code/_onclick/hud/new_player.dm
/atom/movable/screen/lobby/button
	var/requires_discord = TRUE

/atom/movable/screen/lobby/button/Click(location, control, params)
	var/force_verification = CONFIG_GET(number/force_verification)
	var/discord = SSdiscord.lookup_id(usr.ckey)
	if (force_verification && !discord && requires_discord)
		if(tgui_alert(usr, "Для игры на сервере МассМета нужен привязанный аккаунт дискорда(OOC → Verify Discord). Желаете ли Вы открыть ссылку в браузере?",, list("Да","Нет"))!="Да")
			return
		DIRECT_OUTPUT(usr, link("https://discord.gg/WRJ8bns7X7")) //прямая ссылка в канал верификации
	else
		if(owner != REF(usr))
			return

		if(!usr.client || usr.client.interviewee)
			return

		. = ..()

		if(!enabled)
			return
		flick("[base_icon_state]_pressed", src)
		update_appearance(UPDATE_ICON)
		return TRUE

/atom/movable/screen/lobby/button/bottom/settings
	requires_discord = FALSE

/atom/movable/screen/lobby/button/bottom/changelog_button
	requires_discord = FALSE

/atom/movable/screen/lobby/button/collapse
	requires_discord = FALSE
