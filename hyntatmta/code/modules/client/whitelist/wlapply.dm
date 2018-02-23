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
	var/output = {"<div>
	������� �� ��� ������� � SS13?<br>
	<a href='?_src_=holder;firstquestion=\ref[C]'>������</A><br>
	��� ������ �� ���?<br>
	<a href='?_src_=holder;secondquestion=\ref[C]'>������</A><br>
	��� �����, ��� �� ������������� �� ���� � ��� ���������� � �������� ����??<br>
	<a href='?_src_=holder;thirdquestion=\ref[C]'>������</A><br>
	���� � ������ ������� ������<br>
	<a href='?_src_=holder;forthquestion=\ref[C]'>������</A><br>
	��� �������<br>
	<a href='?_src_=holder;fifthquestion=\ref[C]'>������</A><br>
	���� � ��� ���� � �������, ����������, �����������������?<br>
	<a href='?_src_=holder;sixthquestion=\ref[C]'>������</A><br>
	������ �� �� ���� �� ������ ��������? (���� ����� ����� ��������, ������� � ����� ��������� �������� ������)<br>
	<a href='?_src_=holder;seventhquestion=\ref[C]'>������</A><br>
	[firstquestion]<br>
	<a href='?_src_=holder;eighthquestion=\ref[C]'>������</A><br>
	[secondquestion]<br>
	<a href='?_src_=holder;ninethquestion=\ref[C]'>������</A><br>
	<a href='?_src_=holder;submit=\ref[C]'>������</A></div>
	"}
	var/datum/browser/popup = new(usr, "secrets", "<div align='center'>Whitelist Panel</div>", 900, 500)
	popup.set_content(output)
	popup.open(0)
