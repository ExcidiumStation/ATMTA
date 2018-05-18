/obj/item/gun/projectile/automatic/m256
	name = "m256"
	desc = "A three-round burst 5.56 toploading carbin. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon = 'hyntatmta/icons/obj/escm256.dmi'
	icon_state = "m256"
	item_state = "arg"
	origin_tech = "combat=5;materials=2;syndicate=6"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	var/obj/item/gun/projectile/revolver/grenadelauncher/underbarrel
	burst_size = 3
	fire_delay = 2

/obj/item/gun/projectile/automatic/m256/New()
	..()
	underbarrel = new /obj/item/gun/projectile/revolver/grenadelauncher(src)
	update_icon()

/obj/item/gun/projectile/automatic/m256/afterattack(var/atom/target, var/mob/living/user, flag, params)
	if(select == 2)
		underbarrel.afterattack(target, user, flag, params)
	else
		..()
		return

/obj/item/gun/projectile/automatic/m256/attackby(var/obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/projectile/automatic/m256/update_icon()
	..()
	overlays.Cut()
	switch(select)
		if(0)
			overlays += "[initial(icon_state)]semi"
		if(1)
			overlays += "[initial(icon_state)]burst"
		if(2)
			overlays += "[initial(icon_state)]gren"
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"
	return

/obj/item/gun/projectile/automatic/m256/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			to_chat(user, "<span class='notice'>You switch to [burst_size] round burst.</span>")
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to grenades.</span>")
		if(2)
			select = 0
			burst_size = 1
			fire_delay = 0
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()



/obj/item/storage/backpack/duffel/ert/security
	name = "emergensy response team duffelbag"
	desc = "A duffelbag built with robust fabric!"
	icon_state = "duffel-security"
	item_state = "duffel-security"

/obj/item/storage/backpack/duffel/ert/security/loaded
	desc = "A large duffelbag, packed with ert equpment."

/obj/item/storage/backpack/duffel/ert/security/loaded/New()
	..()
	new /obj/item/gun/projectile/automatic/m256(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a40mm(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/reagent_containers/hypospray/combat/nanitesnerf(src)
	new /obj/item/rig/ert/security(src)

/obj/item/reagent_containers/hypospray/combat/nanitesnerf
	desc = "A modified air-needle autoinjector for use in combat situations. Prefilled with expensive medical nanites for rapid healing."
	volume = 20
	list_reagents = list("nanites" = 20)

/obj/item/storage/backpack/duffel/ert/enginering
	name = "emergensy response team enginer duffelbag"
	desc = "A duffelbag designed to hold tools."
	icon_state = "duffel-eng"
	item_state = "duffel-eng"
	burn_state = FIRE_PROOF

/obj/item/storage/backpack/duffel/ert/enginering/loaded
	desc = "A large duffelbag, packed with ert equpment."

/obj/item/storage/backpack/duffel/ert/enginering/loaded/New()
	..()
	new /obj/item/gun/projectile/automatic/m256(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a40mm(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/reagent_containers/hypospray/combat/nanitesnerf(src)
	new /obj/item/rig/ert/engineer(src)

/obj/item/storage/backpack/duffel/ert/medical
	name = "emergensy response team medic duffelbag"
	desc = "A duffelbag designed to hold medicine."
	icon_state = "duffel-med"
	item_state = "duffel-med"

/obj/item/storage/backpack/duffel/ert/medical/loaded
	desc = "A large duffelbag, packed with ert equpment."

/obj/item/storage/backpack/duffel/ert/medical/loaded/New()
	..()
	new /obj/item/gun/projectile/automatic/m256(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a40mm(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/reagent_containers/hypospray/combat/nanitesnerf(src)
	new /obj/item/rig/ert/medical(src)

/obj/item/storage/backpack/duffel/ert/commander
	name = "emergensy response team duffelbag"
	desc = "A duffelbag built with robust fabric!"
	icon_state = "duffel-captain"
	item_state = "duffel-captain"

/obj/item/storage/backpack/duffel/ert/commander/loaded
	desc = "A large duffelbag, packed with ert equpment."

/obj/item/storage/backpack/duffel/ert/commander/loaded/New()
	..()
	new /obj/item/gun/projectile/automatic/m256(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a40mm(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/reagent_containers/hypospray/combat/nanitesnerf(src)
	new /obj/item/rig/ert(src)


