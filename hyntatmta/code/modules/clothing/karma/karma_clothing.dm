//Here you can see the karma outfits, which you can buy from karma shop
//DIO's outfit
/obj/item/clothing/head/atmta/dio
	name = "DIO's heart headband"
	desc = "Why is there a heart on this headband? The World may never know."
	icon_state = "DIO"
	item_state = "DIO"

/obj/item/clothing/under/atmta/dio
	name = "DIO's backless vest"
	desc = "Walk into the room wearing this, everyone stops."
	icon_state = "DIO"
	item_state = "DIO"
	item_color = "DIO"

/obj/item/clothing/suit/atmta/dio
	name = "DIO's yellow jacket"
	desc = "So fashionable it's menacing."
	icon_state = "DIO"
	item_state = "DIO"

/obj/item/clothing/gloves/atmta/dio
	name = "DIO's metal wristbands"
	desc = "These wristbands look fabulous, it's useless useless useless to deny."
	icon_state = "DIO"
	item_state = "DIO"
	item_color="DIO"

/obj/item/clothing/shoes/atmta/dio
	name = "DIO's ring shoes"
	desc = "These help you stand."
	icon_state = "DIO"
	item_color = "DIO"
	item_state = "DIO"

//Phantom blood Dio
/obj/item/clothing/suit/atmta/phantomblood
	name = "Dio Brando's ancient outfit"
	desc = "From the good ol'times when mask can get you STONED."
	icon_state = "vclothes"
	item_state = "vclothes"
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

//Adeptus Mechanicus robes
/obj/item/clothing/suit/atmta/mechanicus
	name = "Adeptus Mechanicus robes"
	desc = "Sweet ol'grim dark future."
	icon_state = "adeptus"
	item_state = "adeptus"
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

//MGS suit
/obj/item/clothing/suit/atmta/oldsnake
	name = "Old Man's sneaking suit"
	desc = "Cigs and octocamos not included."
	icon_state = "sneakmans"
	item_state = "sneakmans"
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

//Fullmetal Alch suit
/obj/item/clothing/suit/atmta/fullmetal
	name = "Alchemist's suit"
	desc = "Full-metal jacket (not really)"
	icon_state = "alchrobe"
	item_state = "alchrobe"
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT


//HEV
/obj/item/clothing/suit/atmta/space/hev
	name = "HEV suit"
	desc = "It will save you from the products of half-life"
	icon_state = "hev"
	item_state = "hev"
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT


//TTGL
//Simon's coat
/obj/item/clothing/suit/atmta/simoncoat
	name = "NT's Honorable long coat"
	desc = "For those men who pierced the sky out."
	icon_state = "simon_coat"
	item_state = "simon_coat"
	ignore_suitadjust = 0
	suit_adjusted = 0


//Kamina's cape
/obj/item/bedsheet/kaminacape
	name = "Sky-piercer cape"
	desc = "The symbol of man's will."
	icon = 'hyntatmta/icons/obj/items.dmi'
	icon_override = 'hyntatmta/icons/mob/back.dmi'
	icon_state = "kaminacape"
	item_state = "kaminacape"
	actions_types = list(/datum/action/item_action/sprial_power)
	var/cooldown = 0

/obj/item/bedsheet/kaminacape/ui_action_click(mob/user, actiontype)
	if(actiontype == /datum/action/item_action/sprial_power)
		rowrow(user)

/obj/item/bedsheet/kaminacape/proc/rowrow(mob/user)
	if(cooldown > world.time)
		var/remaining = cooldown - world.time
		remaining = remaining*0.1
		to_chat(user, "<span class='warning'>Ability on cooldown - [remaining] seconds remaining.</span>")
		return
	else
		user.overlays += image("icon"='hyntatmta/icons/mob/aura.dmi', "icon_state"="spiral")
		user.visible_message("<span class='green'><b>[user]</b> glows with very STRONG and MANLY aura!</span>", "You awaken your inner power!")
		spawn(200)
		user.overlays -= image("icon"='hyntatmta/icons/mob/aura.dmi', "icon_state"="spiral")
		cooldown = world.time + 3000

//Sergeant Dornan's helmet
/obj/item/clothing/head/atmta/dornan
	name = "Sergeant's helmet"
	desc = "This helmet's appearance will make you cry."
	icon_state = "dornan"
	item_state = "dornan"
	actions_types = list(/datum/action/item_action/selectphrase, /datum/action/item_action/idiot)
	flags = HEADCOVERSEYES | HEADBANGPROTECT | BLOCKHAIR | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list(melee = 15, bullet = 40, laser = 10, energy = 10, bomb = 40, bio = 0, rad = 0)
	var/phrase = 1 //AY ay.

