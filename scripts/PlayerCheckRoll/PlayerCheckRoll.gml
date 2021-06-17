function PlayerCheckRoll()
{
	// You are not able to roll if side direction button is pressed
	if Input.Left or Input.Right
	{
		exit;
	}

	// Start rolling if we're moving fast enough and are not gliding
	if Input.Down or ForcedRoll
	{
		if !Game.LooseCrouch and abs(Inertia) >= 0.5 
		or  Game.LooseCrouch and abs(Inertia) >= 1
		{
			// Update radiuses
			yRadius = yRadiusRoll;
			xRadius	= xRadiusRoll;
			PosY   += yRadiusDefault - yRadiusRoll;
			
			// Set rolling flag
			Rolling = true;
			
			// Set animation
			Animation = AnimRoll;
			
			// Play sound
			audio_sfx_play(sfxRoll, false);
		}
	}	
}