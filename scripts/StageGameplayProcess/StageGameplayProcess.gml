function StageGameplayProcess()
{	
	// Check if we should update the stage or not
	DoUpdate = !(fade_check(FadeActive) or IsPaused or Player.Death);
	
	// Process stage time
	if DoUpdate and TimeEnabled
	{
		if (++Time) == 36000
		{
			if Game.DevMode
			{
				Time = 32400;
			}
			else
			{
				player_damage(false, false, true);
			}
		}	
	}
	
	// Process animated graphics
	if AnimatedGraphics != noone
	{
		for (var i = 0; i < array_length(AnimatedGraphics); i += 2)
		{
			var AnimSpeed = !fade_check(FadeActive) and !Stage.IsPaused ? 1 / AnimatedGraphics[i + 1] : 0;
			
			sprite_set_speed(AnimatedGraphics[i], AnimSpeed, spritespeed_framespergameframe);
		}
	}
	
	// Process player death
	if Player.Death
	{
		// Disable camera and timer
		Camera.Enabled = false;
		TimeEnabled    = false;
		
		// Clear special ring data
		Game.SpecialRingData = [];
		
		// Check if player has fallen below camera boundary
		if floor(Player.PosY) >= Camera.ViewY + Game.Height + 32
		{	
			if !EventTimer
			{
				// Subtract a life
				Player.Lives -= 1;
				
				// If ran out of lives or time, start game/time over event
				if !Player.Lives or Time == 36000
				{
					IsGameOver = true;
					audio_bgm_stop(PriorityHigh, 0);
					audio_bgm_play(PriorityLow, GameOverMusic, noone);
				}
			}
			
			// Count timer
			EventTimer++;
			
			// Wait 1 or 10 seconds
			if !IsGameOver and EventTimer == 60
			or  IsGameOver and EventTimer == 600
			{
				// Fade out
				fade_perform(FadeTo, ColourBlack, 1);
				
				// Stop all music
				audio_bgm_stop(PriorityLow,  0.5);
				audio_bgm_stop(PriorityHigh, 0.5);
			}
			
			if fade_check(FadeMax)
			{	
				// If we have lives, restart the stage
				if Player.Lives != 0
				{
					room_restart();
					
					// Clear saved time if time over
					if IsGameOver
					{
						Game.Time = 0;
					}
					Game.Lives = Player.Lives;
				}
				
				// If ran out of lives, reset data
				else
				{
					Game.StarpostID     = false;
					Game.Time	        = 0;
					Game.StageBoundary  = 0;
					Game.PlayerPosition = [];
					
					// If have continues, go to continue screen
					if Game.Continues
					{
						room_goto(Continue);
					}
					
					// If not, return to menu
					else
					{
						// Override save file if not in "no save" mode
						if Game.ActiveSave != -1
						{
							gamedata_save(Game.ActiveSave, Game.Character, Stage.ZoneID, Game.Emeralds, 3, 0, 0);
						}
						room_goto(DevMenu);
					}
				}
			}	
		}
	}
}		