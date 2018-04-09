var/datum/controller/db_reconnect/db_reconnect

/datum/controller/db_reconnect
	var/timerbuffer = 0 //buffer for time check

/datum/controller/db_reconnect/New()
	timerbuffer = (3000)
	processing_objects += src

/datum/controller/db_reconnect/Destroy()
	processing_objects -= src

/datum/controller/db_reconnect/proc/process()
	if(time_till_auto_recconect() <= 0)
		dbcon.Disconnect()
		failed_db_connections = 0

		if(!establish_db_connection())
			message_admins("Warning! Auto Database reconnection failed: " + dbcon.ErrorMsg())
		else
			message_admins("Auto Database reconnection has been successful")
			timerbuffer += (6000)

/datum/controller/db_reconnect/proc/time_till_auto_recconect()
	return timerbuffer - (round_start_time ? world.time - round_start_time : 0) - (600)