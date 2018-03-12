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

	//if(!check_rights(R_SERVER))	return

//	establish_db_connection()
//	if(!dbcon.IsConnected())
//		to_chat(usr, "\red Failed to establish database connection")
//		return

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
////////////////////////////////////////////////////
/client/proc/whitelist_show_adminpanel()
  set name = "Open Whitelist Applications"
  set category = "Admin"
  if(!holder && !check_rights(R_ADMIN))
    return

  if(!holder)
    return

  //holder.showUI()

/datum/admins/wlAppHolder/proc/showUI()
  var/list/apps = load_apps()
  if(!apps)
    to_chat(src, "o net forma ne gruzit!")
    return



  var/output = "<div align='center'><table><tr>"
  output += {"<td width='35%' align='center'><h1>Whitelist Applications</h1></td>
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
		<b>Ckey:</b> <input type='text' name='whitelistsearchckey' value='ckeyname'>
		<input type='submit' value='search'>
		</form>"}


/datum/admins/wlAppHolder/proc/load_apps()
  var/list/apps = list()
  var/DBQuery/query = dbcon.NewQuery({"SELECT
           ckey,
           game_exp,
           lastplayed,
           rprel,
           rpexp,
           age,
           contrib,
           bans,
           wlquestion_rp_id,
           wlanswer_rp,
           wlquestion_mech_id,
           wlanswer_mech
        FROM [format_table_name("applications")]
        WHERE resolved='0'"}
        )

  if(!query.Execute())
    var/err = query.ErrorMsg()
    log_game("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    return 0

  while(query.NextRow())
    var/datum/whitelist_app/app = new /datum/whitelist_app
    app.ckey = query.item[1]
    app.game_exp = query.item[2]
    app.lastplayed = query.item[3]
    app.rprel = query.item[4]
    app.rpexp = query.item[5]
    app.age = query.item[6]
    app.contrib = query.item[7]
    app.bans = query.item[8]
    app.wlquestion_rp_id = query.item[9]
    app.wlanswer_rp = query.item[10]
    app.wlquestion_mech_id = query.item[11]
    app.wlanswer_mech = query.item[12]
    apps += app

  return apps
///////////////////////////////////////////////////////////////////////
/datum/whitelist_app
//Typical application form
  var/ckey  //cKey - name of byond accounts
  var/game_exp  //how long playing SS13
  var/lastplayed  //last server played
  var/rprel //relation to RP
  var/rpexp //how long playing RP games
  var/age //real age of player
  var/contrib //can player contribute to codebase
  var/bans  //bans on SS13 servers (including our)
//SS13-related questions about RolePlaying and mechanical knowledge of player
  var/wlquestion_rp  //Received from Database - RP question's text
  var/wlquestion_rp_id //link to database
  var/wlanswer_rp //Player's answer
  var/wlquestion_mech //Received from Database - game mechanic question's text
  var/wlquestion_mech_id
  var/wlanswer_mech

/datum/whitelist_app/New()
  populate_questions()

/datum/whitelist_app/proc/populate_questions()
  var/DBQuery/query = dbcon.NewQuery({"SELECT
        type,
        id
        FROM [format_table_name("wlquestions")]"}
        )

  if(!query.Execute())
    var/err = query.ErrorMsg()
    log_game("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    return
  var/list/rpids = list()
  var/list/mechids = list()
  while(query.NextRow())
    var/qtype = query.item[1]
    if(qtype == "rp")
      rpids += text2num(query.item[2])
    else if(qtype == "mech")
      mechids += text2num(query.item[2])

  wlquestion_rp_id = pick(rpids)
  wlquestion_mech_id = pick(mechids)

  var/DBQuery/rpquery = dbcon.NewQuery({"SELECT
        question
        FROM [format_table_name("wlquestions")]
        WHERE id='[wlquestion_rp_id]'"}
        )

  if(!rpquery.Execute())
    var/err = rpquery.ErrorMsg()
    log_game("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    return

  while(rpquery.NextRow())
    wlquestion_rp = rpquery.item[1]

  var/DBQuery/mechquery = dbcon.NewQuery({"SELECT
        question
        FROM [format_table_name("wlquestions")]
        WHERE id='[wlquestion_mech_id]'"}
        )

  if(!mechquery.Execute())
    var/err = mechquery.ErrorMsg()
    log_game("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR during creating whitelist application. Error : \[[err]\]\n")
    return

  while(mechquery.NextRow())
    wlquestion_rp = mechquery.item[1]

/datum/whitelist_app/proc/send_app(var/client/C)
  if(!C)
    to_chat(src, "Error during sending application. Client is NULL")
    return 0
  if(!game_exp || !lastplayed || !rprel || !age || !contrib || !bans || !wlanswer_rp || !wlanswer_mech)
    to_chat(src, "Whitelist application has empty required fields, aborting...")
    return 0
  var/DBQuery/selectquery = dbcon.NewQuery({"SELECT
      ckey
      FROM [format_table_name("applications")]
      WHERE ckey='[C.ckey]'"}
      )

  if(!selectquery.Execute())
    var/err = selectquery.ErrorMsg()
    log_game("SQL ERROR during sending whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR sending whitelist application. Error : \[[err]\]\n")
    return 0
  while(selectquery.NextRow())
    if(selectquery.item[1] == C.ckey)
      to_chat(src, "You already sent whitelist application! PM admins.")
      return 0

  var/DBQuery/query = dbcon.NewQuery({"INSERT INTO [format_table_name("applications")] (ckey, game_exp,
           lastplayed, rprel, rpexp, age, contrib, bans, wlquestion_rp_id, wlanswer_rp,
           wlquestion_mech_id, wlanswer_mech)

     VALUES
           ('[C.ckey]', '[game_exp]', '[lastplayed]', '[rprel]', '[rpexp]', '[age]', '[contrib]',
           '[bans]', '[wlquestion_rp_id]', '[wlanswer_rp]', '[wlquestion_mech_id]', '[wlanswer_mech]')"}
           )

  if(!query.Execute())
    var/err = selectquery.ErrorMsg()
    log_game("SQL ERROR during sending whitelist application. Error : \[[err]\]\n")
    message_admins("SQL ERROR sending whitelist application. Error : \[[err]\]\n")
    return 0
  return 1
////////////////////////////////////////////////////////////////////////////////
/client/verb/whitelist_app()
	set name = "Apply to Whitelist"
	set desc = "Write an application to server's whitelist"
	set category = "Special Verbs"

	if(!config.prisonlist_enabled)
		to_chat(src, "<span class='warning'>Whitelist disabled in config.</span>")
		return 0

	if(is_in_whitelist())
		to_chat(src, "<span class='warning'>You already listed in whitelist!</span>")
		return 0

	whitelist_app_window()

/client/proc/whitelist_app_window()
	var/output = {"<div>
	Сколько вы уже играете в SS13?<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;firstquestion=\ref[src]'>ВВЕСТИ</A><br>
	Где играли до нас?<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;secondquestion=\ref[src]'>ВВЕСТИ</A><br>
	Как игрок, что вы представляете из себя и как относитесь к отыгрышу роли?<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;thirdquestion=\ref[src]'>ВВЕСТИ</A><br>
	Опыт в других ролевых сферах<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;forthquestion=\ref[src]'>ВВЕСТИ</A><br>
	Ваш возраст<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;fifthquestion=\ref[src]'>ВВЕСТИ</A><br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	Если у вас опыт в кодинге, спрайтинге, администрировании?<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;sixthquestion=\ref[src]'>ВВЕСТИ</A><br>
	Имеете ли вы баны на других серверах? (Этот пункт будет проверен, поэтому в ваших интересах отвечать честно)<br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;seventhquestion=\ref[src]'>ВВЕСТИ</A><br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;eighthquestion=\ref[src]'>ВВЕСТИ</A><br>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	<a href='?_src_=holder;ninethquestion=\ref[src]'>ВВЕСТИ</A><br>
	<a href='?_src_=holder;submit=\ref[src]'>ВВЕСТИ</A></div>
	<textarea name="firstquestion" cols="40" rows="3"></textarea><br>
	"}
	var/datum/browser/popup = new(usr, "secrets", "<div align='center'>Whitelist Panel</div>", 900, 500)
	popup.set_content(output)
	popup.open(0)
