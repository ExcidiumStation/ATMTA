/obj/item/ertsupplyget
	name = "ERT supply request"
	desc = "With this button you can request more ammo and equpment. WARNING: only one use."
	icon_state = "gangtool-red"
	item_state = "walkietalkie"
	var/used = 1

/obj/item/ertsupplyget/attack_self(mob/living/user)
	var/response = input("Drop-Location","ERT") in list("Arrival","Bridge","R&D","Brig") as text|null
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(3,0, src.loc)
	smoke.start()
	if(response)
		switch(response)
			if("Arrival") new/obj/structure/closet/crate/secure/ertammo(locate(53,140,1))
			if("Brig") new/obj/structure/closet/crate/secure/ertammo(locate(139,179,1))
			if("Bridge") new/obj/structure/closet/crate/secure/ertammo(locate(113,134,1))
			if("R&D") new/obj/structure/closet/crate/secure/ertammo(locate(182,118,1))
		to_chat(user, "We send you supplies in [response].")
		qdel(src)



/obj/structure/closet/crate/secure/ertammo
	desc = "A secure weapons crate."
	name = "weapons crate"
	icon_state = "weaponcrate"
	icon_opened = "weaponcrateopen"
	icon_closed = "weaponcrate"

/obj/structure/closet/crate/secure/ertammo/New()
	..()
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a40mm(src)
