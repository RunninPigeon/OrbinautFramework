function ObjComboScoreMain()
{
	// Select frame
	if Player.ScoreCombo == 0
	{
		ScoreFrame = 1;
	}
	else if Player.ScoreCombo < 2
	{
		ScoreFrame = 2;
	}
	else if Player.ScoreCombo < 3
	{
		ScoreFrame = 3;
	}
	else if Player.ScoreCombo < 4
	{
		ScoreFrame = 4;
	}
	else if Player.ScoreCombo < 16
	{
		ScoreFrame = 5;
	}
	else							
	{
		ScoreFrame = 6;
	}
	
	// Play animation
	animation_set_frame(sprite_index, ScoreFrame);
	
	// Move object
	Ysp  += 0.09375;
	PosY += Ysp;
	
	object_update_position(x, PosY);
	
	// Delete object when it stopped
	if Ysp == 0
	{
		instance_destroy();
	}
}