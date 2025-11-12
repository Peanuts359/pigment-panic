if (!global.timer_active) {
	instance_destroy();
}

if (global.grade == Grade.GOLD or global.grade == Grade.MASTERPIECE) {
	instance_destroy();
}
