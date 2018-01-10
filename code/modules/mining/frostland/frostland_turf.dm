#define ARCTIC_ATMOSPHERE 77.31
#define T_ARCTIC 223.65 //- 49.5 Celcius, taken from South Pole averages
#define MOLES_ARCTICSTANDARD (ARCTIC_ATMOSPHERE*CELL_VOLUME/(T_ARCTIC*R_IDEAL_GAS_EQUATION)) //Note : Open air tiles obviously aren't 2.5 meters in height, but abstracted for now with infinite atmos
#define MOLES_O2STANDARD_ARCTIC MOLES_ARCTICSTANDARD*MOLES_O2STANDARD	//O2 standard value (21%)
#define MOLES_N2STANDARD_ARCTIC MOLES_ARCTICSTANDARD*MOLES_O2STANDARD	//N2 standard value (79%)

/turf/simulated/floor/frostland
  name = "snow"
  icon = 'icons/turf/snow.dmi'
  icon_state = "snow"
  baseturf = /turf/simulated/floor/frostland
  temperature = T_ARCTIC // 100K/-173.15C
  oxygen = MOLES_O2STANDARD
  nitrogen = MOLES_N2STANDARD

/turf/simulated/floor/frostland/pry_tile(obj/item/C, mob/user, silent = TRUE)
  return src

/turf/simulated/floor/frostland/snow/New()
  ..()
  icon_state = "[initial(icon_state)][rand(0,6)]"

/obj/structure/deepsnow
  name = "deep snow"
  icon = 'icons/turf/snow.dmi'
  icon_state = "deepsnow-cover"
  layer = MOB_LAYER + 0.2
  var/turf/simulated/floor/frostland/deepsnow/parent

/turf/simulated/floor/frostland/deepsnow
  name = "deep snow"
  icon_state = "deepsnow"
  var/obj/structure/deepsnow/cover

/turf/simulated/floor/frostland/deepsnow/New()
  cover = new /obj/structure/deepsnow(src)
  cover.parent = src

/turf/simulated/floor/frostland/ice
  name = "ice"
  icon_state = "ice"
  wet = TURF_WET_ICE

/turf/simulated/floor/frostland/ice/New()
  temperature = T_ARCTIC
