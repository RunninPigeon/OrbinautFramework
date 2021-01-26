function InputHotkeysRead()
{	
	// Room restart
	if keyboard_check_pressed(vk_f1) 
	{
		Game.SavedCheckpoint = Stage.LastCheckpoint;
		room_restart();
	}
	
	// Game restart
	if keyboard_check_pressed(vk_f2) 
	{
		game_restart();
	}
	
	// Low FPS mode
	if keyboard_check(vk_f3) 
	{
		game_set_speed(3, gamespeed_fps);
	}
	else 
	{
		game_set_speed(60, gamespeed_fps);
	}
	
	// Debug view
	if keyboard_check_pressed(vk_f4) 
	{
		if Screen.EnableDebug
		{
			Screen.EnableDebug = false;
		} 
		else 
		{
			Screen.EnableDebug = true;
		}
	}
	
	// Show stage collision
	if keyboard_check_pressed(vk_f5) 
	{
		if StageCollision.visible 
		{
			StageCollision.visible = false;
		} 
		else 
		{
			StageCollision.visible = true;
		}
	}
	
	// Player acceleration
	if keyboard_check_pressed(ord("X")) 
	{
		Player.Inertia = 20 * Player.Facing;
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