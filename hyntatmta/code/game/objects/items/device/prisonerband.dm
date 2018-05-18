/obj/item/pda/prisoner
	name = "prisoner's special armband"
	desc = "You don't know why this armband called 'special'..."
	icon = 'hyntatmta/icons/obj/custom_items.dmi'
	icon_state = "armband"
	w_class = 1
	slot_flags = SLOT_BELT | SLOT_PDA
	model_name = "Guardtronic 1000 Personal Tracker"

/obj/item/pda/prisoner/New()
	new /obj/item/pen(src)

/obj/item/pda/prisoner/attack_self(mob/user as mob)
	play_ringtone()