/obj/item/clothing/head/atmta/dornan/ui_action_click(mob/user, actiontype)
	if(actiontype == /datum/action/item_action/idiot)
		idiot()
	else if(actiontype == /datum/action/item_action/selectphrase)
		switch(phrase)
			if(1)
				to_chat(user, "<span class='notice'>You set the phrase to: �� ����� ��������� ������� ����������!</span>")
				phrase = 2
			if(2)
				to_chat(user, "<span class='notice'>You set the phrase to: ����� ������� - ������ �������!</span>")
				phrase = 3
			if(3)
				to_chat(user, "<span class='notice'>You set the phrase to: ���� �������?</span>")
				phrase = 4
			if(4)
				to_chat(user, "<span class='notice'>You set the phrase to: �������, � ����� ������?</span>")
				phrase = 5
			if(5)
				to_chat(user, "<span class='notice'>You set the phrase to: �� ��������� ������!</span>")
				phrase = 6
			if(6)
				to_chat(user, "<span class='notice'>You set the phrase to: ��������� ����� �������!</span>")
				phrase = 7
			if(7)
				to_chat(user, "<span class='notice'>You set the phrase to: ������� 510 ���!</span>")
				phrase = 8
			if(8)
				to_chat(user, "<span class='notice'>You set the phrase to: ����� �������?</span>")
				phrase = 9
			if(9)
				to_chat(user, "<span class='notice'>You set the phrase to: ����� � ����!</span>")
				phrase = 10
			if(10)
				to_chat(user, "<span class='notice'>You set the phrase to: �� �� �����.</span>")
				phrase = 11
			if(11)
				to_chat(user, "<span class='notice'>You set the phrase to: ���������?!</span>")
				phrase = 12
			if(12)
				to_chat(user, "<span class='notice'>You set the phrase to: �� ���������!</span>")
				phrase = 13
			if(13)
				to_chat(user, "<span class='notice'>You set the phrase to: � ��� �� ���!</span>")
				phrase = 14
			if(14)
				to_chat(user, "<span class='notice'>You set the phrase to: ��� �����?</span>")
				phrase = 15
			if(15)
				to_chat(user, "<span class='notice'>You set the phrase to: �� �� �����.</span>")
				phrase = 16
			if(16)
				to_chat(user, "<span class='notice'>You set the phrase to: ������.</span>")
				phrase = 17
			if(17)
				to_chat(user, "<span class='notice'>You set the phrase to: �����!</span>")
				phrase = 1


/obj/item/clothing/head/atmta/dornan/verb/idiot()
	set category = "Object"
	set name = "I-DI-OT!!!!"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	var/phrase_text = null
	var/phrase_sound = null

	if(cooldown < world.time - 50)
		switch(phrase)	//VI DOPUSTILI CKOPIROVANIE KODA!
			if(1)				// VI BUDETE ADMINIT DO TEH POR POEKA VAM NE ISPOLNITSA 510 LET!
				phrase_text = sanitize_local("�����!!!")
				phrase_sound = pick("idiot0", "idiot1")
			if(2)
				phrase_text = sanitize_local("�� ����� ��������� ������� ����������!!")
				phrase_sound = "idiot2"
			if(3)
				phrase_text = sanitize_local("����� ������� - ������ �������! ����� ������� - ������ �������! ����� ������� �� ������ - ������ ��� ����������!!")
				phrase_sound = "idiot3"
			if(4)
				phrase_text = sanitize_local("� ���� �������?!")
				phrase_sound = "idiot4"
			if(5)
				phrase_text = sanitize_local("��� ���? � �� �������, � ����� ������, ������?!")
				phrase_sound = "idiot5"
			if(6)
				phrase_text = sanitize_local("�� ��������� ������ �������������� ��������������!")
				phrase_sound = "idiot6"
			if(7)
				phrase_text = sanitize_local("��� ��������� ����� ������� �� ������ ���������!!")
				phrase_sound = "idiot7"
			if(8)
				phrase_text = sanitize_local("� �� ������ ������� ���� ��� �� ���������� ������� ������ ���!!!")
				phrase_sound = "idiot8"
			if(9)
				phrase_text = sanitize_local("�������� ����� �������, ������?!")
				phrase_sound = "idiot9"
			if(10)
				phrase_text = sanitize_local("� �� ����� � ���� ����!")
				phrase_sound = "idiot10"
			if(11)
				phrase_text = sanitize_local("�� ����� �� �� �����, ������!")
				phrase_sound = "idiot11"
			if(12)
				phrase_text = sanitize_local("�� ���� ��-��-��-���?!")
				phrase_sound = "idiot12"
			if(13)
				phrase_text = sanitize_local("�� ��� �� ���������, �������?!")
				phrase_sound = "idiot13"
			if(14)
				phrase_text = sanitize_local("� ��� �� ���!")
				phrase_sound = "idiot14"
			if(15)
				phrase_text = sanitize_local("��� �����? ��� ���� �����, ������?")
				phrase_sound = "idiot15"
			if(16)
				phrase_text = sanitize_local("��� ��� ����� ���� �� �� �����, � ��� ����� ����� �������� ���� � ����� ����������� �����!")
				phrase_sound = "idiot16"
			if(17)
				phrase_text = sanitize_local("�� ������ ��� ���� ���! ������ � ���� ����� ���������!")
				phrase_sound = "idiot17"

		usr.visible_message("[usr] screams ferociously: <font color='red' size='4'><b>[phrase_text]</b></font>")
		playsound(src.loc, "sound/voice/dornan/[phrase_sound].ogg", 80, 0, 4)
		cooldown = world.time

