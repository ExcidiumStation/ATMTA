/turf/simulated/frostland
  name = "snow"
  icon = 'icons/turf/snow.dmi'
  icon_state = "snow"
  baseturf = /turf/simulated/frostland
  temperature = 200 // 200K/-73.15C

/turf/simulated/frostland/New()
  icon_state = "[initial(icon_state)][rand(0,6)]"

/obj/structure/deepsnow
  name = "deep snow"
  icon_state = "deepsnow-cover"
  layer = ABOVE_ALL_MOB_LAYER
  var/turf/simulated/frostland/deepsnow/parent

/turf/simulated/frostland/deepsnow
  name = "deep snow"
  icon_state = "deepsnow"
  var/obj/structure/deepsnow/cover

/turf/simulated/frostland/deepsnow/New()
  cover = new /obj/structure/deepsnow(loc)
  cover.parent = src

/turf/simulated/frostland/ice
  name = "ice"
  icon_state = "ice"
  wet = TURF_WET_ICE
