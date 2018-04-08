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
	<a href='?_src_=holder;firstquestion=\ref[src]'>ВВЕСТИ</A><br>
	Где играли до нас?<br>
	<a href='?_src_=holder;secondquestion=\ref[src]'>ВВЕСТИ</A><br>
	Как игрок, что вы представляете из себя и как относитесь к отыгрышу роли??<br>
	<a href='?_src_=holder;thirdquestion=\ref[src]'>ВВЕСТИ</A><br>
	Опыт в других ролевых сферах<br>
	<a href='?_src_=holder;forthquestion=\ref[src]'>ВВЕСТИ</A><br>
	Ваш возраст<br>
	<a href='?_src_=holder;fifthquestion=\ref[src]'>ВВЕСТИ</A><br>
	Если у вас опыт в кодинге, спрайтинге, администрировании?<br>
	<a href='?_src_=holder;sixthquestion=\ref[src]'>ВВЕСТИ</A><br>
	Имеете ли вы баны на других серверах? (Этот пункт будет проверен, поэтому в ваших интересах отвечать честно)<br>
	<a href='?_src_=holder;seventhquestion=\ref[src]'>ВВЕСТИ</A><br>
	<a href='?_src_=holder;eighthquestion=\ref[src]'>ВВЕСТИ</A><br>
	<a href='?_src_=holder;ninethquestion=\ref[src]'>ВВЕСТИ</A><br>
	<a href='?_src_=holder;submit=\ref[src]'>ВВЕСТИ</A></div>
	"}
	var/datum/browser/popup = new(usr, "secrets", "<div align='center'>Whitelist Panel</div>", 900, 500)
	popup.set_content(output)
	popup.open(0)
