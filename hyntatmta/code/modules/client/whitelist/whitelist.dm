var/list/bwhitelist
/client/proc/bwhitelist_panel_open()
	set name = "Whitelist Panel"
	set desc = "Edit Player Whitelist"
	set category = "Admin"

	if(!holder)
		return

	holder.bwhitelist_panel()

/datum/admins/proc/bwhitelist_panel(var/ckeyname = null)
	if(!usr.client)
		return

	if(!check_rights(R_SERVER))	return

	establish_db_connection()
	if(!dbcon.IsConnected())
		to_chat(usr, "\red Failed to establish database connection")
		return

	var/output = "<div align='center'><table><tr>"

	ckeyname = ckey(ckeyname) //Just in case

	output += {"<td width='35%' align='center'><h1>Whitelist</h1></td>
		<td width='65%' align='center' bgcolor='#f9f9f9'>
		<form method='GET' action='?src=[UID()]'>
		<input type='hidden' name='src' value='[UID()]'>
		<table width='100%'><tr>
		<td><b>Ckey:</b> <input type='text' name='ckeyname'></td>
		<td><input type='submit' name='addtowhitelist' value='Add to Whitelist'></td>
		</form>
		</tr>
		</td>
		</table>
		<form method='GET' action='?src=[UID()]'><b>Search</b>
		<input type='hidden' name='src' value='[UID()]'>
		<b>Ckey:</b> <input type='text' name='whitelistsearchckey' value='[ckeyname]'>
		<input type='submit' value='search'>
		</form>"}

	var/DBQuery/select_query = dbcon.NewQuery("SELECT ckey,lastseen FROM [format_table_name("player")] WHERE whitelist = '1' ORDER BY lastseen DESC")
	select_query.Execute()

	output += {"<table width='90%' bgcolor='#e3e3e3' cellpadding='5' cellspacing='0' align='center'>
			<tr>
			<th width='30%'><b>CKEY</b></th>
			<th width='40%'><b>LAST SEEN</b></th>
			<th width='30%'><b>OPTIONS</b></th>
			</tr>"}

	while(select_query.NextRow())
		var/ckey = select_query.item[1]
		var/lastseen = select_query.item[2]

		output += {"<tr bgcolor='lightgrey'>
		<td align='center'><b>[ckey]</b></td>
		<td align='center'><b>[lastseen]</b></td>
		<td align='center'>["<b><a href=\"byond://?src=[UID()];remove=[ckey];\">Remove</a></b>"]"}
		for(var/client/C in clients)
			if(ckey(C.ckey) == ckey(ckey))
				output += "["<a href='?_src_=holder;adminplayeropts=\ref[C.mob]'>PP</A>"]"
		output += "</td></tr>"

	/*if(ckeyname)
		output = "<div align='center'><table width='90%'><tr>"
		output += {"<td width='35%' align='center'><h1>Whitelist</h1></td>
		<td width='65%' align='center' bgcolor='#f9f9f9'>
		<form method='GET' action='?src=[UID()]'>
		<input type='hidden' name='src' value='[UID()]'>
		<table width='100%'><tr>
		<td><b>Ckey:</b> <input type='text' name='ckeyname'></td>
		<td><input type='submit' name='addtowhitelist' value='Add to Whitelist'></td>
		</form>
		</tr>
		</td>
		</table>
		<form method='GET' action='?src=[UID()]'><b>Search</b>
		<input type='hidden' name='src' value='[UID()]'>
		<b>Ckey:</b> <input type='text' name='whitelistsearchckey' value='[ckeyname]'>
		<input type='submit' value='search'>
		</form>"}
		output += {"<table width='90%' bgcolor='#e3e3e3' cellpadding='5' cellspacing='0' align='center'>
				<tr>
				<th width='60%'><b>CKEY</b></th>
				<th width='30%'><b>LAST SEEN</b></th>
				<th width='40%'><b>OPTIONS</b></th>
				</tr>"}



		select_query = dbcon.NewQuery("SELECT ckey FROM [format_table_name("player")] WHERE ckey = '[ckeyname]' ORDER BY ckey ASC")
		select_query.Execute()

		while(select_query.NextRow())
			var/ckey = select_query.item[1]

			output += {"<tr bgcolor='lightgrey'>
				<td align='center'><b>[ckey]</b></td>
				<td align='center'>["<b><a href=\"byond://?src=[UID()];remove=[ckeyname];\">Remove</a></b>"]</td>
				</tr>"}*/

	output += "</table></div>"
	var/datum/browser/popup = new(usr, "secrets", "<div align='center'>Whitelist Panel</div>", 900, 500)
	popup.set_content(output)
	popup.open(0)

/proc/check_prisonlist(var/client/C)
	if(!C)
		return 0
	if(!config.prisonlist_enabled)
		log_admin("Whitelist disabled in config.")
		return 1
	if(!C.is_in_whitelist())
		return 0
	return 1

/*/proc/load_bwhitelist()
	log_admin("Loading whitelist")
	bwhitelist = list()
	if(!dbcon.IsConnected())
		log_admin("Failed to load bwhitelist. Error: [dbcon.ErrorMsg()]")
		return
	var/DBQuery/query = dbcon.NewQuery("SELECT ckey FROM [format_table_name("bwhitelist")] ORDER BY ckey ASC")
	query.Execute()
	while(query.NextRow())
		bwhitelist += "[query.item[1]]"
	if(bwhitelist==list(  ))
		log_admin("Failed to load bwhitelist or its empty")
		return
	dbcon.Disconnect() */

/proc/bwhitelist_save(var/ckeyname)
	//log_debug("ckeyname: [ckeyname]")
	var/sql = "UPDATE [format_table_name("player")] SET whitelist = '1' WHERE ckey='[ckey(ckeyname)]'"
	var/DBQuery/query_insert = dbcon.NewQuery(sql)
	if(!query_insert.Execute())
		var/err = query_insert.ErrorMsg()
		log_game("SQL ERROR during loading player preferences. Error : \[[err]\]\n")
		message_admins("SQL ERROR during loading player preferences. Error : \[[err]\]\n")
		return 0
	to_chat(usr, "\blue Ckey saved to database.")
	message_admins("[key_name_admin(usr)] has added [ckeyname] to the whitelist.",1)
	for(var/client/C in clients)
		//log_debug("Clients C.ckey: [C.ckey]")
		//log_debug("Clients ckey(C.ckey): [ckey(C.ckey)]")
		if(ckey(C.ckey) == ckey(ckeyname))
			C.prefs.whitelist = 1
			//log_debug("Single Client C.ckey: [ckey(C.ckey)]. If success")
			//log_debug("ckey(ckeyname): [ckey(ckeyname)]")
			return 1

/proc/bwhitelist_remove(var/ckeyname)
	var/sql = "UPDATE [format_table_name("player")] SET whitelist = '0' WHERE ckey='[ckey(ckeyname)]'"
	var/DBQuery/query_insert = dbcon.NewQuery(sql)
	if(!query_insert.Execute())
		var/err = query_insert.ErrorMsg()
		log_game("SQL ERROR during loading player preferences. Error : \[[err]\]\n")
		message_admins("SQL ERROR during loading player preferences. Error : \[[err]\]\n")
		return 0
	to_chat(usr, "\blue Ckey removed from database.")
	message_admins("[key_name_admin(usr)] has removed [ckeyname] from the whitelist.",1)
	for(var/client/C in clients)
		if(ckey(C.ckey) == ckey(ckeyname))
			C.prefs.whitelist = 0
			return 1
