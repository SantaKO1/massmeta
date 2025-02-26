/datum/modpack
	/// A string unique ID for the modpack. Used for self-cheсks, must be same as modpack name in code. /datum/modpack/ru_crayons -> "id = ru_crayons"
	var/id
	/// A string name for the modpack. Used for looking up other modpacks in init.
	var/name
	/// A string desc for the modpack. Can be used for modpack verb list as description.
	var/desc
	/// A string with authors of this modpack.
	var/author
	/// A list of your modpack's dependencies. If you use obj from another modpack - put it here.
	var/list/mod_depends = list()


// Modpacks initialization steps
/datum/modpack/proc/pre_initialize() // Basic modpack fuctions
	if(!name)
		return "Modpack name is unset."

/datum/modpack/proc/initialize() // Mods dependencies-checks
	if(!mod_depends)
		return
	var/passed = 0
	for(var/depend_id in mod_depends)
		passed = 0
		if(depend_id == id)
			return "Mod depends on itself, ok and?"
		for(var/datum/modpack/package as anything in SSmodpacks.loaded_modpacks)
			if(package.id == depend_id)
				if(passed >= 1)
					return "Multiple include of one module in [id] mod dependencies."
				passed++
		if(passed == 0)
			return "Module [id] depends on [depend_id], please include it in your game."

// Modpacks TGUI
/datum/modpack/ui_state()
	return GLOB.always_state

/datum/modpack/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "Modpacks")
		ui.open()

/datum/modpack/ui_data(mob/user)
	var/list/data = list()
	var/list/all_modpacks = list()
	for(var/datum/modpack/package as anything in SSmodpacks.loaded_modpacks)
		var/list/this_mod = list()
		this_mod["id"] = package.id
		this_mod["name"] = package.name
		this_mod["desc"] = package.desc
		this_mod["author"] = package.author
		all_modpacks += list(this_mod)
	data["modpacks"] = all_modpacks

	return data
