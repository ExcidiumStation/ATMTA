/obj/item/storage/toolbox/fluff/lunchboxp //shitcode of DjSmail1
	name = "lunchpail"
	desc = "A simple black lunchpail."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lunch_box"
	item_state = "lunch_box"
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 9
	storage_slots = 3

/obj/item/storage/toolbox/fluff/lunchboxp/New()
	..()
	new /obj/item/reagent_containers/food/snacks/pureshka_cutlet(src)
	new /obj/item/reagent_containers/food/snacks/baguette(src)
	new /obj/item/reagent_containers/food/drinks/cans/cola(src)

/obj/machinery/vending/pizza
	name = "Pizzamatt"
	desc = "A vending machine with pizza and lunchbox"
	icon = 'hyntatmta/icons/obj/vending.dmi'
	product_slogans = "Ah, can you feel that divine smell?;Si, my amico! Freshly baked!;Hawaiian is good to, admit it!;Feeling hungry? Nothing's better than a hot pizza!"
	product_ads = "HOT PIZZA!;Just baked! Trust me!"
	vend_delay = 80
	icon_state = "pizza"
	vend_reply = "Hey, you! Go get your yummy."
	products = list(/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita = 5,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza = 5,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza = 5,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza = 5,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza = 5,
					/obj/item/storage/toolbox/fluff/lunchboxp = 10 )
	prices = list(/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita = 200,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza = 200,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza = 200,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza = 200,
					/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza=200,
					/obj/item/storage/toolbox/fluff/lunchboxp = 150 )
	premium = list(/obj/item/reagent_containers/food/snacks/warmdonkpocket = 1)
	contraband = list(/obj/item/reagent_containers/food/snacks/syndidonkpocket = 3)


/obj/machinery/vending/gunshop/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench) || istype(I, /obj/item/screwdriver))
		return
	..()


/obj/machinery/vending/gunshop
	name = "Gunshop"
	desc = "A vending machine. With guns. God bless."
	product_ads = "Guuun?Maybe you want it?;Buy some Zincum;Wanna feel safe? Well, you can!"
	icon_state = "liberationstation"
	vend_reply = "Don't forget the license!"
	products = list(/obj/item/gun/projectile/automatic/pistol/enforcer = 5,/obj/item/ammo_box/magazine/m45/enforcer45 = 10)
	prices = list(/obj/item/gun/projectile/automatic/pistol/enforcer = 2000,/obj/item/ammo_box/magazine/m45/enforcer45 = 500)
	premium = list(/obj/item/ammo_casing/rubber45)
	anchored = 1


/obj/machinery/vending/gunshop/vend(datum/data/vending_product/R, mob/user)
	..()
	var/obj/item/radio/headset/a = new /obj/item/radio/headset(src)
	a.config(list("Security" = 0))
	a.autosay("[user.name] purchased [R.product_name]", "[name]", "Security")


/obj/machinery/vending/medical_public
	name = "Public MiniMed"
	desc = "Medical supplies for everyone! Almost nearly as good as what the professionals use, kinda!"
	vend_delay = 10
	icon = 'hyntatmta/icons/obj/Vendingmed.dmi'
	icon_state = "pubmed"
	product_slogans = "It pays to be safe!;It's safest to pay! ;We've gone green! Now using 100% recycled materials! ;Address all complaints about Public MiniMed services to FILE NOT FOUND for a swift response. ; Now 80% sterilized!"
	products = list(/obj/item/reagent_containers/food/pill/patch/styptic = 3,
					/obj/item/reagent_containers/food/pill/patch/silver_sulf = 3,
					/obj/item/reagent_containers/syringe = 10,
					/obj/item/stack/medical/splint = 2,
					/obj/item/reagent_containers/syringe/insulin = 4,
					/obj/item/stack/medical/ointment/advanced = 5,
					/obj/item/stack/medical/bruise_pack/advanced = 5,
					/obj/item/reagent_containers/syringe/antiviral = 6,
					/obj/item/clothing/mask/surgical = 10,
					/obj/item/clothing/shoes/sandal/white = 10 )
	prices = list(/obj/item/reagent_containers/food/pill/patch/styptic = 150,
					/obj/item/reagent_containers/food/pill/patch/silver_sulf = 150,
					/obj/item/reagent_containers/syringe = 10,
					/obj/item/stack/medical/splint = 60,
					/obj/item/reagent_containers/syringe/insulin = 30,
					/obj/item/stack/medical/ointment/advanced = 75,
					/obj/item/stack/medical/bruise_pack/advanced = 80,
					/obj/item/reagent_containers/syringe/antiviral = 100,
					/obj/item/clothing/mask/surgical = 10,
					/obj/item/clothing/shoes/sandal/white = 10)


