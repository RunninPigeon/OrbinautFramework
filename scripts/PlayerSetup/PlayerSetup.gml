function PlayerSetup()
{	
	// Set character
	CharacterID	= Game.GlobalCharacter;
	
	// Default sprite setup
	Facing	  = DirRight;
	Animation = AnimIdle;
	DrawOrder = layer_get_depth("Objects");
	
	// Set basic constants
	Acc		= 0.046875;
	Frc     = 0.046875;
	AirAcc  = 0.09375;
	RollFrc = 0.0234375;
	Dec		= 0.5;
	RollDec = 0.125;
	Grv		= 0.21875;
	TopAcc	= 6;
	JumpMin = -4;
	Jump    = CharacterID == CharKnuckles ? 6 : 6.5;
	
	// Set default flags
	AllowCollision = true;
	Grounded	   = true;
	OnObject	   = false;
	Jumping		   = false;
	Rolling	       = false;
	Pushing		   = false;
	Hurt		   = false;
	Death		   = false;
	MovementLock   = false;
	isSuper		   = false;
	isInvincible   = false;
	isUnderwater   = false;
	PeeloutRev     = -1;
	SpindashRev    = -1;
	DropdashRev    = -1;
	
	// Set collision radiuses
	if CharacterID != CharTails
	{
		yRadiusDefault = 19;
		xRadiusDefault = 9;
		yRadiusRoll    = 14;
		xRadiusRoll    = 7;
	}
	else
	{
		yRadiusDefault = 15;
		xRadiusDefault = 9;
		yRadiusRoll    = 14;
		xRadiusRoll    = 7;
	}
	xRadius = xRadiusDefault;
	yRadius = yRadiusDefault;
	
	// Load stats
	Score    = Game.GlobalScore;
	Lives    = Game.GlobalLives;
	Emeralds = Game.GlobalEmeralds;
	Conts    = Game.GlobalConts;
	Rings    = 0;
	
	// Set spawn properties
	if Game.SavedPosition == 0
	{
		if Game.StageTransferX != 0
		{
			PosX = Spawnpoint.x + (Game.StageTransferX - Spawnpoint.x);
		}
		else
		{
			PosX = Spawnpoint.x;
		}
		PosY = Spawnpoint.y;
	}
	else
	{
		PosX = Game.SavedPosition[0];
		PosY = Game.SavedPosition[1];
	}
	
	PlayerPositionX = ds_list_create();
	PlayerPositionY = ds_list_create();
	var ind = 0;
	repeat (32) 
    {
		PlayerPositionX[| ind++] = PosX;
		PlayerPositionY[| ind]   = PosY;
	}
	
	// Create Tails' tails
	if (CharacterID == CharTails) instance_create_depth(x, y, depth, TailsObject);
}