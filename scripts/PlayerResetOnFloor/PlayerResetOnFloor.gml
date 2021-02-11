function PlayerResetOnFloor()
{	
	// If grounded flag has been set to true when we've been airborne, we have landed
	if Grounded
	{	
		// Reset radiuses and adjust position
		yRadius = yRadiusDefault; 
		xRadius	= xRadiusDefault;
		PosY -= (Rolling or Jumping) * 5;
		
		// Reset flags
		Rolling	 = false;
		Jumping	 = false;
		Pushing  = false;
		
		// Reset hurt state
		if Hurt
		{
			Grv			 = 0.21875;
			Inertia		 = 0;
			isInvincible = 120;
			Hurt		 = false;			
		}
	}
}