/**********************************
*******Interactions code by HONKERTRON feat TestUnit********
**Contains a lot ammount of ERP and MEHANOYEBLYA**
***********************************/

/mob/living/carbon/human/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M == src || src == usr || M != usr)		return
	if(usr.restrained())		return

	var/mob/living/carbon/human/H = usr
	H.partner = src
	make_interaction(machine)

/mob/proc/make_interaction()
	return

//Distant interactions
/*/mob/living/carbon/human/verb/interact(mob/M as mob)
	set name = "Interact"
	set category = "IC"

	if (istype(M, /mob/living/carbon/human) && usr != M)
		partner = M
		make_interaction(machine)*/

/datum/species/human
	genitals = 0
	anus = 0

/datum/species/plasmaman
	anus = 0

/datum/species/kidan
	anus = 0

/datum/species/wryn
	anus = 0

/datum/species/unathi
	genitals = 0
	anus = 0

/datum/species/tajaran
	genitals = 0
	anus = 0

/datum/species/vulpkanin
	genitals = 0
	anus = 0

/datum/species/human/skrell
	genitals = 0

/datum/species/monkey
	genitals = 0
	anus = 0

/datum/species/monkey/skrell
	genitals = 0

/datum/species/human/machine
	genitals = 0
	anus = 0 //kiss my metal ass

/datum/species/human/diona
	genitals = 0
	anus = 0

/mob/living/carbon/human/proc/is_nude()
	return (!wear_suit && !w_uniform && underwear == "Nude") ? 1 : 0

