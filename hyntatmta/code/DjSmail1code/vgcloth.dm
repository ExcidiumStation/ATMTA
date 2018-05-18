/obj/item/clothing/suit/atmta/officersuit
	name = "officersuit"
	desc = "officersuit"
	icon_state = "officersuit"
	item_state = "officersuit"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	flags_inv = 0
	ignore_suitadjust = 0
	suit_adjusted = 1
	actions_types = list(/datum/action/item_action/openclose)
	adjust_flavour = "unbutton"
	strip_delay = 80

/obj/item/clothing/suit/atmta/soldiersuit
	name = "soldiersuit"
	desc = "soldiersuit"
	icon_state = "soldiersuit"
	item_state = "soldiersuit"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 10, bomb = 25, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	flags_inv = 0
	ignore_suitadjust = 0
	suit_adjusted = 1
	actions_types = list(/datum/action/item_action/openclose)
	adjust_flavour = "unbutton"
	strip_delay = 80

/obj/item/clothing/suit/atmta/russofurcoat
	name = "russofurcoat"
	desc = "russofurcoat"
	icon_state = "russofurcoat"
	item_state = "russofurcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	strip_delay = 80



/*WORK IN PROGRESS, DONT CHIP ME
/obj/item/clothing/head/helmet/space/hardsuit/sovietrig
	icon = 'hyntatmta/icons/obj/clothing/hats.dmi'
	name = "security hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "rig0-soviet"
	item_state = "rig0-soviet"
	item_color = "sec"
	armor = list(melee = 30, bullet = 15, laser = 30, energy = 10, bomb = 10, bio = 100, rad = 50)

/obj/item/clothing/suit/space/hardsuit/sovietrig
	icon = 'hyntatmta/icons/obj/clothing/suits.dmi'
	icon_state = "rig-soviet"
	name = "security hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	item_state = "rig-soviet"
	armor = list(melee = 30, bullet = 15, laser = 30, energy = 10, bomb = 10, bio = 100, rad = 50)
	allowed = list(/obj/item/gun,/obj/item/flashlight,/obj/item/tank,/obj/item/melee/baton,/obj/item/reagent_containers/spray/pepper,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs)
	*/