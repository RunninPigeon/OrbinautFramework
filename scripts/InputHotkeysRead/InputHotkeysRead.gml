function InputHotkeysRead()
{	
	if room != DevMenu && room != GameStart
	{
		// Room restart
		if keyboard_check_pressed(vk_f1) 
		{
			Game.SavedCheckpoint = Stage.LastCheckpoint;
			audio_stop_all();
			room_restart();
		}
	
		// Game restart
		if keyboard_check_pressed(vk_f2) 
		{
			game_restart();
		}
	
		// Low FPS mode
		if keyboard_check_pressed(vk_f3) 
		{
			game_set_speed(game_get_speed(gamespeed_fps) == 60 ? 3 : 60, gamespeed_fps);
		}
	
		// Debug view
		if keyboard_check_pressed(vk_f4) 
		{
			Screen.EnableDebug = Screen.EnableDebug ? false : true;
		}
	
		// Set stage timer
		if keyboard_check_pressed(vk_f5) 
		{
			Stage.Time = 35900
		}
	
		// Player
		if keyboard_check_pressed(ord("X")) 
		{
			Player.Inertia = 20 * Player.Facing;
		}
		if keyboard_check_pressed(ord("C")) 
		{
			Player.Inertia += 10 * Player.Facing;
		}
		if keyboard_check_pressed(ord("G")) 
		{
			Player.HighSpeedBonus = 1500;
		}
		if keyboard_check_pressed(ord("H")) 
		{
			Player.Grounded = false;
			Player.Ysp      = -16;
		}
	
		// Ignore input mode
		if keyboard_check_pressed(ord("L")) 
		{
			IgnoreInput = true;
			ResetInput  = true;
		}
	
		// Window resize
		if keyboard_check_pressed(vk_numpad1) 
		{
			Game.WindowSize = 1; 
			window_set_size(Game.ResolutionWidth * Game.WindowSize, Game.ResolutionHeight * Game.WindowSize);
		}
		if keyboard_check_pressed(vk_numpad2) 
		{
			Game.WindowSize = 2; 
			window_set_size(Game.ResolutionWidth * Game.WindowSize, Game.ResolutionHeight * Game.WindowSize);
		}
		if keyboard_check_pressed(vk_numpad3) 
		{
			Game.WindowSize = 3; 
			window_set_size(Game.ResolutionWidth * Game.WindowSize, Game.ResolutionHeight * Game.WindowSize);
		}
		if keyboard_check_pressed(vk_numpad4) 
		{
			Game.WindowSize = 4; 
			window_set_size(Game.ResolutionWidth * Game.WindowSize, Game.ResolutionHeight * Game.WindowSize);
		}	
	}
}