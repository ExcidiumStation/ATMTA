/obj/item/storage/belt/atmta
	icon = 'hyntatmta/icons/obj/clothing/belts.dmi'
	icon_override = 'hyntatmta/icons/mob/belt.dmi'

/obj/item/storage/belt/atmta/doom
	desc = "You can now hold your demons inside. Or memes. The small painting on it reads 'WJ Armor'."
	name = "Praetor Belt"
	icon_state = "doombelt"
	item_state = "doombelt"
	w_class = 10 // permit holding other storage items
	storage_slots = 20
	max_w_class = 10
	max_combined_w_class = 280
	can_hold = list()
	flags = NODROP

	New()
		..()
		new /obj/item/storage/box(src)
		new /obj/item/grenade/plastic/c4(src)
		new /obj/item/ammo_box/magazine/mm556x45(src)
		new /obj/item/ammo_box/magazine/mm556x45(src)
		new /obj/item/ammo_box/shotgun/buck(src)
		new /obj/item/ammo_box/shotgun/buck(src)
		new /obj/item/pinpointer(src)
		new /obj/item/disk/nuclear(src)
		new /obj/item/reagent_containers/hypospray/combat/nanites(src)
		new /obj/item/dnainjector/hulkmut(src)
