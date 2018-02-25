/client/proc/whitelist_show_adminpanel
  set name = "Open Whitelist Applications"
  set category = "Admin"
  if(!holder && !check_rights(R_ADMIN))
    return
  globwlAppHolder.showUI()

/datum/admins/wlAppHolder
  var/list/apps

/datum/admins/wlAppHolder/proc/showUI()
  if(!load_apps())
    to_chat(src, "o net forma ne gruzit!")
    return

  

/datum/admins/wlAppHolder/proc/load_apps()
  apps = list()
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

  return 1