// SLASTENA
/obj/item/clothing/under/atmta/slastena
	name = "Slastena's dress"
	desc = "Pink and cyan. Cute and formal."
	icon_state = "slastena"
	item_state = "slastena"
	item_color = "slastena"

/obj/item/clothing/shoes/atmta/slastena
	name = "Slastena's shoes"
	desc = "Well... That's pink ballet shoes."
	icon_state = "slastena"
	item_state = "slastena"

/obj/item/clothing/head/atmta/slastena
	name = "Slastena's hair"
	desc = "Made of genuine cotton candy"
	icon_state = "slastena"
	item_state = "slastena"
	flags = BLOCKHAIR

// JUST MONIKA

/obj/item/clothing/under/atmta/clubskirt
	name = "literature club skirt"
	desc = "Welcome to the club, buddy"
	icon_state = "clubskirt"
	item_state = "clubskirt"
	item_color = "clubskirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

// Kung Fury

/obj/item/clothing/under/atmta/kung
	name = "Kung Jeans"
	desc = "Pair of old jeans combined with a red tank-top"
	icon_state = "kung_suit"
	item_state = "kung_suit"
	item_color = "kung_suit"

/obj/item/clothing/suit/atmta/kung
	name = "Kung jacket"
	desc = "Leather jaket with an old security badge attached to it"
	icon_state = "kung_jacket"
	item_state = "kung_jacket"

/obj/item/clothing/shoes/atmta/kung
	name = "Kung shoes"
	desc = "Pair of a high red shoes."
	icon_state = "kung_shoes"
	item_state = "kung_shoes"

/obj/item/clothing/head/atmta/kung
	name = "Kung headband"
	desc = "Stripe of red cloth. You can wear it on your head."
	icon_state = "kung_headband"
	item_state = "kung_headband"

// Research Director, Im CIA

/obj/item/clothing/under/atmta/cia
	name = "casual IAA outfit"
	desc = "Just looking at this makes you feel in charge."
	icon_state = "CIA"
	item_state = "CIA"
	item_color = "CIA"

// Hotline Miami

/obj/item/clothing/head/atmta/richard
	name = "Richard"
	desc = "Do you like hurting people?"
	icon_state = "richard"
	flags = HEADCOVERSEYES|BLOCKHAIR|HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/under/atmta/jacketsuit
	name = "Richard's outfit"
	desc = "Do you know what time it is?"
	icon_state = "jacket"
	item_state = "jacket"
	item_color = "jacket"

/obj/item/clothing/head/atmta/biker
	name = "Biker's Helmet"
	desc = "This helmet should protect you from russians and masked vigilantes."
	armor = list(melee = 25, bullet = 15, laser = 20, energy = 10, bomb = 10, bio = 0, rad = 0)
	icon_state = "biker"
	flags = HEADCOVERSEYES|BLOCKHAIR|HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/under/atmta/biker
	name = "Biker's outfit"
	desc = "Blue jeans with pink jacket"
	icon_state = "biker"
	item_state = "biker"
	item_color = "biker"

/obj/item/clothing/gloves/atmta/biker
	name = "Biker's Gloves"
	desc = "Stylish blue gloves"
	icon_state = "biker"
	item_state = "biker"
	item_color = "biker"

/obj/item/clothing/shoes/atmta/biker
	name = "Biker's shoes"
	desc = "Stylish white shoes"
	icon_state = "biker"
	item_state = "biker"

// Real human being

/obj/item/clothing/suit/atmta/scorpiojacket
	name = "Scorpio Jacket"
	desc = "Stylish white satin jacket with a scorpion embroidered on the back."
	icon_state = "scorpio_jacket"
	item_state = "scorpio_jacket"

// Sundowner

/obj/item/clothing/suit/atmta/sundowner
	name = "armoured greatcoat"
	desc = "An oversized black greatcoat, it makes you feel fucking invincible."
	icon_state = "sundowner_coat_allblack"
	item_state = "sundowner_coat_allblack"
	allowed = list(/obj/item/gun/energy,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/melee/classic_baton/telescopic,/obj/item/kitchen/knife/combat)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	strip_delay = 80
