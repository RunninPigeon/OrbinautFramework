function InterfacePauseProcess()
{
	if Stage.IsPaused
	{
		if Input.DownPress
		{
			PauseValue[0] = loop_value(PauseValue[0] + 1, 0, PauseValue[1] ? 2 : 3);
		}
		else if Input.UpPress
		{
			PauseValue[0] = loop_value(PauseValue[0] - 1, 0, PauseValue[1] ? 2 : 3);
		}
	
		if Input.StartPress or Input.ABCPress
		{
			Input.StartPress = false;
			Input.ABCPress   = false;
			
			if PauseValue[1]
			{
				if PauseValue[0]
				{
					PauseValue[1] = 0;
					PauseValue[0] = 0;
				}
				else
				{
					audio_stop_all();
					
					if PauseValue[1] == 1
					{
						room_restart();
					}
					else
					{
						Game.StarpostID		= false;
						Game.Time			= 0;
						Game.StageBoundary  = 0;
						Game.Score		    = 0;
						Game.SpecialRingIDs = [];
						Game.PlayerPosition = [];
						
						room_goto(DevMenu);
					}
				}
			}
			else
			{
				switch PauseValue[0]
				{
					case 0:
					{
						audio_resume_all();
						
						Stage.IsPaused = false;
						Camera.Enabled  = true;
						
						instance_activate_all();
						
						/* Just like in object_act_solid, we normally don't do things like that, but it 
						needed there to avoid objects being active for 1 frame after we unpause the game */	
						with Stage 
						{
							StageObjectsActiveProcess();
						}
					}
					break;
					case 1: 
					{
						PauseValue[1] = 1;
						PauseValue[0] = 0;
					}
					break;
					case 2: 
					{
						PauseValue[1] = 2;
						PauseValue[0] = 0;
					}
					break;
				}
			}
		}
	}
	else if Stage.AllowPause and Input.StartPress
	{
		Stage.IsPaused	 = true;
		Input.StartPress = false;
		Camera.Enabled   = false;

		audio_pause_all();
	}
}