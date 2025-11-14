img_instance = noone
level_started = false
for (var i = 0; i < array_length(global.LevelTutorialSeen); i += 1) {
	if global.LevelTutorialSeen[i] {
		level_started = true
		break
	}
}
if not level_started {
	instance_destroy()	
}