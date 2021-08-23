function PlayerPowerup()
{
	// Handle highspeed bonus
	if HighspeedBonus
	{	
		if !(--HighspeedBonus)
		{
			if audio_bgm_is_playing(HighspeedMusic)
			{
				audio_bgm_play(PriorityLow, Stage.StageMusic, other);
			}
		}	
	}
	
	// Handle invincibility bonus
	if InvincibleBonus 
	{
		// Create star particles
		if InvincibleBonus == 1200 and !instance_exists(InvincibilityStar)
		{
			for (var i = 1; i < 9; i++)
			{
				var Object = instance_create(PosX, PosY, InvincibilityStar);
					Object.ID = i;
			}
			with InvincibilityStar 
			{
				sprite_index = ID mod 2 ? spr_obj_invstar_type1 : spr_obj_invstar_type2;
				image_index  = ID;
			}
		}
		if !(--InvincibleBonus)
		{
			if audio_bgm_is_playing(InvincibilityMusic)
			{
				audio_bgm_play(PriorityLow, Stage.StageMusic, other);
			}
		}
	}
	
	// Decrease invincibility frames timer
	if InvincibilityFrames and !Hurt
	{
		InvincibilityFrames--;
	}
}