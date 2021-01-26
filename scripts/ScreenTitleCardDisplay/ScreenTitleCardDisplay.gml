function ScreenTitleCardDisplay() 
{	
	// Exit the script when the timer is higher than this value and increase it
	if (CardTimer = 224) exit;
	
	// Start timer
	++CardTimer;
	
	// Check if title card is enabled for this stage
	if Stage.CardEnabled = false 
	{	
		if CardTimer = 10
		{	
			Input.IgnoreInput = false;
			Stage.TimeEnabled = true;
			Screen.EnableHUD  = true;
			screen_fade_perform(from, black, 1);
		}
		if CardTimer > 10 and OffsetHUD[0] < 0
		{
			OffsetHUD[0] += 5;
		}
		exit;
	}
	
	// Set a font to use 
	string_set_font(Game.Font[3], "right");
	
	// Elements appear
	if CardTimer < 200 
	{ 	
		// Ribbon
		if CardValue[1] < -30 and CardTimer > 15 
		{
			CardValue[1] += 20;
		}
		
		// Zone name
		if CardValue[2] < 260 and CardValue[1] = -30 
		{
			CardValue[2] += 26;
		}
		
		// "Zone"
		if CardValue[4] < 260 and CardValue[2] = 260
		{
			CardValue[4] += 26;
		}
		
		// Act number
		if CardValue[4] = 260 and CardValue[8] < 1 
		{
			CardValue[8] += 0.2
		}
		
		// Fade in
		if CardTimer = 120 
		{
			screen_fade_perform(from, black, 1);
		}
			
		// Restore input and enable stage timer
		if CardTimer = 170 
		{
			Input.IgnoreInput = false;
			Stage.TimeEnabled = true;
		}
			
	} 
	
	// Elements disappear
	else 
	{	
		CardValue[1] -= 20;
		CardValue[2] -= 16;
		CardValue[4] += 16;
		CardValue[7] -= 20;
	}
		
	// Move HUD
	if CardTimer > 130 and OffsetHUD[0] < 0 
	{
		OffsetHUD[0] += 5;
		EnableHUD     = true;
	}
	
	// Display sprites on coordinates
	draw_sprite(sprHUD_TitleCardRibbon, Player.CharacterID,  CardValue[0],  CardValue[1]);
	draw_sprite_ext(sprHUD_TitleCardAct, 0,  CardValue[6],  CardValue[7], CardValue[8], 1, 0, c_white, 1);
	string_display( CardValue[2],  CardValue[3], CardString[0], 1);
	string_display( CardValue[4],  CardValue[5], CardString[1], 1);
	
}