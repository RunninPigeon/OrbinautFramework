function ObjRollTriggerMain()
{	
	// Check for overlap
	if object_player_overlap(Triggerbox)
	{
		if !Active
		{
			// Set flags
			Active			   = true;
			Player.FlightState = false;
			Player.GlideState  = false;
			Player.Grounded    = true;
			Player.ForcedRoll  = true;
			
			// Reset gravity
			if !Player.IsUnderwater
			{
				Player.Grv = 0.21875;
			}
			else
			{
				// Lower by 0x28 (0.15625) if underwater
				Player.Grv = 0.0625
			}
		}
	}
	
	// Reset
	else if Active
	{
		Active			  = false;
		Player.ForcedRoll = false;
	}
}