/obj/item/storage/box/survival/prisoner
	New()
		..()
		contents = list()
		sleep(1)
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/condiment/soymilk( src )
		new /obj/item/reagent_containers/food/snacks/chocolatebar( src )
		new /obj/item/clothing/mask/cigarette( src )
		new /obj/item/match( src )
		return