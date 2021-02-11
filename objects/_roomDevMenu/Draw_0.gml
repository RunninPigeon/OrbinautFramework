/// @description Options
// You can write your code in this editor
	
	var Timer = TextTimer div 3;
	var Print = TextPrint div 2;
	var MTimer = MainTimer div 3;
	var MPrint = MainPrint div 2;
	
	// Get centre
	var X = Game.ResolutionWidth / 2;
	var Y = Game.ResolutionHeight / 2;
	
	// Set font to use in the room
	draw_set_halign(fa_center);
	
	// Display framework title
	string_display(X, Y - 75, string_distort("ORBINAUT FRAMEWORK", MPrint, MTimer), 1);
	string_display(X, Y - 65, string_distort("START MENU", MPrint, MTimer), 1);	
				
	switch MenuState
	{
		// Display menu 0 (main)
		case 0:
		{	
			draw_set_halign(fa_center);
			
			string_display(X, Y - 15, string_distort("STAGE SELECT", Print, Timer), 1);
			string_display(X, Y,	  string_distort("OPTIONS", Print, Timer), 1);
			string_display(X, Y + 15, string_distort("CLOSE GAME", Print, Timer), 1);
		}
		break;
		
		// Display menu 1 (stage select)
		case 1:
		{
			draw_set_halign(fa_left);
			
			string_display(X - 80, Y - 15, string_distort("MOONLIGHT BASE ZONE", Print, Timer), 1);
			string_display(X - 80, Y,	   string_distort("BACK", Print, Timer), 1);
		}
		break;
		
		// Display menu 2 (options)
		case 2:
		{	
			draw_set_halign(fa_center);
			
			string_display(X, Y - 15, string_distort("GAMEPLAY", Print, Timer), 1);
			string_display(X, Y,	  string_distort("VIDEO AND AUDIO", Print, Timer), 1);
			string_display(X, Y + 15, string_distort("INPUT", Print, Timer), 1);
			string_display(X, Y + 30, string_distort("BACK", Print, Timer), 1);
		}
		break;
		
		// Display menu 3 (framework options)
		case 3:
		{
			draw_set_halign(fa_left);
			
			string_display(X - 80, Y - 15, string_distort("SPINDASH", Print, Timer), 1);
			string_display(X - 80, Y,	   string_distort("DROPDASH", Print, Timer), 1);
			string_display(X - 80, Y + 15, string_distort("SUPER PEEL OUT", Print, Timer), 1);
			string_display(X - 80, Y + 30, string_distort("BACK", Print, Timer), 1);
			
			string_display(X + 65, Y - 15, string_distort(Game.SpindashEnabled ? "ON" : "OFF", Print, Timer), 1);
			string_display(X + 65, Y,	   string_distort(Game.DropdashEnabled ? "ON" : "OFF", Print, Timer), 1);
			string_display(X + 65, Y + 15, string_distort(Game.PeeloutEnabled  ? "ON" : "OFF", Print, Timer), 1);
		}
		break;
		
		// Display menu 4 (video and audio options)
		case 4:
		{
			draw_set_halign(fa_left);
			
			string_display(X - 80, Y - 15, string_distort("ASPECT RATIO", Print, Timer), 1);
			string_display(X - 80, Y,      string_distort("WINDOW SIZE", Print, Timer), 1);
			string_display(X - 80, Y + 15, string_distort("FULLSCREEN", Print, Timer), 1);
			string_display(X - 80, Y + 30, string_distort("MUSIC VOLUME", Print, Timer), 1);
			string_display(X - 80, Y + 45, string_distort("SOUND VOLUME", Print, Timer), 1);
			string_display(X - 80, Y + 60, string_distort("BACK", Print, Timer), 1);
			
			string_display(X + 50, Y - 15, string_distort(Game.ResolutionWidth == 398 ? "16:9" : "4:3", Print, Timer), 1);
			string_display(X + 50, Y,	   string_distort(string(Game.WindowSize) + "X", Print, Timer), 1);
			string_display(X + 50, Y + 15, string_distort(Game.WindowFullscreen ? "ON" : "OFF", Print, Timer), 1);
			string_display(X + 50, Y + 30, string_distort(string(Game.MusicVolume), Print, Timer), 1);
			string_display(X + 50, Y + 45, string_distort(string(Game.SoundVolume), Print, Timer), 1);
		}
		break;
		
		// Display menu 5 (input options)
		case 5:
		{
			draw_set_halign(fa_left);
			
			string_display(X - 80, Y, string_distort("BACK", Print, Timer), 1);
		}
		break;
	}