/obj/machinery/vending/fitness
	name = "SweatMAX"
	desc = "Fueled by your inner inadequacy!"
	icon = 'hyntatmta/icons/obj/vending.dmi'
	vend_delay = 10
	icon_state = "fitness"
	products = list(/obj/item/reagent_containers/food/condiment/milk/smallcarton = 8,
					/obj/item/reagent_containers/food/condiment/milk/smallcarton/chocolate = 8,
					/obj/item/reagent_containers/food/drinks/shaker/fitnessflask/proteinshake = 8,
					/obj/item/reagent_containers/food/snacks/candy/proteinbar = 8,
					/obj/item/reagent_containers/food/snacks/liquidfood = 8,
					/obj/item/reagent_containers/food/pill/dietpill = 8)

	prices = list(/obj/item/reagent_containers/food/condiment/milk/smallcarton = 15,
					/obj/item/reagent_containers/food/condiment/milk/smallcarton/chocolate = 15,
					/obj/item/reagent_containers/food/drinks/shaker/fitnessflask/proteinshake = 30,
					/obj/item/reagent_containers/food/snacks/candy/proteinbar = 20,
					/obj/item/reagent_containers/food/snacks/liquidfood = 25,
					/obj/item/reagent_containers/food/pill/dietpill = 30)

/obj/item/reagent_containers/food/drinks/shaker/fitnessflask
	name = "fitness shaker"
	desc = "Big enough to contain enough protein to get perfectly swole. Don't mind the bits."
	icon = 'hyntatmta/icons/obj/food/fitnesfoodsp.dmi'
	icon_state = "fitness-cup_black"
	volume = 100
	possible_transfer_amounts = "5;10;15;25"
	var/lid_color = "black"



/obj/item/reagent_containers/food/drinks/shaker/fitnessflask/proteinshake
	name = "protein shake"
	desc = "Big enough to contain enough protein to get perfectly swole. Don't mind the bits."
	volume = 100
	icon_state = "fitness-cup_black"
/obj/item/reagent_containers/food/drinks/shaker/fitnessflask/proteinshake/New()
	..()
	reagents.add_reagent("nutriment", 30)
	reagents.add_reagent("iron", 10)
	reagents.add_reagent("protein", 15)
	reagents.add_reagent("water", 45)


/obj/item/reagent_containers/food/condiment/milk/smallcarton
	name = "small milk carton"
	volume = 40
	icon = 'hyntatmta/icons/obj/food/fitnesfoodsp.dmi'
	icon_state = "mini-milk"
/obj/item/reagent_containers/food/condiment/milk/smallcarton/New()
	..()
	reagents.add_reagent("milk", 30)

/obj/item/reagent_containers/food/condiment/milk/smallcarton/chocolate/
	name = "small chocolate milk carton"
	desc = "It's milk! This one is in delicious chocolate flavour."
	volume = 40

/obj/item/reagent_containers/food/condiment/milk/smallcarton/chocolate/New()
	..()
	reagents.add_reagent("chocolate", 10)
	reagents.add_reagent("milk", 30)


/obj/item/reagent_containers/food/snacks/candy/proteinbar
	name = "protein bar"
	desc = "SwoleMAX brand protein bars, guaranteed to get you feeling perfectly overconfident."
	icon_state = "snackbar"

/obj/item/reagent_containers/food/snacks/candy/proteinbar
	name = "protein bar"
	desc = "SwoleMAX brand protein bars, guaranteed to get you feeling perfectly overconfident."
	icon = 'hyntatmta/icons/obj/food/fitnesfoodsp.dmi'
	icon_state = "proteinbar"
	bitesize = 5
	list_reagents = list("nutriment" = 9, "protein" = 4, "sugar" = 4)

/obj/item/reagent_containers/food/pill/dietpill
	name = "diet pill"
	desc = "Guaranteed to get you slim!"
	icon_state = "pill8"
	list_reagents = list("lipolicide" = 15)
