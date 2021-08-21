function ObjOrbossMain()
{
	/// @description Insert description here
// You can write your code in this editor
	
	// Timer
	if (StateTimer) StateTimer--;

	// State
	switch State
	{
		// Appear
		case 0:
			PosY++;
			if !StateTimer
			{
				State = 1;
				image_index = 0;
			}
			if (StateTimer = 50) OrbossOrb.State = 3;
		break;
		
		// Green State
		case 1:
			AngleX = (AngleX + 3) mod 360;
			AngleY = (AngleY + 6) mod 360;
			Spin   = (Spin   + 1) mod 360;
			if !(--Delay)
			{
				var PPosX = floor(Player.PosX);
				var Dest = PPosX + 32 * (PPosX > BossTrigger.x ? -1 : 1);
				if (Dest > PosX) PosX++;
				else if (Dest < PosX) PosX--;
			}
		break;
		
		// Damage
		case 2:
			if StateTimer
			{
				if (StateTimer = 45) image_index = 1;
			}
			else
			{
				 State = 3;
				 StateTimer = 450;
			}
		break;
		
		// Red State
		case 3:
			if StateTimer
			{	
				// Attack 1
				if HP mod 2
				{
					if (StateTimer == 350 or StateTimer == 200) Delay = 50;
					if ((StateTimer < 350 and StateTimer >= 300) or (StateTimer < 200 and StateTimer >= 150)) and !(StateTimer mod 10)
					{
						var ID = id;
						var Fire = instance_create_depth(x, y, depth - 1, OrbossFire);
						with Fire
						{
							Type = 1;
							Parent = ID;
							image_xscale = 0;
							image_yscale = 0;
							Angle = (ID.StateTimer mod 50 + 10) * 2;
							Timer = 60; 
						}
						Fire = instance_create_depth(x, y, depth - 1, OrbossFire);
						with Fire
						{
							Type = 1;
							Parent = ID;
							image_xscale = 0;
							image_yscale = 0;
							Angle = -(ID.StateTimer mod 50 + 10) * 2;
							Timer = 60;
						}
						
						audio_sfx_play(sfxBossFlame2, false);
					}
				}
				
				// Attack 2
				else
				{
					if (StateTimer == 365 or StateTimer == 265 or StateTimer == 165) Delay = 30;
					if StateTimer == 350 or StateTimer == 250 or StateTimer == 150
					{
						var ID = id;
						for (var i = 0; i < 10; i++)
						{
							var Fire = instance_create_depth(x, y, depth - 1, OrbossFire);
							with Fire
							{
								Type = 2;
								Parent = ID;
								image_xscale = 0;
								image_yscale = 0;
								Angle = i * 36;
								switch ID.StateTimer
								{
									case 350: Spin =  0 break;
									case 250: Spin =  1 break;
									case 150: Spin = -1 break;
								}
							}
						}
						
						audio_sfx_play(sfxBossFlame, false);
					}
				}
				
				// Fire effect around the boss
				if StateTimer mod 8 == 1
				{	
					var RandAng = irandom(360);
					if StateTimer > 50
					{
						var ID = id;
						var Fire = instance_create_depth(x + 25 * dsin(RandAng), y + 25 * dcos(RandAng), depth - 1, OrbossFire);
						with Fire
						{
							DistX = 25 * dsin(RandAng);
							DistY = 25 * dcos(RandAng);
							Parent = ID;
						}
					}
					else
					{
						instance_create_depth(x + 25 * dsin(RandAng), y + 25 * dcos(RandAng), depth - 1, OrbossSmoke);
					}
				}
				
				// Follow player
				if !(--Delay)
				{
					var PPosX = floor(Player.PosX);
					if (PPosX > PosX) PosX++;
					else if (PPosX < PosX) PosX--;
				}
				
				// Drop Orbs
				if StateTimer = 50
				{
					OrbossOrb.State = 3;
					Spin   = 0;
					AngleX = 0;
					AngleY = 0;
				}
			}
			else
			{
				image_index = 0;
				State = 1;
			}
		break;
		
		// Destroy
		case 4:
			if StateTimer mod 8 == 1
			{	
				// Spawn explosion and play sound
				instance_create(x + irandom(50) - 25, y + irandom(50) - 25, DustExplosion);
				audio_sfx_play(sfxDestroy, false);
			}
			
			if !StateTimer
			{
				// Tell the controller boss was defeated
				BossTrigger.BossDefeated = true;
				instance_destroy(OrbossOrb);
				instance_destroy();
			}
		break;
	}
	
	// Lower boss for Knuckles
	var KnuxOffset = Player.CharacterID == CharKnuckles ? 16 : 0;
	
	// Sin movement
	if (State) SinMove = (SinMove + 2) mod 360;
	
	// Random movement (when getting damage)
	var ROffsetX = State == 2 ? irandom(4) - 2 : 0;
	var ROffsetY = State == 2 ? irandom(4) - 2 : 0;
	
	// Update position
	x = floor(PosX + ROffsetX);
	y = floor(PosY + ROffsetY + dsin(SinMove) * 8) + KnuxOffset;
	
	// Hit
	if HP and State == 1 and !StateTimer
	{
		if object_act_enemy(EnemyBoss)
		{
			if (--HP)
			{
				State = 2;
				StateTimer = 96;
				
			}
			
			// Destroy when no HP left
			else
			{
				State = 4;
				StateTimer = 300;
				image_index = 2;
			}
			
			OrbossOrb.State = 2;
			object_flash_trigger(12, 4);
		}
	}
}