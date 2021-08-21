function ObjRingMain()
{
	// Play animation
	animation_play_sync(sprite_index, 8);
		
	// Check for being magnetized
	if !Magnetized
	{
		if Player.BarrierType == BarrierThunder and distance_to_object(Player) <= 64
		{
			Magnetized = true;
		}
	}
	else
	{
		// Set ring acceleration
		var RingAcceleration = [0.75, 0.1875];
			
		// Set relative positions
		var RelativeX = sign(floor(Player.PosX) - x);
		var RelativeY = sign(floor(Player.PosY) - y);
	
		// Check relative movement
		var MoveX = (sign(Xsp) == RelativeX);
		var MoveY = (sign(Ysp) == RelativeY);
	
		// Increase speed and move ring
		Xsp  += (RingAcceleration[tx] * MoveX);
		Ysp  += (RingAcceleration[ty] * MoveY);
		PosX += Xsp;
		PosY += Ysp;
			
		// Update position
		object_update_position(PosX, PosY);
	}
	
	// Check for hitbox collision
	if !Player.Hurt and Player.InvincibilityFrames < 90 and object_player_overlap(Hitbox)
	{	
		// Add 1 to ring counter
		Player.Rings++;
		
		// Grant extra life
		if Player.Rings >= 100 and Player.LivesRewards == 0
		or Player.Rings >= 200 and Player.LivesRewards == 1
		{
			Player.Lives++;
			Player.LivesRewards++;
			audio_bgm_play(PriorityHigh, ExtraLifeJingle, noone);
		}
		
		// Play sound
		audio_sfx_play(Player.Rings mod 2 == 0 ? sfxRingLeft : sfxRingRight, false);
	
		// Create sparkle object in place of ring
		instance_create(x, y, RingSparkle);	
		instance_destroy();	
	}
}