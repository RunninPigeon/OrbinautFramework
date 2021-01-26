function PlayerSlopeDetach() 
{
	if MovementLock = 0
	{
		if !Game.StrongerSlopeDetach
		{
			// If we're on steep enough slope and going slowly
			if Angle >= 45 and Angle <= 315 and abs(Inertia) < 2.5
			{	
				// Lock controls for 30 frames
				MovementLock = 30;
			
				// If floor angle is not that steep then slide down, else fall off
				if Angle < 90 or Angle > 270
				{        
					if (Angle < 90)  Inertia -= 0.5;
					if (Angle > 270) Inertia += 0.5;
				}
				else
				{
					Grounded = false;
				}				
			}   
		}
		else
		{	
			// If we're on steep enough slope and going slowly
			if CollisionMode != 0 and abs(Inertia) < 2.5
			{	
				// Reset inertia, lock controls for 30 frames and go airborne
				Inertia      = 0;
				Grounded     = false;
				MovementLock = 30;
			}
		}
	}
}