/mob/living/carbon/human/make_interaction()
	set_machine(src)

	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/P = H.partner
	var/obj/item/organ/external/temp = H.bodyparts_by_name["r_hand"]
	var/hashands = (temp && temp.is_usable())
	if (!hashands)
		temp = H.bodyparts_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	temp = P.bodyparts_by_name["r_hand"]
	var/hashands_p = (temp && temp.is_usable())
	if (!hashands_p)
		temp = P.bodyparts_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	var/mouthfree = !((H.head && (H.head.flags & HEADCOVERSMOUTH)) || (H.wear_mask && (H.wear_mask.flags & MASKCOVERSMOUTH)))
	var/mouthfree_p = !( (P.head && (P.head.flags & HEADCOVERSMOUTH)) || (P.wear_mask && (P.wear_mask.flags & MASKCOVERSMOUTH)))
	var/haspenis = ((H.gender == MALE && H.potenzia > -1 && H.species.genitals))
	var/haspenis_p = ((P.gender == MALE && P.potenzia > -1  && P.species.genitals))
	var/hasvagina = (H.gender == FEMALE && H.species.genitals && H.species.name != "Unathi" && H.species.name != "Stok")
	var/hasvagina_p = (P.gender == FEMALE && P.species.genitals && P.species.name != "Unathi" && P.species.name != "Stok")
	var/hasanus_p = P.species.anus
	var/isnude = H.is_nude()
	var/isnude_p = P.is_nude()

	H.lastfucked = null
	H.lfhole = ""

	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"

	dat +=  {"• <A href='?src=[UID()];interaction=bow'>Îòâåñèòü ïîêëîí.</A><BR>"}
	//if (Adjacent(P))
	//	dat +=  {"• <A href='?src=\ref[src];interaction=handshake'>Ïîïðèâåòñòâîâàòü.</A><BR>"}
	//else
	//	dat +=  {"• <A href='?src=\ref[src];interaction=wave'>Ïîïðèâåòñòâîâàòü.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>Ðóêè:</B></font><BR>"}
		if (Adjacent(P))
			dat +=  {"• <A href='?src=[UID()];interaction=handshake'>Ïîæàòü ðóêó.</A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=hug'>Îáíèìàøêè!</A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=cheer'>Ïîõëîïàòü ïî ïëå÷ó</A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=five'>Äàòü ï[ya]òü.</A><BR>"}
			if (hashands_p)
				dat +=  {"• <A href='?src=[UID()];interaction=give'>Ïåðåäàòü ïðåäìåò.</A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=slap'><font color=red>Äàòü ïîùå÷èíó!</font></A><BR>"}
			if (isnude_p)
				if (hasanus_p)
					dat += {"• <A href='?src=[UID()];interaction=assslap'>Øëåïíóòü ïî çàäíèöå</A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=[UID()];interaction=fingering'>Ïðîñóíóòü ïàëü÷èê...</A><BR>"}
			if (P.species.name == "Tajaran")
				dat +=  {"• <A href='?src=[UID()];interaction=pull'><font color=red>Ä¸ðíóòü çà õâîñò!</font></A><BR>"}
				if(P.can_inject(H, 1))
					dat +=  {"• <A href='?src=[UID()];interaction=pet'>Ïîãëàäèòü.</A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=knock'><font color=red>Äàòü ïîäçàòûëüíèê.</font></A><BR>"}
		dat +=  {"• <A href='?src=[UID()];interaction=fuckyou'><font color=red>Ïîêàçàòü ñðåäíèé ïàëåö.</font></A><BR>"}
		dat +=  {"• <A href='?src=[UID()];interaction=threaten'><font color=red>Ïîãðîçèòü êóëàêîì.</font></A><BR>"}

	if (mouthfree)
		dat += {"<font size=3><B>Ëèöî:</B></font><BR>"}
		dat += {"• <A href='?src=[UID()];interaction=kiss'>Ïîöåëîâàòü.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				if (H.species.name == "Tajaran")
					dat += {"• <A href='?src=[UID()];interaction=lick'>Ëèçíóòü â ùåêó.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"• <A href='?src=[UID()];interaction=blowjob'><font color=purple>Ñäåëàòü ìèíåò.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=[UID()];interaction=vaglick'><font color=purple>Âûëèçàòü.</font></A><BR>"}
				if (hasanus_p)
					dat += {"• <A href='?src=[UID()];interaction=asslick'><font color=purple>Îòïîëèðîâàòü ÷åðíûé õîä?!</font></A><BR>"}
			dat +=  {"• <A href='?src=[UID()];interaction=spit'><font color=red>Ïëþíóòü.</font></A><BR>"}
		dat +=  {"• <A href='?src=[UID()];interaction=tongue'><font color=red>Ïîêàçàòü [ya]çûê.</font></A><BR>"}

	if (isnude && usr.loc == H.partner.loc)
		if (haspenis && hashands)
			dat += {"<font size=3><B>×ëåí:</B></font><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"• <A href='?src=[UID()];interaction=vaginal'><font color=purple>Òðàõíóòü âàãèíàëüíî.</font></A><BR>"}
				if (hasanus_p)
					dat += {"• <A href='?src=[UID()];interaction=anal'><font color=purple>Òðàõíóòü àíàëüíî.</font></A><BR>"}
				if (mouthfree_p)
					dat += {"• <A href='?src=[UID()];interaction=oral'><font color=purple>Òðàõíóòü îðàëüíî.</font></A><BR>"}
	if (isnude && usr.loc == H.partner.loc && hashands)
		if (hasvagina && haspenis_p)
			dat += {"<font size=3><B>Ëîíî:</B></font><BR>"}
			dat += {"• <A href='?src=[UID()];interaction=mount'><font color=purple>Îñåäëàòü!</font></A><BR><HR>"}

	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()

//INTERACTIONS
/mob/living/carbon/human
	var/mob/living/carbon/human/partner
	var/mob/living/carbon/human/lastfucked
	var/lfhole
	var/potenzia = 10
	var/resistenza = 200
	var/lust = 0
	var/erpcooldown = 0
	var/multiorgasms = 0
	var/lastmoan

mob/living/carbon/human/proc/cum(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole = "floor")
	var/message = "êîí÷àåò íà ïîë!"
	var/ya = "&#1103;"
	var/turf/T

	if (H.gender == MALE)
		var/datum/reagent/blood/source = H.get_blood_id()
		if (P)
			T = get_turf(P)
		else
			T = get_turf(H)
		if (H.multiorgasms < H.potenzia)
			var/obj/effect/decal/cleanable/cum/C = new(T)
			// Update cum information.
			C.blood_DNA = list()
			if(source.data["blood_type"])
				C.blood_DNA[source.data["blood_DNA"]] = source.data["blood_type"]
			else
				C.blood_DNA[source.data["blood_DNA"]] = "O+"

		if (H.species.genitals)
			if (hole == "mouth" || H.zone_sel.selecting == "mouth")
				message = pick("êîí÷àåò [P] â ðîò.", "öåëèòñ[ya] â ëèöî [P], ñòðåë[ya]åò òóãîé ñòðó¸é ìàëàôüè, íî ïðîìàõèâàåòñ[ya].", "ðàçáðûçãèâàåò ñåì[ya] íà ëèöî [P].", "êîí÷àåò íà ïîë.")

			else if (hole == "vagina")
				message = pick("êîí÷àåò â [P]", "ðåçêî âûò[ya]ãèâàåò ÷ëåí èç [P], à çàòåì ñïóñêàåò íà ïîë.", "ïðîíèêàåò â [P] ïîñëåäíèé ðàç, çàòåì ñîäðàãàåòñ[ya]. Ñïåðìà ìåäëåííî âûòåêàåò èç ùåëè [P].")

			else if (hole == "anus")
				message = pick("êîí÷àåò [P] â çàä.", "âûäåðãèâàåò ÷ëåí èç [P], à çàòåì îáèëüíî êîí÷àåò íà [P.gender == MALE ? "åãî" : "å¸"] ïîïêó.", "âûò[ya]ãèâàåò ÷ëåí èç çàäíèöû [P] è ñðàçó æå ñïóñêàåò íà ïîë.")

			else if (hole == "floor")
				message = "êîí÷àåò íà ïîë!"

		else
			message = pick("èçâèâàåòñ[ya] â ïðèñòóïå îðãàçìà", "ïðèêðûâàåò ãëàçà è ìåëêî äðîæèò", "ñîäðàãàåòñ[ya], à çàòåì ðåçêî ðàññëàáë[ya]åòñ[ya]", "çàìèðàåò, çàêàòèâ ãëàçà")

		playsound(loc, "honk/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, frequency = get_age_pitch())

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		message = pick("èçâèâàåòñ[ya] â ïðèñòóïå îðãàçìà", "ïðèêðûâàåò ãëàçà è ìåëêî äðîæèò", "ñîäðàãàåòñ[ya], à çàòåì ðåçêî ðàññëàáë[ya]åòñ[ya]", "çàìèðàåò, çàêàòèâ ãëàçà")
		H.visible_message("<B>[H] [message].</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message].</B>")
		playsound(loc, "honk/sound/interactions/final_f[rand(1, 3)].ogg", 90, 1, frequency = get_age_pitch())
		var/delta = pick(20, 30, 40, 50)
		src.lust -= delta

	H.druggy = 60
	H.multiorgasms += 1
	if (H.multiorgasms == 1)
		add_logs(H, P, "came on")
	H.erpcooldown = rand(200, 450)
	if (H.multiorgasms > H.potenzia / 3)
		if (H.staminaloss < P.potenzia * 4)
			H.staminaloss += H.potenzia
		if (H.staminaloss > 100)
			H.druggy = 300
			H.erpcooldown = 600

mob/living/carbon/human/proc/fuck(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole)
	var/ya = "&#1103;"
	var/message = ""

	switch(hole)

		if("vaglick")

			message = pick("âûëèçûâàåò [P].", "îòëèçûâàåò [P].")
			if (prob(35))
				switch(P.species.name)
					if("Human", "Slime People")
						message = pick("âûëèçûâàåò [P].", "ïîëèðóåò ïðîìåæíîñòü [P] [ya]çûêîì.", "îòëèçûâàåò [P].", "ëàñêàåò [P] [ya]çû÷êîì.", "ïîãðóæàåò ñâîé [ya]çûê â [P]", "èãðàåòñ[ya] ñ [P] [ya]çû÷êîì", "ìåäëåííî ïðîâîäèò [ya]çûêîì âäîëü ïðîìåæíîñòè [P]")
					if("Tajaran", "Vulpkanin")
						message = pick("âûëèçûâàåò [P].", "ïîëèðóåò ïðîìåæíîñòü [P] [ya]çûêîì.", "îòëèçûâàåò [P].", "ëàñêàåò [P] [ya]çû÷êîì.", "ïîãðóæàåò ñâîé [ya]çûê â [P]", "èãðàåòñ[ya] ñ [P] [ya]çû÷êîì", "ìåäëåííî ïðîâîäèò [ya]çûêîì âäîëü ïðîìåæíîñòè [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "licked")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)

		if("fingering")

			message = pick("ââîäèò äâà ïàëüöà â âàãèíó [P].", "òðàõàåò [P] ïàëüöàìè.")
			if (prob(35))
				switch(P.species.name)
					if("Human", "Slime People")
						message = pick("ââîäèò äâà ïàëüöà â âàãèíó [P].", "òåðåáèò ãîðîøèíó [P].", "òû÷åò ïàëüöàìè [P].", "ëàñêàåò [P] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ïðîìåæíîñòü [P].", "ïîãðóæàåò ïàëüöû ãëóáîêî â [P], ëàñêà[ya] å¸ èçíóòðè.", "èçó÷àåò ãëóáèíû [P].")
					if("Tajaran", "Vulpkanin")
						message = pick("ââîäèò äâà ïàëüöà â ïóøèñòóþ âàãèíó [P].", "òåðåáèò ãîðîøèíó [P].", "òû÷åò ïàëüöàìè [P].", "ëàñêàåò [P] ïàëü÷èêàìè.", "íåæíî ïîãëàæèâàåò ïðîìåæíîñòü [P].", "ïîãðóæàåò ïàëüöû ãëóáîêî â [P], ëàñêà[ya] å¸ èçíóòðè.", "èçó÷àåò ãëóáèíû [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "fingered")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 8
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 8
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

		if("blowjob")

			switch(H.species.name)
				if("Human", "Skrell", "Grey", "Nucleation", "Plasmaman")
					message = pick("îòñàñûâàåò [P].", "ñîñåò ÷ëåí [P].", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
					if (prob(35))
						message = pick("öåëóåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èçî ðòà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ðóêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ðîò.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ïëþ¸ò íà êîí÷èê ÷ëåíà [P] è ñíîâà áåð¸ò åãî â ðîò.", "ñîñ¸ò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
					if (H.lastfucked != P || H.lfhole != hole)
						message = pick("ì[ya]ãêî îáõâàòûâàåò ÷ëåí [P] ãóáàìè.", "ïðèñòóïàåò ñîñàòü ÷ëåí [P].")
						H.lastfucked = P
						H.lfhole = hole
						add_logs(H, P, "sucked")

				if("Unathi")
					message = pick("îáëèçûâàåò ÷ëåí [P].", "ñòèìóëèðóåò îðãàí [P] [ya]çûêîì.", "òð¸ò ÷ëåí [P] î ñâîé [ya]çûê.", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ïàñòü, ñòàðà[ya]ñü íå çàöåïèòü åãî çóáàìè.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
					if (prob(35))
						message = pick("îáëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç ïàñòè.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ðóêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ïàñòü.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ïëþ¸ò íà êîí÷èê ÷ëåíà [P] è ïðîòàëêèâàåò åãî ñåáå â ãëîòêó.", "îáëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
					if (H.lastfucked != P || H.lfhole != hole)
						message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò îáëèçûâàòü ÷ëåí [P].")
						H.lastfucked = P
						H.lfhole = hole
						add_logs(H, P, "sucked")

				if("Tajaran", "Vulpkanin")
					message = pick("âûëèçûâàåò ÷ëåí [P].", "îáâîäèò ñâîèì øåðøàâûì [ya]çû÷êîì âîêðóã ÷ëåíà [P].", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ïàñòü, ñòàðà[ya]ñü íå çàöåïèòü åãî çóáàìè.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
					if (prob(35))
						message = pick("âûëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç ïàñòè.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî ëàïêîé.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ïàñòü.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ïëþ¸ò íà êîí÷èê ÷ëåíà [P] è ïðîòàëêèâàåò åãî ñåáå â ãëîòêó.", "âûëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
					if (H.lastfucked != P || H.lfhole != hole)
						message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò âûëèçûâàòü ÷ëåí [P].")
						H.lastfucked = P
						H.lfhole = hole
						add_logs(H, P, "sucked")

				if("Vox", "Vox Armalis")
					message = pick("îáëèçûâàåò ÷ëåí [P].", "ñòèìóëèðóåò îðãàí [P] [ya]çûêîì.", "òð¸ò ÷ëåí [P] î ñâîé [ya]çûê.", "ïðîòàëêèâàåò ÷ëåí [P] ñåáå â ãëîòêó, ñòàðà[ya]ñü íå çàöåïèòü åãî êëþâîì.", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
					if (prob(35))
						message = pick("îáëèçûâàåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èç êëþâà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïðèäåðæèâà[ya] åãî êðûëîì.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â êëþâ.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ïëþ¸ò íà êîí÷èê ÷ëåíà [P] è ïðîòàëêèâàåò åãî ñåáå â ãëîòêó.", " îáëèçûâàåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P] [ya]çûêîì.")
					if (H.lastfucked != P || H.lfhole != hole)
						message = pick("êîí÷èêîì [ya]çûêà êàñàåòñ[ya] ÷ëåíà [P].", "ïðèñòóïàåò îáëèçûâàòü ÷ëåí [P].")
						H.lastfucked = P
						H.lfhole = hole
						add_logs(H, P, "sucked")

				if("Slime People")
					message = pick("îòñàñûâàåò [P].", "ñîñåò ÷ëåí [P].", "ñòèìóëèðóåò ÷ëåí [P] [ya]çûêîì.")
					if (prob(35))
						message = pick("ñìà÷íî öåëóåò îðãàí [P], ïðèêðûâ ãëàçà îò óäîâîëüñòâè[ya].", "ïîñòàíûâàåò, ïðèêðûâ ãëàçà, íå âûíèìà[ya] ÷ëåí [P] èçî ðòà.", "ëàñêàåò ÷ëåí [P] [ya]çû÷êîì, ïîêðûâà[ya] åãî â[ya]çêîé ñëèçüþ.", "îáëèçûâàåò ÷ëåí [P] ïî âñåé äëèíå, îñòàâë[ya][ya] ñëåä èç ñëèçè.", "ïîãðóæàåò ÷ëåí [P] âñå ãëóáæå ñåáå â ðîò.", "êîí÷èêîì [ya]çûêà îáëèçûâàåò ãîëîâêó ÷ëåíà [P].", "ñìà÷èâàåò êîí÷èê ÷ëåíà [P] ëèïêîé ñëèçüþ è ñíîâà áåð¸ò åãî â ðîò.", "ñîñåò ëåäåíåö [P].", "äâèãàåò ãîëîâîé âçàä-âïåð¸ä, ñòèìóëèðó[ya] ÷ëåí [P].", "òùàòåëüíî âûëèçûâàåò ÷ëåí [P].", "çàæìóðèâøèñü, ïîëíîñòüþ çàãëàòûâàåò ìàëûøà [P].", "ëàñêàåò ÷ëåí [P], ïîìîãà[ya] ñåáå ðóêàìè.")
					if (H.lastfucked != P || H.lfhole != hole)
						message = pick("ì[ya]ãêî îáõâàòûâàåò ÷ëåí [P] ãóáàìè, îáâîëàêèâà[ya] åãî ñëèçüþ.", "ïðèñòóïàåò ñîñàòü ÷ëåí [P].")
						H.lastfucked = P
						H.lfhole = hole
						add_logs(H, P, "sucked")

				if("Diona")
					return

				if("Kidan")
					return

				if("Wryn")
					return

				if("Machine")
					return

			if (H.lust < 6)
				H.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, H, "mouth")
			playsound(loc, "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
			H.do_fucking_animation(P)
			if (prob(P.potenzia))
				H.oxyloss += 3
				H.visible_message("<B>[H]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[P]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[P]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")

		if("vaginal")

			message = pick("òðàõàåò [P].", "ñíîøàåò [P].", "äîëáèò [P].")
			if (prob(35))
				switch(P.species.name)
					if("Human")
						message = pick("ãðóáî òðàõàåò [P].", "ïðåäà¸òñ[ya] ñòðàñòíîé ëþáâè ñ [P].", "ðåçêèì äâèæåíèåì ïîãðóæàåòñ[ya] âíóòðü [P].", "äâèæåòñ[ya] âíóòðè [P].", "äâèãàåò òàçîì, çàñàæèâà[ya] ÷ëåí â [P].", "ñòîíåò, íàâàëèâà[ya]ñü íà [P].", "ñèëüíî ïðèæèìàåòñ[ya] ïàõîì ê [P].", "íàñàæèâàåò [P] íà ñâîé ÷ëåí.", "÷óâñòâåííî èìååò [P].")
					if("Tajaran", "Vulpkanin")
						message = pick("ãðóáî òðàõàåò [P].", "ïðåäà¸òñ[ya] ñòðàñòíîé ëþáâè ñ [P].", "ðåçêèì äâèæåíèåì ïîãðóæàåòñ[ya] âíóòðü [P].", "äâèæåòñ[ya] âíóòðè [P].", "äâèãàåò òàçîì, çàñàæèâà[ya] ÷ëåí â [P].", "ñòîíåò, íàâàëèâà[ya]ñü íà [P].", "ñèëüíî ïðèæèìàåòñ[ya] ïàõîì ê [P].", "íàñàæèâàåò [P] íà ñâîé ÷ëåí.", "÷óâñòâåííî èìååò [P].")
					if("Slime People")
						message = pick("ãðóáî òðàõàåò [P].", "ïðåäà¸òñ[ya] ñòðàñòíîé ëþáâè ñ [P].", "ðåçêèì äâèæåíèåì ïîãðóæàåòñ[ya] âíóòðü [P].", "äâèæåòñ[ya] âíóòðè [P].", "äâèãàåò òàçîì, çàñàæèâà[ya] ÷ëåí â [P].", "ñòîíåò, íàâàëèâà[ya]ñü íà [P].", "ñèëüíî ïðèæèìàåòñ[ya] ïàõîì ê [P].", "íàñàæèâàåò [P] íà ñâîé ÷ëåí.", "÷óâñòâåííî èìååò [P].")
						playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("âñàæèâàåò ñâîé ÷ëåí ïî ñàìûå [ya]éöà â [P].", "ââîäèò ñâîé îðãàí ëþáâè â ëîíî [P].", "ïîãðóæàåò ñâîé êîðåíü ïîõîòè âíóòðü [P].", "ïðîíèêàåò â [P].")
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "fucked")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.potenzia * 2
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 10
			if (H.lust >= H.resistenza)
				H.cum(H, P, "vagina")

			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia * 0.5
				if (H.potenzia > 20)
					P.staminaloss += H.potenzia * 0.25
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

		if("anal")

			message = pick("äîëáèò [P] â î÷êî.", "àíàëüíî ñíîøàåò [P].", "òðàõàåò [P] â àíóñ.")
			if (prob(35))
				switch(P.species.name)
					if("Human", "Nucleation")
						message = pick("òðàõàåò [P] â çàäíèöó.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöèyìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
					if("Unathi")
						message = pick("òðàõàåò [P] â êëîàêó.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöèyìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
					if("Tajaran", "Vulpkanin")
						message = pick("òðàõàåò [P] ïîä õâîñò.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà.", "äîëáèò [P] ïîä ïóøèñòûé õâîñòèê.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöèyìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
					if("Skrell", "Grey")
						message = pick("òðàõàåò [P] â êëîàêó.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà.", "ìåñèò ãëèíó â øàõòå [P].", "ðàçðûâàåò [P] î÷êî áåøåíûìè ôðèêöèyìè.", "çàïóñêàåò ñâîåãî øàõòåðà â óãîëüíûå øàõòû [P].")
					if("Slime People")
						message = pick("òðàõàåò [P] â çàäíèöó.", "âñàæèâàåò ÷ëåí [P] â àíàëüíîå êîëüöî ïî ñàìûå [ya]éöà, ë[ya]ïà[ya]ñü â â[ya]çêîé ñëèçè.", "ðàcò[ya]ãèâàåò [P] î÷êî áåøåíûìè ôðèêöèyìè.")
						playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick(" áåçæàëîñòíî ïðîðûâàåò àíàëüíîå îòâåðñòèå [P].", "âñàæèâàåò ÷ëåí [P] â î÷êî.")
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "fucked in anus")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.potenzia * 2
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 12
			if (H.lust >= H.resistenza)
				H.cum(H, P, "anus")

			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				if (H.potenzia > 13)
					P.lust += H.potenzia * 0.25
					P.staminaloss += H.potenzia * 0.25
				else
					P.lust += H.potenzia * 0.75
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

		if("oral")

			message = pick(" òðàõàåò [P], çàñàæèâà[ya] ñâîé ÷ëåí [P.gender == FEMALE ? "åé" : "åìó"] â ãëîòêó.", " îðàëüíî ñíîøàåò [P].")
			if (prob(35))
				switch(P.species.name)
					if ("Human", "Skrell", "Grey", "Plasmaman")
						message = pick(" îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", " òðàõàåò [P] â ðîò.", " íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", " äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", " äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü æåðòâó â ðîò.", " áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.")
					if("Unathi")
						message = pick(" îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", " òðàõàåò [P] â çóáàñòóþ ïàñòü.", " íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", " äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", " äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü [P.gender == FEMALE ? "áåäíóþ [ya]ùåðêó" : "áåäíîãî [ya]ùåðà"] â ïàñòü.", " áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.")
					if("Tajaran", "Vulpkanin")
						message = pick(" îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", " òðàõàåò [P] â çóáàñòóþ ïàñòü.", " íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", " äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", " äà¸ò ïîù¸÷èíû [P], ïðîäîëæà[ya] åáàòü [P.gender == FEMALE ? "áåäíóþ êîøå÷êó" : "áåäíîãî êîò¸íêà"] â ïàñòü.", " áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.")
					if("Vox", "Vox Armalis")
						message = pick(" îïèðàåòñ[ya] íà ïëå÷è [P], ïðèäåðæèâà[ya] [P.gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", " òðàõàåò [P] ïð[ya]ìî â êëþâ.", " íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí, ñòàðà[ya]ñü íå ïîðåçàòüñ[ya] î âûñòóïû íà êëþâå.", " äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", " ñæèìàåò ïåðü[ya] íà ãîëîâå [P], ïðîäîëæà[ya] åáàòü áåäíóþ ïòè÷êó â ðîò.", " áåçæàñòíî ïîëüçóåòñ[ya] ãëîòêîé [P].", ", ðû÷à ñêâîçü çóáû, íàò[ya]ãèâàåò ãëîòêó [P] íà ñâîåãî ìàëûøà.")
					if("Slime People")
						message = pick(" îïèðàåòñ[ya] íà æåëåîáðàçíûå ïëå÷è [P], ïðèäåðæèâà[ya] [P.gender==FEMALE ? "å¸" : "åãî"] è çàñàæèâà[ya] ÷ëåí âñ¸ ñèëüíåå è ñèëüíåå [P.gender==FEMALE ? "åé" : "åìó"] â ãëîòêó.", " òðàõàåò [P] â ðîò, çàë[ya]ïûâà[ya] ñâîé ÷ëåí â ëèïêîé ñëèçè.", " íàñàæèâàåò ãîëîâó [P] íà ñâîé ÷ëåí.", " äåðæèò [P] çà ãîëîâó äâóì[ya] ðóêàìè è ñîâåðøàåò äâèæåíè[ya] òàçîì.", " ïðîäîëæàåò åáàòü [P.gender == FEMALE ? "áåäíóþ ñëèçíåäåâêó" : "áåäíîãî ñëèçí[ya]"] â ðîò.", " áåçæàñòíî ïîëüçóåòñ[ya] ðîòèêîì [P].", ", ÷åðåçìåðíî óâëåêøèñü, òûêàåò ÷ëåíîì ìèìî ðòà [P] è äðîæèò îò âíåçàïíûõ îùóùåíèé.", " íåùàäíî íàñèëóåò ãëîòêó [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick(" áåñöåðåìîííî ïðîòàëêèâàåò ñâîé ÷ëåí [P] â ãëîòêó.")
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "fucked in mouth")

			if (prob(5) && H.stat != DEAD)
				H.visible_message("<font color=purple><B>[H][message]</B></font>")
				H.lust += 15
			else
				H.visible_message("<font color=purple>[H][message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H][message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 15
			if (H.lust >= H.resistenza)
				H.cum(H, P, "mouth")

			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
			if (P.species.name == "Slime People")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
			if (prob(H.potenzia))
				P.oxyloss += 3
				H.visible_message("<B>[P]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[H]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[P]</B> [pick("äàâèòñ[ya] èíñòðóìåíòîì <B>[H]</B>", "çàäûõàåòñ[ya]", "êîð÷èòñ[ya] â ðâîòíîì ïîçûâå")].")


		if("mount")

			message = pick("ñêà÷åò íà ÷ëåíå [P]", "ïðûãàåò íà èíñòðóìåíåòå [P]", "íàñàæèâàåòñ[ya] íà [P]")
			if (prob(35))
				message = pick("ñåäëàåò òåëî [P], ñëîâíî íàåçäíèöà", "ñêà÷åò íà ìàëûøå [P]", "ïðûãàåò íà [P], óäàð[ya][ya]ñü î åãî ãëàäêóþ êîæó", "ðàäîñòíî ïîäïðûãèâàåò, äîñòàâë[ya][ya] óäîâîëüñòâèå ñåáå è [P]", "óïåðëàñü òàçîì â [P] è åëîçèò, êàê åãîçà", "äåëàåò êóëüáèòû íà ïîëîâîì îðãàíå [P]", "âïðèïðûæêó íàâàëèâàåòñ[ya] íà [P], âç[ya]â âíóòðü åãî ÷ëåí", "íàáðàñûâàåò ñâî¸ ëîíî íà êðþ÷îê [P], äàâ[ya] íà íåãî ñâîèì òàçîì", "âïóñêàåò âíóòðü ñåá[ya] çâåðüêà [P]")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("îñòîðîæíî íàñàæèâàåòñ[ya] íà ïîëîâîé îðãàí [P]")
				H.lastfucked = P
				H.lfhole = hole
				add_logs(H, P, "fucked")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			if (P.potenzia > 20)
				H.staminaloss += P.potenzia * 0.25
			if (H.lust >= H.resistenza)
				H.cum(H, P)
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "vagina")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Slime People")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

mob/living/carbon/human/proc/moan()
	var/ya = "&#1103;"
	var/mob/living/carbon/human/H = src
	switch(species.name)
		if ("Human", "Skrell", "Slime People", "Grey", "Nucleation", "Plasmaman")
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("ïîñòàíûâàåò", "ñòîíåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "çàêóñûâàåò ãóáó")
				H.visible_message("<B>[H]</B> [message].")
				var/g = H.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "honk/sound/interactions/moan_[g][moan].ogg", 70, 1, frequency = get_age_pitch())
				else if (g == "f")
					playsound(loc, "honk/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, frequency = get_age_pitch())
				lastmoan = moan

				if (istype(H.head, /obj/item/clothing/head/kitty)  || istype(H.head, /obj/item/clothing/head/collectable/kitty))
					playsound(loc, "honk/sound/interactions/purr_f[rand(1, 3)].ogg", 70, 1, 0)

		if("Tajaran")
			if (prob(H.lust / src.resistenza * 70))
				var/message = pick("ìóðëû÷åò", "ìóðëû÷åò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
				H.visible_message("<B>[H]</B> [message].")
				playsound(loc, "honk/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

		if("Vulpkanin")
			if (prob(H.lust / src.resistenza * 70))
				var/message = pick("ïîñêóëèâàåò", "ïîñêóëèâàåò îò óäîâîëüñòâè[ya]", "çàêàòûâàåò ãëàçà", "äîâîëüíî îáëèçûâàåòñ[ya]")
				H.visible_message("<B>[H]</B> [message].")

		if("Unathi")
			if (prob(H.lust / H.resistenza * 70))
				var/message = pick("äîâîëüíî øèïèò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				H.visible_message("<B>[H]</B> [message].")

		if("Kidan", "Wryn")
			if (prob(H.lust / H.resistenza * 70))
				var/message = pick("äîâîëüíî ñòðåêî÷åò", "èçâèâàåòñ[ya] îò óäîâîëüñòâè[ya]")
				H.visible_message("<B>[H]</B> [message].")


mob/living/carbon/human/proc/handle_lust()
	lust -= 4
	if (lust <= 0)
		lust = 0
		lastfucked = null
		lfhole = ""
		multiorgasms = 0
	if (lust == 0)
		erpcooldown -= 1
	if (erpcooldown < 0)
		erpcooldown = 0

/mob/living/carbon/human/proc/do_fucking_animation(mob/living/carbon/human/P)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

/obj/item/weapon/enlarger
	name = "penis enlarger"
	desc = "Very special DNA mixture which helps YOU to enlarge your little captain."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	item_state = "dnainjector"
	hitsound = null
	throwforce = 0
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("stabbed")

/obj/item/weapon/enlarger/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(istype(M, /mob/living/carbon/human) && (M.gender == MALE))
		M.potenzia = 30
		to_chat(user, "<span class='warning'>Your penis extends!</span>")

	else if (istype(M, /mob/living/carbon/human) && M.gender == FEMALE)
		to_chat(user, "<span class='warning'>It didn't affect you since you're female!</span>")

	..()

	qdel(src)

/obj/item/weapon/enlarger/attack_self(mob/user as mob)
	to_chat(user, "<span class='warning'>You break the syringe. Gooey mass is dripping on the floor.</span>")
	qdel(src)

/obj/item/weapon/dildo
	name = "dildo"
	desc = "Hm-m-m, deal thow"
	icon = 'honk/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 10
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("slammed", "bashed", "whipped")
	var/hole = "vagina" //or "anus"
	var/rus_name = "äèëäî"
	var/ya = "&#1103;"
	var/pleasure = 10

/obj/item/weapon/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/hasvagina = (M.gender == FEMALE && M.species.genitals && M.species.name != "Unathi" && M.species.name != "Stok")
	var/hasanus = M.species.anus
	var/message = ""

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "vagina" && hasvagina)
			if (user == M)
				message = pick("óäîâëåòâîð[ya]åò ñåá[ya] ñ ïîìîùüþ [rus_name]", "çàòàëêèâàåò â ñåá[ya] [rus_name]", "ïîãðóæàåò [rus_name] â ñâîå ëîíî")
			else
				message = pick("óäîâëåòâîð[ya]åò [M] ñ ïîìîùüþ [rus_name]", "çàòàëêèâàåò â [M] [rus_name]", "ïîãðóæàåò [rus_name] â ëîíî [M]")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

		else if (hole == "anus" && hasanus)
			if (user == M)
				message = pick("óäîâëåòâîð[ya]åò ñåá[ya] àíàëüíî ñ ïîìîùüþ [rus_name]", "çàòàëêèâàåò [rus_name] ñåáå â àíóñ", "÷èñòèò ñâîé äûìîõîä, èñïîëüçó[ya] [rus_name]")
			else
				message = pick("óäîâëåòâîð[ya]åò [M] àíàëüíî ñ ïîìîùüþ [rus_name]", "çàòàëêèâàåò [rus_name] [M] â àíóñ", "÷èñòèò äûìîõîä [M], èñïîëüçó[ya] [rus_name]")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

		else
			..()
	else
		..()

/obj/item/weapon/dildo/attack_self(mob/user as mob)
	if(hole == "vagina")
		hole = "anus"
	else
		hole = "vagina"
	to_chat(user, "<span class='warning'>Hm-m-m. Maybe we should put it in [hole]?!</span>")
