function StageObjectsActiveProcess() 
{		
	if DoUpdate
	{
		with all
		{
			if variable_instance_exists(id, "Obj_LoadFlag")
			{	
				// Get object position
				var ObjectX = floor(x);
				var ObjectY = floor(y);
			
				// Get load bounds
				var LeftBound   = Camera.ViewX - Obj_LoadX;
				var TopBound    = Camera.ViewY - Obj_LoadY;
				var RightBound  = Camera.ViewX + Game.Width  + Obj_LoadX;
				var BottomBound = Camera.ViewY + Game.Height + Obj_LoadY;
			
				// Check if the object is off-boundaries
				if ObjectX < LeftBound or ObjectX > RightBound
				or ObjectY < TopBound  or ObjectY > BottomBound
				{
					if Obj_LoadFlag != false
					{
						// Was object on the screen before?
						if Obj_LoadState
						{
							// Unload object...
							if Obj_LoadFlag == TypeUnload
							{
								instance_deactivate_object(id);
							}
							
							// ...or reset it to its initial state
							else if Obj_LoadFlag == TypeReset
							{
								if Obj_LoadData[0] < Camera.ViewX - Obj_LoadX or Obj_LoadData[0] > Camera.ViewX + Game.Width + Obj_LoadX
								{
									x			 = Obj_LoadData[0];
									y			 = Obj_LoadData[1];
									image_xscale = Obj_LoadData[2];
									image_yscale = Obj_LoadData[3];
								
									event_perform(ev_create,     0);
									event_perform(ev_room_start, 0);
								}
								instance_deactivate_object(id);
							}
						
							// ... or delete completely
							else if Obj_LoadFlag == ResetDelete
							{	
								instance_destroy(id);
							}
						}
					
						// If object wasn't on the screen yet, unload
						else
						{
							instance_deactivate_object(id);
						}
					}
				}
			
				// If object is inside the boundaries and has the reset flag, allow unload actions
				else if Obj_LoadFlag != false and !Obj_LoadState
				{
					Obj_LoadState  = true;		
				}
			}
		}
	}
	
	// Activate unloaded objects inside of the largest region
	instance_activate_region(Camera.ViewX - 128, Camera.ViewY - 256, Game.Width + 256, Game.Height + 512, true);
}