function StageActUpdate()
{	
	// Reset stage transition data
	if State = ActStateDefault and Game.StageTransitions
	{
		Game.StageTransferX = 0;
		Game.StageTransferY = 0;
	}
	
	// Restart the act upon player death
	// TODO: Correct stateTimer timings
	if Player.Death and State != ActStatePlayerDeath
	{
		CameraEnabled = false;
		TimeEnabled   = false;
		StateTimer	  = 0;
		State		  = ActStatePlayerDeath;	
	}
	if State == ActStatePlayerDeath
	{
		if floor(Player.PosY) > Screen.RenderY + Screen.Height + 128
		{
			StateTimer++;
			if StateTimer == 1
			{
				fade_perform(to, black, 1);
				audio_bgm_stop(StageMusic, 0.5);
			}
			if StateTimer == 30
			{
				room_restart();
			}
		}
	}
	
	// Check for act end
	if State == ActStateFinished
	{	
		// Stop music
		audio_bgm_stop(StageMusic, 2);
		
		// Disable time, reset state timer and saved checkpoint
		if TimeEnabled
		{
			TimeEnabled			 = false;
			StateTimer			 = 0;
			Game.SavedCheckpoint = 0;
			Game.SavedPosition   = 0;			
		}
		
		// Count timer
		var timeUntilResults = Stage.ActID ? 360 : 160;
		if StateTimer != timeUntilResults and StateTimer != -1
		{
			StateTimer++;
		}
		
		// Trigger results when correct time reached
		else if Player.Grounded
		{
			// Stop player and disable input
			Player.Xsp        = 0;
			Player.Ysp        = 0;
			Player.Inertia    = 0;	
			Input.IgnoreInput = true;
			Input.ResetInput  = true;

			// Start results
			StateTimer = -1;
		}
	}
	
	// Proceed time counter
	if (TimeEnabled) Time++;
	
	// Proceed animation timer
	if State != ActStateLoading and State != ActStatePlayerDeath and State != ActStateUnload
	{
		AnimationTime++;
	}	
}