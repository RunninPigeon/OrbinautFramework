function PlayerKnuxWallClimb()
{
	// Exit the code if we've died
	if Death or Drown
	{
		exit;
	}
	
	// Exit if we're not climbing
	if !ClimbState
	{
		exit;
	}
	
	/* Knuckles climb code completely overrides air collision code,
	   so AirLevelCollision is not performed */
	   
	// Set 'climb' animation
	Animation = AnimClimb;
	
	// Climb on walls
	if ClimbState == 1
	{
		// Move up and down and all around
		if Input.Up
		{
			Ysp = -ClimbSpeed;
		}
		else if Input.Down
		{
			Ysp = ClimbSpeed;
		}
		else
		{
			Ysp = 0;
		}
		
		// Check for ceiling if moving upwards
		if Ysp < 0
		{
			// Are we touching the ceiling?
			var RoofDistance = tile_check_collision_v(floor(PosX + RadiusX * Facing), floor(PosY - DefaultRadiusY), false, true, Layer)[0];	
			if  RoofDistance < 0
			{	
				// Clip out
				PosY -= RoofDistance;
			
				// Reset Ysp
				Ysp = 0;
			}
		}
	
		// Check for floor if moving downwards
		else
		{
			// Are we touching the floor?
			var FloorDistance = tile_check_collision_v(floor(PosX + 10 * Facing), floor(PosY + DefaultRadiusY), true, false, Layer)[0];	
			if  FloorDistance < 0
			{	
				// Reset Ysp
				Ysp = 0;
		
				// Restore default collision radiuses
				RadiusX = DefaultRadiusX;
				RadiusY = DefaultRadiusY;
				
				// Clip out and land
				PosY    += FloorDistance;
				Grounded = true;
				
				// Exit the code
				exit;
			}
		}
		
		// Check for collision with walls
		var DistanceAbove = tile_check_collision_h(floor(PosX + RadiusX * Facing), floor(PosY - RadiusY - 1), Facing, true, Layer)[0];
		var DistanceBelow = tile_check_collision_h(floor(PosX + RadiusX * Facing), floor(PosY + RadiusY),     Facing, true, Layer)[0];
		
		// Check if we do not find the wall in front of us
		if DistanceBelow > 0
		{
			// Leave climb state
			ClimbState = false;
			GlideState = GlideDrop;
			
			// Reset gravity
			if !IsUnderwater
			{
				Grv	= 0.21875;
			}
			else
			{
				// Lower by 0x28 (0.15625) if underwater
				Grv = 0.0625
			}
			
			// Set 'drop' animation
			Animation = AnimGlideDrop;
				
			// Restore default collision radiuses
			RadiusX = DefaultRadiusX;
			RadiusY = DefaultRadiusY;
		}
		
		// Check if we're near the edge to climb on it
		else if DistanceAbove > 0
		{
			// Climb the edge
			ClimbState = 2;
			Ysp		   = 0;
			
			// Disable all collisions
			AllowCollision = false;
		}
				
		// Check if we pressed A, B or C buttonzzzzzzz
		else if Input.ABCPress
		{
			// Leave climb state
			ClimbState = false;
			Jumping	   = true;
			
			// Set speeds
			Ysp	= -4;
			Xsp	= -4 * Facing;
			
			// Reset gravity
			if !IsUnderwater
			{
				Grv	= 0.21875;
			}
			else
			{
				// Lower by 0x28 (0.15625) if underwater
				Grv = 0.0625
			}
			
			// Set 'roll' animation
			Animation = AnimRoll;
				
			// Play sound
			audio_sfx_play(sfxJump, false);
		}
	}
		
	// Check if we're climbering on the edge
	else if ClimbState == 2
	{
		// Set 'climbering' animation
		Animation = AnimClimbering;
		
		// Force reset vertical speed
		Ysp = 0;
			
		// Start climbering timer
		ClimbValue++;
			
		// Frame 2
		if ClimbValue == 7
		{
			PosX += 3 * Facing;
			PosY -= 3;
		}
			
		// Frame 3
		else if ClimbValue == 13
		{
			PosX += 8 * Facing;
			PosY -= 10;
		}
			
		// Frame 4
		else if ClimbValue == 19
		{
			PosX -= 8 * Facing;
			PosY -= 12;
		}
			
		// Frame 5
		else if ClimbValue == 25
		{
			// Set flags
			AllowCollision = true;
			Grounded	   = true;
			
			// Reset state
			ClimbState = false;
			ClimbValue = false;
			
			// Final position update
			PosX += 8 * Facing;
			PosY += 4;
		}
	}
}