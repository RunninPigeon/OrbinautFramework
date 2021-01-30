function PlayerCollideFloor()
{	
	// Do not collide with floor when on object
	if OnObject exit;
	
	// Collide with floor basing on angle position
	switch AnglePosition
	{
		case PositionFloor:
		{	
			// Set coordinates
			var xLeft  = floor(PosX - xRadius);
			var yLeft  = floor(PosY + yRadius);
			var xRight = floor(PosX + xRadius);
			var yRight = floor(PosY + yRadius);
			
			// Get floor distances
			var dLeft  = colmask_get_distance_v(xLeft, yLeft, true, TileSize)
			var dRight = colmask_get_distance_v(xRight, yRight, true, TileSize)

			// Define distance and angle to use
			if dLeft <= dRight
			{
				var Distance   = dLeft;
				var FloorAngle = colmask_get_angle_v(xLeft, yLeft, true);
			}
			else
			{
				var Distance   = dRight;
				var FloorAngle = colmask_get_angle_v(xRight, yRight, true);
			}
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			
			// Collide
			if Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -TileSize * 2
			{
				PosY += Distance;
				Angle = FloorAngle;
			}
		}
		break;
		case PositionRightwall:
		{	
			// Set coordinates
			var xLeft  = floor(PosX + yRadius);
			var yLeft  = floor(PosY + xRadius);
			var xRight = floor(PosX + yRadius);
			var yRight = floor(PosY - xRadius);
			
			// Get floor distances
			var dLeft  = colmask_get_distance_h(xLeft, yLeft, true, TileSize)
			var dRight = colmask_get_distance_h(xRight, yRight, true, TileSize)

			// Define distance and angle to use
			if dLeft <= dRight
			{
				var Distance   = dLeft;
				var FloorAngle = colmask_get_angle_h(xLeft, yLeft, true);
			}
			else
			{
				var Distance   = dRight;
				var FloorAngle = colmask_get_angle_h(xRight, yRight, true);
			}
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;

			// Collide
			if Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -TileSize * 2
			{
				PosX += Distance;
				Angle = FloorAngle;
			}
		}
		break;
		case PositionRoof:
		{	
			// Set coordinates
			var xLeft  = floor(PosX + xRadius);
			var yLeft  = floor(PosY - yRadius);
			var xRight = floor(PosX - xRadius);
			var yRight = floor(PosY - yRadius);
			
			// Get floor distances and angles
			var dLeft  = colmask_get_distance_v(xLeft, yLeft, false, TileSize)
			var dRight = colmask_get_distance_v(xRight, yRight, false, TileSize)
			
			// Define distance and angle to use
			if dLeft <= dRight
			{
				var Distance   = dLeft;
				var FloorAngle = colmask_get_angle_v(xLeft, yLeft, false);
			}
			else
			{
				var Distance   = dRight;
				var FloorAngle = colmask_get_angle_v(xRight, yRight, false);
			}
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Xsp)), 14) : 14;
			
			// Collide
			if Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -TileSize * 2
			{
				PosY -= Distance;
				Angle = FloorAngle;
			}
		}
		break;
		case PositionLeftwall:
		{	
			// Set coordinates
			var xLeft  = floor(PosX - yRadius);
			var yLeft  = floor(PosY - xRadius);
			var xRight = floor(PosX - yRadius);
			var yRight = floor(PosY + xRadius);
			
			// Get floor distances and angles
			var dLeft  = colmask_get_distance_h(xLeft, yLeft, false, TileSize)
			var dRight = colmask_get_distance_h(xRight, yRight, false, TileSize)
			
			// Define distance and angle to use
			if dLeft <= dRight
			{
				var Distance   = dLeft;
				var FloorAngle = colmask_get_angle_h(xLeft, yLeft, false);
			}
			else
			{
				var Distance   = dRight;
				var FloorAngle = colmask_get_angle_h(xRight, yRight, false);
			}
			
			// Calculate collision tolerance
			CollisionDistance = Game.SpeedFloorClip ? min(4 + abs(floor(Ysp)), 14) : 14;

			// Collide
			if Distance > CollisionDistance
			{
				Grounded = false;
			}
			else if Distance > -TileSize * 2
			{
				PosX -= Distance;
				Angle = FloorAngle;
			}
		}
		break;
	}	
}