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
