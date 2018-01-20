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
  return

/client/proc/whitelist_app_window()
