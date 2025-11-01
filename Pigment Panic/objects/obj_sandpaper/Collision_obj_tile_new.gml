if (other.colliding == false) {
    // This code only runs on the FIRST frame of the collision.
    other.damage()
    
    // Set the colliding variable to true so the code doesn't run again.
    other.colliding = true;
	other.alarm[2] = 300
}

if (other.fill_status == 1) {
	speed_mult = 0.5
} else {
	speed_mult = 1
}