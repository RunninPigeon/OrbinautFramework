function GameApplicationWindowCreate()
{	
	var Width  = Game.ResolutionWidth  * Game.WindowSize;
	var Height = Game.ResolutionHeight * Game.WindowSize;
	
	window_set_size(Width, Height);
	window_set_position((display_get_width() - Width) / 2, (display_get_height() - Height) / 2);
	
	window_set_fullscreen(Game.WindowFullscreen);		
}