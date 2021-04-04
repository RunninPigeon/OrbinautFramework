/// @function object_check_tile(xLeft, yLeft, xRight, yRight, angRange)
function object_check_tile(xLeft, yLeft, xRight, yRight, angRange)
{	
	// Report script error if wrong argument set
	if angRange > 3
	{
		show_message("Wrong angRange argument set in 'object_check_tile' function for object ID " + string(id) + ". Expected 0 (RangeFloor), 1 (RangeRWall), 2 (RangeRoof) or 3 (RangeLWall)");
		game_end();
	}
	
	// Get collision layers
	var colLayer = Stage.TileLayer[LayerA] or Stage.TileLayer[LayerB];
	
	// Collide based on given angle range
	switch angRange
	{
		case RangeFloor:
		{	
			// Get floor distances
			var dLeft  = tile_get_distance_v(xLeft, yLeft, colLayer, true, false);
			var dRight = tile_get_distance_v(xRight, yRight, colLayer, true, false);
			
			// Collide using closest one
			var floorDistance = dLeft <= dRight ? dLeft : dRight;
			if  floorDistance < 14 and floorDistance > -14
			{
				y += floorDistance;	
			}
		}
		break;
		case RangeRWall:
		{
			// Get floor distances
			var dLeft  = tile_get_distance_h(xLeft, yLeft, colLayer, true, false);
			var dRight = tile_get_distance_h(xRight, yRight, colLayer, true, false);
			
			// Collide using closest one
			var floorDistance = dLeft <= dRight ? dLeft : dRight;
			if  floorDistance < 14 and floorDistance > -14
			{
				x += floorDistance;
			}
		}
		break;
		case RangeRoof:
		{	
			// Get floor distances
			var dLeft  = tile_get_distance_v(xLeft, yLeft, colLayer, false, false);
			var dRight = tile_get_distance_v(xRight, yRight, colLayer, false, false);
			
			// Collide using closest one
			var floorDistance = dLeft <= dRight ? dLeft : dRight;
			if  floorDistance < 14 and floorDistance > -14
			{
				y -= floorDistance;
			}
		}
		break;
		case RangeLWall:
		{
			// Get floor distances
			var dLeft  = tile_get_distance_h(xLeft, yLeft, colLayer, false, false);
			var dRight = tile_get_distance_h(xRight, yRight, colLayer, false, false);
			
			// Collide using closest one
			var floorDistance = dLeft <= dRight ? dLeft : dRight;
			if  floorDistance < 14 and floorDistance > -14
			{
				x -= floorDistance;
			}
		}
		break;		
	}	
}