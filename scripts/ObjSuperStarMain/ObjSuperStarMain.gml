function ObjSuperStarMain()
{
	// Follow player if flag is set (basically, first star spawned)
	if FollowPlayer
	{
		x = floor(Player.PosX);
		y = floor(Player.PosY);
	}
	
	// Play animation
	animation_play(sprite_index, 2, 6);
	
	// Destroy and create new object on animation end
	if image_index == 5
	{
		if abs(Player.Inertia) >= Player.TopAcc
		{
			instance_create(floor(Player.PosX), floor(Player.PosY), SuperStar);
		}
		instance_destroy();
	}	
}