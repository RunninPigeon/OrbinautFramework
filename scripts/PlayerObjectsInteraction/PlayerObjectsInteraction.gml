function PlayerObjectsInteraction()
{	
	// Do not collide if we're not allowed to
	if !AllowCollision exit;
	
	// Get player's position
	var PlayerX      = floor(PosX);
	var PlayerY		 = floor(PosY);
	
	// Define player's solid objects collision mask
	var PlayerLeft   = floor(PosX - 10);
	var PlayerRight  = floor(PosX + 10);
	var PlayerTop    = floor(PosY - yRadius);
	var PlayerBottom = floor(PosY + yRadius);
	
	// Define player's hitbox size
	var HitboxLeft   = floor(PosX - 8);
	var HitboxRight  = floor(PosX + 8);			     
	var HitboxTop	 = floor(PosY - yRadius + 3);
	var HitboxBottom = floor(PosY + yRadius - 3);
	
	// Create object lists
	var objList1 = ds_list_create();
	var objList2 = ds_list_create();
	var objList3 = ds_list_create();
	
	// Check for overlapping all objects with our hitbox
	var objNumb1 = collision_rectangle_list(HitboxLeft, HitboxTop, HitboxRight, HitboxBottom, Objects, false, true, objList1, false);
	if  objNumb1 > 0
	{ 
		for (var i = 0; i < objNumb1; ++i;)
		{ 
			var Obj = objList1[| i];
			if variable_instance_exists(Obj, "GotPlayerHitbox")
			{	
				// This variable resets in hitbox_collision. So we're basically checking if we touched the object from our side,
				// and when it is in "touched" state, it checks if we are still overlapping it from its side when using hitbox_collision. 
				// Optimization stuff ¯\_(ツ)_/¯
				Obj.GotPlayerHitbox = true;
			}
		} 
	} 
	
	// Check for overlapping solid objects with our solidbox
	var objNumb2 = collision_rectangle_list(PlayerLeft, PlayerTop, PlayerRight, PlayerBottom, Objects, false, true, objList2, false);
	if  objNumb2 > 0
	{
		for (var k = 0; k < objNumb2; ++k;)
		{
			var solidObj = objList2[| k];
			if variable_instance_exists(solidObj, "Solidity")
			{	
				// Collide horizontally, but only if it is full solid object and we're on horizontal axis
				if solidObj.Solidity = SolidAll and abs(solidObj.x - PlayerX) > abs(solidObj.y - PlayerY - 4)
				{
					// Collide on the left
					if PlayerX < solidObj.x
					{
						if Xsp > 0
						{
							Xsp		= 0;
							Inertia = 0;
						}
						PosX -= PlayerRight - solidObj.bbox_left + 1;
					}
			
					// Collide on the right
					else
					{
						if Xsp < 0
						{
							Xsp		= 0;
							Inertia = 0;
						}
						PosX += solidObj.bbox_right - PlayerLeft + 1;
					}
				}

				// Collide vertically, but check if we're on vertical axis if object is full solid
				if !Grounded 
				{
					if solidObj.Solidity = SolidAll and abs(solidObj.x - PlayerX) <= abs(solidObj.y - PlayerY - 4) 
					or solidObj.Solidity = SolidTop
					{
						// Try to land on the object
						if PlayerY < solidObj.y
						{
							if Ysp > 0 and solidObj.bbox_top - PlayerBottom > -16
							{	
								if  Game.ImprovedObjCollision 
								or !Game.ImprovedObjCollision and (PlayerX > solidObj.bbox_left and PlayerX < solidObj.bbox_right)
								{
									Ysp		 = 0;
									Angle    = 0;
									Inertia  = Xsp;
									Grounded = true;	
									OnObject = solidObj;
								}
							}
						}
				
						// Collide from the bottom if it is full solid object
						else
						{
							if Ysp < 0 and solidObj.Solidity = SolidAll
							{
								Ysp   = 0;
								PosY += solidObj.bbox_bottom - PlayerTop + 1;
							}
						}
					}
				}
			}
		}
	}
	
	// Check for solid objects 4 pixels below us while we're grounded
	if Grounded
	{
		var objNumb3 = instance_position_list(PlayerX, PlayerBottom + 4, Objects, objList3, false);
		if  objNumb3 > 0
		{
			for (var j = 0; j < objNumb3; ++j;)
			{
				var newSolidObj = objList3[| j];
				if variable_instance_exists(newSolidObj, "Solidity")
				{
					if newSolidObj.bbox_top - PlayerBottom > -16
					{
						OnObject = newSolidObj;
					}
				}
			}
		}
	}
	
	// Collide with solid object we're currently standing on
	if OnObject
	{	
		if PlayerRight < OnObject.bbox_left or PlayerLeft > OnObject.bbox_right
		{
			OnObject = false;
		}
		else
		{
			PosY -= PlayerBottom - OnObject.bbox_top + 1;	
		}
	}
	
	// Delete object lists
	ds_list_destroy(objList1);			
	ds_list_destroy(objList2);
	ds_list_destroy(objList3);
}